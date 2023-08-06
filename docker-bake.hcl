variable "VERSION" {
  default = "1.4.287-r4"
}

group "default" {
  targets = ["default"]
}

target "default" {
  tags = ["quay.io/seiferma/murmur:${VERSION}", "quay.io/seiferma/murmur:latest"]
  args = {
    VERSION = "${VERSION}"
  }
}
