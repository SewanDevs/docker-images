FROM golang:latest
MAINTAINER No Reply dockerhub@sewan.fr
ADD ./example-main.tf /root/
RUN apt-get update && \
    apt-get install -y unzip && \
    apt-get install -y vim && \
    go get -u github.com/google/go-cmp/cmp && \
    wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip && \
    unzip terraform_0.11.7_linux_amd64.zip -d /go/bin/ && \
    git clone https://github.com/SewanDevs/sewan_go_sdk.git $GOPATH/src/github.com/SewanDevs/sewan_go_sdk && \
    git clone https://github.com/SewanDevs/terraform-provider-sewan.git $GOPATH/src/github.com/SewanDevs/terraform-provider-sewan && \
    git clone https://github.com/hashicorp/terraform.git $GOPATH/src/github.com/hashicorp/terraform && \
    cd $GOPATH/src/github.com/SewanDevs/terraform-provider-sewan && \
    make test && \
    make build
WORKDIR /root/
