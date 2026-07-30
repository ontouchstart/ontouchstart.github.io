.PHONY: start test down clean
all:	start
	make test
	make down

PG_USER=myuser
PG_PASSWORD=mypassword
PG_DB=testdb

psql:	start
	docker compose exec -it db psql -h localhost -U $(PG_USER) -d $(PG_DB) -P pager=off

start:
	docker compose up -d --wait

test:
	docker compose exec db psql -h localhost -U $(PG_USER) -d $(PG_DB) -P pager=off -c 'SELECT version();'
	docker compose exec db psql -h localhost -U $(PG_USER) -d $(PG_DB) -P pager=off -c '\l+'

down:
	docker compose down -v
