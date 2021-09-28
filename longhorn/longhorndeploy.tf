
resource "kubernetes_namespace" "Longhorn-namespace" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "longhorn" {
  name       = "longhorn"
  repository = "https://charts.longhorn.io"
  chart      = "longhorn"
  namespace  = var.namespace
  set {
                name  = "csi.kubeletRootDir"
                value = "/var/lib/kubelet"
                type  = "string"
        }


}
