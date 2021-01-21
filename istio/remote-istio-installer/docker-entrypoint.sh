#!/usr/bin/env bash

gcloud auth login
gcloud container clusters get-credentials $CLUSTER_NAME --project $PROJECT_NAME --region $REGION
istioctl install --set profile=demo -y
kubectl label namespace default istio-injection=enabled --overwrite

# get meta information (can be used for terraform output later)
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')

echo $( jq -n \
                  --arg bn "$INGRESS_HOST" \
                  --arg on "$INGRESS_PORT" \
                  --arg tl "$SECURE_INGRESS_PORT" \
                  '{INGRESS_HOST: $bn, INGRESS_PORT: $on, SECURE_INGRESS_PORT: $tl}' )