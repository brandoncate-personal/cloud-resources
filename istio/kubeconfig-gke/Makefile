include .env
export

docker-build:
	docker build -t $(image-name):$(image-version) .

docker-push:
	docker push $(image-name):$(image-version)

gcloud-login:
	docker run -ti --name $(creds-image-name) google/cloud-sdk gcloud auth login

docker-run:
	docker run \
	--volumes-from $(creds-image-name) \
	-v $$(pwd)/kubeconfig:/kubeconfig \
	-e GET_CMD="gcloud container clusters describe $(cluster-name) --project $(project-name) --region $(region)" \
	-e CLUSTER_NAME=$(cluster-name) \
	--rm $(image-name):$(image-version)
