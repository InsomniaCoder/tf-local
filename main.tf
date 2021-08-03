resource "kubernetes_namespace" "devops" {
  metadata {
    name = "devops"
  }
}

resource "helm_release" "metrics-server" {
  count = 0
  name       = "local-metrics-server"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "metrics-server"
  version    = var.metrics-server-version
  namespace  = kubernetes_namespace.devops.metadata.0.name
}

resource "null_resource" "tekton-operator" {
  provisioner "local-exec" {
    command = <<-EOT
      kubectl apply -f https://storage.googleapis.com/tekton-releases/operator/${var.tekton-operator-version}/release.yaml
      kubectl apply -f https://raw.githubusercontent.com/tektoncd/operator/main/config/crs/kubernetes/config/all/operator_v1alpha1_config_cr.yaml
    EOT
  }
}