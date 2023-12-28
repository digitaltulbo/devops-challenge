provider "helm" {
  kubernetes {
    host                   = aws_eks_cluster.eks.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.eks.certificate_authority[0].data)
    config_path            = "~/.kube/config"
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.eks.id]
      command     = "aws"
    }
  }
}

provider "kubernetes" {
  host                   = aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.eks.certificate_authority[0].data)
  config_path            = "~/.kube/config"
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.eks.id]
    command     = "aws"
  }
}
# ALB 컨트롤러 설치
resource "helm_release" "aws-load-balancer-controller" {
  name = "aws-load-balancer-controller"

  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"
  version    = "1.4.1"

  set {
    name  = "clusterName"
    value = aws_eks_cluster.eks.id
  }

  set {
    name  = "image.tag"
    value = "v2.4.2"
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.aws_load_balancer_controller.arn
  }

  depends_on = [
    aws_eks_node_group.nodes_general,
    aws_iam_role_policy_attachment.aws_load_balancer_controller_attach
  ]
}

# Metrics Server
resource "helm_release" "metrics_server" {
  namespace        = "kube-system"
  name             = "metrics-server"
  chart            = "metrics-server"
  version          = "3.8.2"
  repository       = "https://kubernetes-sigs.github.io/metrics-server/"
  create_namespace = true
  set {
    name  = "replicas"
    value = "1"
  }
  depends_on = [
    aws_eks_node_group.nodes_general,
    aws_iam_role_policy_attachment.aws_load_balancer_controller_attach
  ]
}
# Create argocd nampespace
resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
    
  }
  depends_on = [
    aws_eks_node_group.nodes_general,
    aws_iam_role_policy_attachment.aws_load_balancer_controller_attach
  ]
}
# Install argocd helm chart using terraform
resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  # version    = "5.24.1"
  namespace  = kubernetes_namespace.argocd.metadata.0.name
  values     = [templatefile("./argocd/install.yaml", {})]
  depends_on = [
    kubernetes_namespace.argocd
  ]
}

# argocd 암호를 argocd-login.txt 파일에 저장
resource "null_resource" "password" {
  provisioner "local-exec" {
    working_dir = "./argocd"
    command     = "kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath={.data.password} | base64 -d > argocd-login.txt"
  }
}