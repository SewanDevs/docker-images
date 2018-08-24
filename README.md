# docker-images
Docker images with Sewan's products

## Get an image
Available images are on docker hub : https://hub.docker.com/u/sewan/
```sh
docker pull sewan/<name of image to pull>
```

## Build and run the image locally

```sh
git clone https://github.com/SewanDevs/docker-images.git
cd docker-images/<a docker image name>
docker build -t <a docker image name> .
docker run -it --name <an instance name> <a docker image name> bash
```

## Update the DockerHub public image

Follow the instructions : https://docs.docker.com/docker-cloud/builds/push-images/

Or create an [automated dockerhub build](https://docs.docker.com/docker-hub/builds/) if you are owner of SewanDevs github repo.
