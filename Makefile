.PHONY=serve
serve:
	docker run -v -d -p 8080:80 --mount type=bind,source=$(shell pwd)/src/,target=/var/www pyrsmk/docker-nginx-example:$(shell cat .docker-build)
