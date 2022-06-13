provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "nginx-alvaro" {
  name             = "nginx-alvaro"
  chart            = "nginx"
  repository       = "https://charts.bitnami.com/bitnami"
  namespace        = "servidorweb"
  create_namespace = true
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
    value = 2
  }
}
