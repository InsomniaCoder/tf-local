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

resource "null_resource" "tekton-ci" {

  depends_on = [
    kubernetes_namespace.devops
  ]

  provisioner "local-exec" {
    command = "kubectl apply -f https://storage.googleapis.com/tekton-releases/pipeline/previous/${var.tekton-ci-version}/release.yaml"
  }
}