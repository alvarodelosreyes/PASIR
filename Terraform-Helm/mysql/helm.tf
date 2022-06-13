provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
resource "helm_release" "mysql" {
 name  = "mysql"
 chart = "/root/charts/mysql-chart"
}
