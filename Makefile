.PHONY: test clean

default: build

build: clean
	docker-compose build

up:
	docker-compose up

migrations:
	docker-compose run --rm app python manage.py makemigrations

migrate:
	docker-compose run --rm app python manage.py migrate db

clean:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +
	docker-compose down
