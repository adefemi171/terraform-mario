# Cluster Config Variables
minikube_driver    = "docker"
cluster_name       = "minikube"
kubernetes_version = "v1.28.3"
cache_images       = true
cluster_addons = [
  "ingress",
  "metrics-server",
  "dashboard",
  "storage-provisioner",
  "default-storageclass",
]
cluster_cpus      = 4
cluster_disk_size = "50g"
cluster_memory    = "8192"
cluster_nodes     = "3"
