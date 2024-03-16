module "mario_cluster" {
  source = "./mario-cluster"

  minikube_driver    = var.minikube_driver
  cluster_name       = var.cluster_name
  kubernetes_version = var.kubernetes_version
  cache_images       = var.cache_images
  cluster_addons     = var.cluster_addons
  cluster_cpus       = var.cluster_cpus
  cluster_disk_size  = var.cluster_disk_size
  cluster_memory     = var.cluster_memory
  cluster_nodes      = var.cluster_nodes
}

resource "kubernetes_deployment" "mario_deployment" {
  metadata {
    name = "mario-deployment"
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "infinite-mario"
      }
    }
    template {
      metadata {
        labels = {
          App = "infinite-mario"
        }
      }
      spec {
        container {
          name              = "local-mario"
          image             = "ghcr.io/adefemi171/mario-terraform:latest"
          image_pull_policy = "Always"

          port {
            container_port = 80
          }

          # resources {
          #   limits = {
          #     cpu    = "0.5"
          #     memory = "512Mi"
          #   }
          #   requests = {
          #     cpu    = "250m"
          #     memory = "50Mi"
          #   }
          # }
        }
      }
    }
  }

  depends_on = [module.mario_cluster]
}

resource "kubernetes_service" "mario_service" {
  metadata {
    name = "mario-svc"
  }
  spec {
    selector = {
      app = "infinite-mario"
    }
    port {
      port        = 80
      target_port = 80
      protocol    = "TCP"
    }
    type = "ClusterIP"
  }

  depends_on = [module.mario_cluster]
}

