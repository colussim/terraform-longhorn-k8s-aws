terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

provider "kubernetes" {
        config_path    = "~/Documents/App/Terraform/terraform-longhorn-k8s-aws/kubeconfig/config"
        config_context = "kubernetes-admin@k8s02"
        }

provider "helm" {
  kubernetes {
    config_path = "~/Documents/App/Terraform/terraform-longhorn-k8s-aws/kubeconfig/config"
  }
}
