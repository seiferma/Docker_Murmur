variable "VERSION" {
  # renovate: datasource=repology depName=alpine_3_22/murmur versioning=loose
  default = "1.5.735-r3"
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
