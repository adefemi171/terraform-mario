output "mario_cluster_client_certificate" {
  value     = minikube_cluster.mario_cluster.client_certificate
  sensitive = true
}

output "mario_cluster_client_key" {
  value     = minikube_cluster.mario_cluster.client_key
  sensitive = true
}

output "mario_cluster_ca_certificate" {
  value     = minikube_cluster.mario_cluster.cluster_ca_certificate
  sensitive = true
}

output "mario_cluster_host" {
  value = minikube_cluster.mario_cluster.host
}

output "mario_cluster_id" {
  value = minikube_cluster.mario_cluster.id
}
