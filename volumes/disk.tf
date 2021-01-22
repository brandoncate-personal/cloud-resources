
resource "google_compute_disk" "for_each_ssd_disk" {

  count = length(var.disks)
  name = "${var.kube_cluster}-${count.index}"
  size = var.disks[count.index].size
  zone  = var.zone

}

resource "google_compute_disk_resource_policy_attachment" "attachment" {

  count = length(google_compute_disk.for_each_ssd_disk)

  name = google_compute_resource_policy.policy.name
  disk = google_compute_disk.for_each_ssd_disk[count.index].name
  zone = var.zone
}

resource "google_compute_resource_policy" "policy" {
  name   = "policy"
  region = var.region
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

