DOCKER_IMAGE := mime-types-dev
DOCKER_RUN   := docker run --rm -v $(PWD):/code -w /code $(DOCKER_IMAGE)

.PHONY: dev update test console

dev: | vendor

vendor:
	docker build -t $(DOCKER_IMAGE) .
	$(DOCKER_RUN) composer install

test: | vendor
	$(DOCKER_RUN) ./vendor/bin/phpcs --standard=PSR1,PSR2 src/
	$(DOCKER_RUN) ./vendor/bin/phpunit

console:
	docker run -it --rm -v $(PWD):/code -w /code $(DOCKER_IMAGE)

update:
	curl -L https://raw.githubusercontent.com/apache/httpd/trunk/docs/conf/mime.types > resources/mime.types
