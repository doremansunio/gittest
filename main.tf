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
  }
}

# provider "github" {
#   #token = "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"  
# }

provider "aws" {
  
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

# resource "github_repository_file" "readme" {
#   repository     = "gittest"
#   file           = "README.md"
#   content        = "# Awesome Project\nThis is an Awesome Project1!"
#   overwrite_on_create = true
# }

data "template_file" "example" {
    template = file("${path.module}/net-policy-template.yaml")
    vars = {
        project_name = var.project_name
    }
}

resource "local_file" "netpolicy-file" {
  //depends_on = [ rafay_cluster_sharing.demo-terraform-specific ]
  //depends_on = [rafay_groupassociation.group-association]
  filename = "${var.project_name}-within-ws-rule.yaml"
  content = templatefile("${path.module}/net-policy-template.yaml", {
    project_name = var.project_name
  })
}

resource "aws_s3_object" "s3file" {
    bucket = "rafay-s3-bucket/my-folder/"
    key="${var.project_name}-within-ws-rule.yaml"
    source = local_file.netpolicy-file.filename
    acl="private"
  
}

output "test" {
    value = file("${path.module}/net-policy-template.yaml")
}
