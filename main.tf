resource "google_cloud_run_v2_service" "cloud_run_oom_example" {
  name     = "cloud-run-oom-example"
  location = "us-central1"
  project  = var.project_id

  template {
    containers {
      image = "us-central1-docker.pkg.dev/perry-agent-test/agent-poc/cloud-run-oom-example:f6801d9"
    }
    scaling {
      min_instance_count = 0
      max_instance_count = 100
    }
    service_account = "cloud-run-oom-example-sa@perry-agent-test.iam.gserviceaccount.com"
    timeout         = "300s"
  }
}
