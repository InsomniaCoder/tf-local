resource "null_resource" "tekton-operator" {
  provisioner "local-exec" {
    command = <<-EOT
      kubectl apply -f https://storage.googleapis.com/tekton-releases/operator/${var.tekton-operator-version}/release.yaml
      kubectl apply -f https://raw.githubusercontent.com/tektoncd/operator/main/config/crs/kubernetes/config/all/operator_v1alpha1_config_cr.yaml
    EOT
  }
}


resource "null_resource" "tekton-tasks" {
  depends_on = [
    null_resource.tekton-operator
  ]
  provisioner "local-exec" {
    command = <<-EOT
      tkn hub install task git-clone
      //terraform-cli
      kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/master/task/terraform-cli/0.2/terraform-cli.yaml
      kubectl apply -f ./tekton/tasks/terraform-cli/terraform-secret.yaml
    EOT
  }
}

resource "null_resource" "tekton-pipelines" {
  depends_on = [
    null_resource.tekton-tasks
  ]
  provisioner "local-exec" {
    command = <<-EOT
      kubectl apply -f ./tekton/infra-pipeline.yaml
    EOT
  }
}


