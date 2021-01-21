variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

variable "zone" {
  description = "zone"
}

variable "kube_cluster" {
  description = "name of kubernetes cluster"
}

variable "disks" {
  description = "all disks created"
  type = list(object({
    size = number
  }))
}