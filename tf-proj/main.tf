terraform {
  required_providers {
    buildkite = {
      source  = "buildkite/buildkite"
      version = "0.0.18"
    }
  }
}

provider "buildkite" {
}

resource "buildkite_pipeline" "test" {
  name       = "Test 1"
  repository = "https://github.com/buildkite/terraform-provider-buildkite.git"

  steps = ""
}

resource "buildkite_pipeline_schedule" "foo" {
  pipeline_id = buildkite_pipeline.test.id
  cronline    = "0 *  * * *"
  label       = "My schedule"
  branch      = "master"
}

