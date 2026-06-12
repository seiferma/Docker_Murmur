variable "VERSION" {
  # renovate: datasource=repology depName=alpine_3_24/mumble-server versioning=loose
  default = "1.5.857-r2"
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
