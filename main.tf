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