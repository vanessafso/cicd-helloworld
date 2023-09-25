resource "kubernetes_namespace" "example" {
  metadata {
    name = "staging"
  }
}

resource "kubernetes_deployment" "example" {
  metadata {
    name = "terraform-example"
    labels = {
      test = "HelloWorldApp"
    }
    namespace = "staging"
  }

  spec {
    replicas = 20

    selector {
      match_labels = {
        test = "HelloWorldApp"
      }
    }

    template {
      metadata {
        labels = {
          test = "HelloWorldApp"
        }
      }

      spec {

        container {
          image = "hello-world/v2"
          name  = "example"
          image_pull_policy = "Never"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

        }
      }
    }
  }
}

resource "kubernetes_service" "example" {
  metadata {
    name = "terraform-example"
    namespace = "staging"
  }

  spec {
    selector = {
      test = "HelloWorldApp"
    }

    port {
      port = 80
    }

  }
}
