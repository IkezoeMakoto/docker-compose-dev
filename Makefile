DOCKER = docker-compose
DOCKER_RUN = $(DOCKER) run --rm
CMD = -v

PHP = $(DOCKER_RUN) web
COMPOSER = $(DOCKER_RUN) composer
YARN = $(DOCKER_RUN) yarn

.PHONY: default up down php composer start stop restart yarn

.env:
	cp .env.example .env

default:
	$(DOCKER) $(CMD)

up: .env
	$(DOCKER) up -d --force-recreate --build

down:
	$(DOCKER) down

php:
	$(PHP) php $(CMD)

composer:
	$(COMPOSER) $(CMD)

start:
	$(DOCKER) start 

stop:
	$(DOCKER) stop

restart:
	$(DOCKER) restart

yarn:
	$(YARN) $(CMD)

