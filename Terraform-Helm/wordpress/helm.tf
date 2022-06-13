provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
resource "helm_release" "mysql" {
 name  = "mysql"
 chart = "/root/charts/mysql-chart"
}
resource "helm_release" "wordpress1" {
 name  = "wordpress1"
 chart = "/root/charts/wordpress-chart"
}
