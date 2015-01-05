restore:
	go get -u github.com/kr/godep
	godep restore

build:
	docker build -t docker-network .

test: build
	docker run -it --privileged -v ${PWD}:/source docker-network
