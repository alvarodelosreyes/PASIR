provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
}

resource "helm_release" "jenkins-alvaro" {
  name = "jenkins-alvaro"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  namespace  = "jenkins"
  values = [file("values.yaml"),]
 
  set {
    name  = "replicaCount"
    value = 1
  }
  depends_on = [
    kubernetes_namespace.jenkins,
  ]

}
resource "kubernetes_namespace" "jenkins" {
  provider = kubernetes
  metadata {
    name = "jenkins"

    labels = {
      name        = "jenkins"
      description = "jenkins"
    }
  }
}
