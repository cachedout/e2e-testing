
terraform {
  required_providers {
    ec = {
      source  = "elastic/ec"
      version = "0.2.1"
    }
  }
}

provider "ec" {
   endpoint = "https://staging.found.no/"
}

resource "random_id" "instance_id" {
  byte_length = 8
}

resource "ec_deployment" "end-to-end" {
  name                   = "end-to-end-${random_id.instance_id.hex}"
  region                 = "gcp-us-central1"
  version                = "8.0.0-SNAPSHOT"
  deployment_template_id = "gcp-io-optimized-v2"

  elasticsearch {}

  kibana {}

  apm {}
}