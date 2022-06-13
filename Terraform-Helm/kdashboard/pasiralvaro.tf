provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "kubernetes-dashboard-alvaro" {

  name = "kubernetes-dashboard-alvaro"

  repository = "https://kubernetes.github.io/dashboard/"
  chart      = "kubernetes-dashboard"
  namespace  = "kubedash"

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "protocolHttp"
    value = "true"
  }

  set {
    name  = "service.externalPort"
    value = 80
  }

  set {
    name  = "replicaCount"
    value = 1
  }

  set {
    name  = "rbac.clusterReadOnlyRole"
    value = "true"
  }
}
