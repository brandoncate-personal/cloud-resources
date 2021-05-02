# Description
This repo contains the scripts used to create the gcp and aws resources

## TODO
Add checkov and tfsec scans (possible use soluble's iacbot)

## Volumes
terraform script used to create volumes with a scheduled snapshot cycle

## Storage
terraform script used to create a gcp storage bucket. Currently all terraform state is stored inside this created bucket.

## Istio
### GKE
terraform scripts used to create gke cluster

### Remote Istio Installer
sh script (run with docker) used to install istio on a remote gcp cluster

### Domain AWS
terraform scripts used to configure route53 domain and dns to point to external cluster id
