.PHONY=build
build:
	@echo 'Current version: '
	@echo $(shell cat ../.docker-build)
	@echo
	@read -p "Version? " VERSION; \
	echo $$VERSION > ../.docker-build; \
	docker build -t pyrsmk/docker-nginx-example:$$VERSION .

.PHONY=publish
publish:
	docker push pyrsmk/docker-nginx-example:$(shell cat ../.docker-build)

.PHONY=bash
bash:
	docker run -p 8080:80 --mount type=bind,source=$(shell pwd),target=/var/www -it pyrsmk/docker-nginx-example:$(shell cat ../.docker-build) bash
