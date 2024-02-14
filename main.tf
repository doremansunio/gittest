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

provider "github" {
  #token = "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"  
}

resource "local_file" "netpolicy-file" {
  //depends_on = [ rafay_cluster_sharing.demo-terraform-specific ]
  //depends_on = [rafay_groupassociation.group-association]
  filename = "${var.project_name}-within-ws-rule.yaml"
  content = templatefile("${path.module}/net-policy-template.yaml", {
    project_name = var.project_name
  })
}

resource "null_resource" "name1" {
    provisioner "local-exec" {
      command = "echo 'the contnet'"
    }

    triggers = {
      always_run ="${timestamp()}"
    }
  
}

resource "github_repository_file" "netgitfile" {
#   repository          = "/"
#   branch              = "main"
#   file                = "${var.project_name}-within-ws-rule.yaml"
#   content             = local_file.netpolicy-file.content
#   commit_message      = "Managed by Terraform"
#   overwrite_on_create = true
    repository = "doemansunio/gittest"
    file="loca_file.txt"
    content = "local_file.txt"
}


