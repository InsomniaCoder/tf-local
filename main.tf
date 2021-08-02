resource "kubernetes_namespace" "db-ns" {
  metadata {
    name = "db"
  }
}

resource "helm_release" "redis-release" {
  name       = "local-redis-release"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "redis"
  version    = "14.8.7"
  namespace  = kubernetes_namespace.db-ns.metadata[0].name
}