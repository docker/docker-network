FROM golang:1.4

ENV GOPATH /go
ENV PATH ${PATH}:/go/bin
ENV TARGET /source
ENV GOPATH_TARGET /go/src/github.com/docker/docker-network

ENV SUBSYSTEMS namespace

RUN go get -u github.com/kr/godep
RUN mkdir ${TARGET}
RUN mkdir -p $(dirname ${GOPATH_TARGET}) && \ 
  ln -sf /source ${GOPATH_TARGET}

WORKDIR ${TARGET}

CMD set -e; godep restore; godep go test -v .; for i in $SUBSYSTEMS; do cd $i; godep go test -v .; cd ..; done
