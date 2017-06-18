DOCKER = docker-compose
DOCKER_RUN = $(DOCKER) run --rm
CMD = -v

PHP = $(DOCKER_RUN) web
COMPOSER = $(DOCKER_RUN) composer

.PHONY: default up down php composer

default:
	$(DOCKER) $(CMD)

up:
	$(DOCKER) up -d

down:
	$(DOCKER) down

php:
	$(PHP) php $(CMD)

composer:
	$(COMPOSER) $(CMD)
