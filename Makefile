rebuild:
	docker-compose stop
	docker-compose build --no-cache --force-rm
	docker-compose up -d
