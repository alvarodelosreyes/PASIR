provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
resource "helm_release" "prometheus" {
  name             = "prom"
  chart            = "kube-prometheus-stack"
  repository       = "https://prometheus-community.github.io/helm-charts"
  namespace        = "monitoring"
  version          = "17.1.3"
  create_namespace = true
  set {
    name  = "service.externalPort"
    value = 80
  }

  set {
    name  = "replicaCount"
    value = 1
  }
}
