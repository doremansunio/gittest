terraform {
  required_providers {
    rafay = {
      source = "RafaySystems/rafay"
      version = "1.1.22"
    }
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "github" {
   token = "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"
   owner = "doremansunio"
}

provider "aws" {
    region = "ap-south-1"
}

# # resource "local_file" "netpolicy-file" {
# #   //depends_on = [ rafay_cluster_sharing.demo-terraform-specific ]
# #   //depends_on = [rafay_groupassociation.group-association]
# #   filename = "${var.project_name}-within-ws-rule.yaml"
# #   content = templatefile("${path.module}/net-policy-template.yaml", {
# #     project_name = var.project_name
# #   })
# # }



# resource "github_repository_file" "netgitfile" {
# #   repository          = "/"
# #   branch              = "main"
# #   file                = "${var.project_name}-within-ws-rule.yaml"
# #   content             = local_file.netpolicy-file.content
# #   commit_message      = "Managed by Terraform"
# #   overwrite_on_create = true
#     repository = "gittest"
#     branch= "main"
#     file="loca_file.yaml"
#     content = data.template_file.example.rendered
# }


# provider "github" {
#   token   = "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"
#   owner   = "doremansunio"
# }

resource "github_repository_file" "readme" {
  repository     = "gittest"
  branch = "main"
  file           = "README.md"
  content        = "# Awesome Project\nThis is an Awesome Project1!"
  overwrite_on_create = true
}

data "template_file" "example" {    
    template = file("${path.module}/net-policy-template.yaml")
    vars = {
        project_name = var.project_name
    }
}

# output "test" {
  
#     value = file("${path.module}/net-policy-template.yaml")
# }

# resource "local_file" "netpolicy-file" {
#   //depends_on = [ rafay_cluster_sharing.demo-terraform-specific ]
#   //depends_on = [rafay_groupassociation.group-association]
#   filename = "${path.module}/${var.project_name}-within-ws-rule.yaml"
#   content = templatefile("${path.module}/net-policy-template.yaml", {
#     project_name = var.project_name
#   })
# }

# data "aws_s3_bucket" "bukname" {
#     bucket = "rafay-s3-bucket"
# }



# resource "aws_s3_object" "s3file" {
#     bucket = "rafay-s3-bucket" //data.aws_s3_bucket.bukname.bucket
#     key = "my-folder/${var.project_name}-within-ws-rule.yaml"
#     content = data.template_file.example.rendered     
# }

# output "test" {
  
#     value = file(aws_s3_object.s3file.)
# }


