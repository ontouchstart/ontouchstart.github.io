.PHONY: start test down clean
all:	start
	make test
	make down

DB_CONTAINER=postgres_db
PG_USER=myuser
PG_PASSWORD=mypassword
PG_DB=testdb

start:
	docker compose up -d --wait

test:
	docker exec $(DB_CONTAINER) sh -c "psql -h localhost -U $(PG_USER) -d $(PG_DB) -c '\l+'"

down:
	docker compose down -v

