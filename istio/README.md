# How To Use

This set of four scripts are used to setup an kubernetes cluster with istio on GCP

1) Run 'gke' terraform script to setup gke cluster
2) Run 'Kubeconfig-gke' make script to setup remote kubeconfig file used in later scripts
3) Run 'remote-istio-installer' make script which uses remote kubeconfig to install istio on gke cluster
4) Run domain-aws terraform script to update the dns record to new gke cluster