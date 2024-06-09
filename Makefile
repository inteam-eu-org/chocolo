DOCKER_IMAGE := "chocolo-app"

all: docker

@PHONY: docker
docker:
	@echo "Building docker image"
	docker build -t $(DOCKER_IMAGE) .

@PHONY: run
run: docker
	@echo "Running in production mode"
	docker run -p 3000:3000 $(DOCKER_IMAGE)

@PHONY: run-dev
run-dev: docker
	@echo "Running in development mode"
	docker run -p 3000:3000 -e RAILS_ENV=development $(DOCKER_IMAGE) ./bin/rails server -b 0.0.0.0
