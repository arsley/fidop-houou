setup: .env bundle pg dbcreate dbmigrate dbseed dbmigrate-test dbseed-test

.env:
	cp .env.sample .env

.PHONY: pg
pg:
	if [ -z "`docker ps | grep pg-houou`" ] ; then \
	docker run --rm -d \
	--name pg-houou \
	-v `pwd`/tmp/pgdata:/var/lib/postgresql/data \
	-p 5432:5432 \
	--env-file .env \
	postgres:latest; fi

.PHONY: wait-for-db
wait-for-db:
	./scripts/wait-for-it.sh localhost:5432 -- echo "db ready"

.PHONY: bundle
bundle:
	bundle install

.PHONY: dbcreate
dbcreate:
	bundle exec rails db:create

.PHONY: dbmigrate
dbmigrate: wait-for-db
	bundle exec rails db:migrate

.PHONY: dbmigrate-test
dbmigrate-test: wait-for-db
	RAILS_ENV=test bundle exec rails db:migrate

.PHONY: dbseed
dbseed: wait-for-db
	bundle exec rails db:seed

.PHONY: dbseed-test
dbseed-test: wait-for-db
	RAILS_ENV=test bundle exec rails db:seed

.PHONY: up
up: pg
	bundle exec rails s

.PHONY: down
down:
	docker stop pg-houou
