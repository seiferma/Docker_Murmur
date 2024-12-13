variable "VERSION" {
  default = "1.5.634-r0"
}

group "default" {
  targets = ["default"]
}

target "default" {
  platforms = ["linux/amd64", "linux/arm64"]
  tags = ["quay.io/seiferma/murmur:${VERSION}", "quay.io/seiferma/murmur:latest"]
  args = {
    VERSION = "${VERSION}"
  }
}
