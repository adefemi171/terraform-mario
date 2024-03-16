provider "kubernetes" {
  host = module.mario_cluster.mario_cluster_host

  client_certificate     = module.mario_cluster.mario_cluster_client_certificate
  client_key             = module.mario_cluster.mario_cluster_client_key
  cluster_ca_certificate = module.mario_cluster.mario_cluster_ca_certificate
}
