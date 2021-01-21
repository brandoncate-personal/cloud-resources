resource "google_compute_disk_resource_policy_attachment" "attachment" {
  name = google_compute_resource_policy.policy.name
  disk = google_compute_disk.ssd.name
  zone = "us-east1-c"
}

resource "google_compute_disk" "ssd" {
  name  = "my-disk"
  image = data.google_compute_image.my_image.self_link
  size  = 50
  type  = "pd-ssd"
  zone  = "us-east1-c"
}


resource "google_compute_resource_policy" "policy" {
  name   = "policy"
  region = "us-east1"
  snapshot_schedule_policy {
    schedule {
      daily_schedule {
        days_in_cycle = 1
        start_time     = "02:00"
      }
    }
    retention_policy {
      max_retention_days    = 3
      on_source_disk_delete = "KEEP_AUTO_SNAPSHOTS"
    }
  }
}

data "google_compute_image" "my_image" {
  family  = "debian-9"
  project = "debian-cloud"
}