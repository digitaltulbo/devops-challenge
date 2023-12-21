terraform {

# terraform 클라우드는 사용하지 않을 것이므로 주석
  # cloud {
  #   workspaces {
  #     name = "devlink-terraform-eks"
  #   }
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.7.0"
    }
  }
}
