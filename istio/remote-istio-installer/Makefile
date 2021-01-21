include .env
export

docker-build:
	docker build -t $(builder-name):$(builder-version) .

docker-push:
	docker push $(builder-name):$(builder-version)

docker-run:
	docker run \
	-e CLUSTER_NAME=$(cluster-name) \
	-e PROJECT_NAME=$(project-name) \
	-e REGION=$(region) \
	$(builder-name):$(builder-version)
