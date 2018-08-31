FROM golang:latest
MAINTAINER No Reply dockerhub@sewan.fr
ADD ./example-main.tf /root/
RUN apt-get update && \
    apt-get install -y unzip && \
    go get -u golang.org/x/lint/golint && \
    apt-get install -y vim && \
    wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip && \
    unzip terraform_0.11.8_linux_amd64.zip -d /go/bin/ && \
    git clone https://github.com/SewanDevs/terraform-provider-sewan.git $GOPATH/src/github.com/SewanDevs/terraform-provider-sewan && \
    cd $GOPATH/src/github.com/SewanDevs/terraform-provider-sewan && \
    make test && \
    make build
WORKDIR /root/
