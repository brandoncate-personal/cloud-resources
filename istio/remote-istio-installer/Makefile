include .env
export

docker-build:
	docker build -t $(builder-name):$(builder-version) .

docker-push:
	docker push $(builder-name):$(builder-version)

docker-run:
	docker run \
	-v $(key_location_local):/usr/local/keys \
	-v $$(pwd)/config/istioinstall.yaml:/usr/local/config/istioinstall.yaml \
	-e GOOGLE_APPLICATION_CREDENTIALS=/usr/local/keys/$(key_filename_local) \
	-e REMOTE_KUBECONFIG=$(remote_kubeconfig) \
	--rm $(builder-name):$(builder-version)

local-run:
	export REMOTE_KUBECONFIG=$(remote_kubeconfig)
	./scripts/docker-entrypoint.sh