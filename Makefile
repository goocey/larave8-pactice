chmod:
	sudo chmod 777 -R src/storage/logs
	sudo chmod 777 -R src/storage/framework
docker-build: docker-kill
	docker-compose -p laravel8 build
docker-logs:
	docker-compose -p laravel8 logs -f
docker-up: chmod
	docker-compose -p laravel8 up -d
docker-kill:
	docker-compose -p laravel8 kill
docker-rm:
	docker-compose -p laravel8 stop
	docker-compose -p laravel8 rm -f
docker-log-del:
	./docker/script/logs-delete.sh
exec-php:
	docker-compose -p laravel8 exec php bash
exec-node:
	docker-compose -p laravel8 exec node sh
migrate:
	docker-compose -p laravel8 exec php ./artisan migrate
artisan-server:
	docker-compose -p laravel8 exec ./artisan 
exec-localstack:
	docker-compose -p laravel8 exec localstack sh