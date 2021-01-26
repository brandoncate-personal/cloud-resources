include .env
export

docker-build:
	docker build -t $(builder-name):$(builder-version) .

docker-push:
	docker push $(builder-name):$(builder-version)

docker-run:
	docker run \
	-v $(key_location_local):$(key_location_vm) \
	-e GOOGLE_APPLICATION_CREDENTIALS=$(key_location_vm)/$(key_filename_local) \
	-e KUBECONFIG=./kubeconfig.yaml \
	--rm $(builder-name):$(builder-version)
