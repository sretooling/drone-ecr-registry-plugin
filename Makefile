# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

export APP     := sretooling/drone-plugin-cloud-registry

# ensure you create an initial commit on your your git.. `git tag 0.0.1 ; git push origin 0.0.1`
export VER     := $(shell git describe --tags --always --dirty)
export IMG     := "$(APP):$(VER)"

# DOCKER TASKS
# Build the container
build: linux-amd64 ## Build the container
	docker build -t $(IMG) -f docker/Dockerfile.linux-amd64 .

publish-all: login publish-version publish-latest

publish-latest: tag-latest login ## Publish the `latest` taged container to ECR
	@echo 'publish latest to $(DOCKER_REPO)'
	docker push $(APP):latest

publish-version: login ## Publish the `{version}` taged container to ECR
	@echo 'publish $(VER)'
	docker push $(APP):$(VER)

tag-latest: ## Generate container `{version}` tag
	@echo 'create tag latest'
	docker tag $(APP):$(VER) $(APP):latest

# log into dockerhub
login:
	docker login -u $(DOCKER_USER) -p $(DOCKER_PASS)













ROOT := $(shell pwd)

all: build

SOURCEDIR=./
SOURCES := $(shell find $(SOURCEDIR) -name '*.go')
BINARY_NAME=drone-plugin-cloud-registry
LOCAL_BINARY=bin/local/$(BINARY_NAME)
LINUX_AMD64_BINARY=bin/linux-amd64/$(BINARY_NAME)

linux-amd64: $(LINUX_AMD64_BINARY) ## create a linux binary locally
$(LINUX_AMD64_BINARY): $(SOURCES)
	./scripts/build_variant.sh linux amd64 $(VER)

