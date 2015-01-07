PKG:=github.com/docker/docker-network
PKG_PATH:=/go/src/$(PKG)
RUN_CMD:=docker run --privileged --rm -v "$(shell pwd)":$(PKG_PATH) docker-network

build: dockerbuild
	$(RUN_CMD) go build -v

test: dockerbuild
	$(RUN_CMD) go test -v ./...

save: dockerbuild
	$(RUN_CMD) 'go get -d ./... && godep save -r ./...'

dockerbuild:
	docker build -t docker-network .

clean:
	docker rmi -f docker-network
	rm -f docker-network
