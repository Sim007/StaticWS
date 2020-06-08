# Showcase Static Website
# with tag latest

FROM nginx:stable-alpine
COPY index.html *.png /usr/share/nginx/html/
RUN sed -i s/containername/$HOSTNAME/ /usr/share/nginx/html/index.html

LABEL MAINTAINER="Johannes Sim" \
      REFRESHED_AT="2020-06-03"

# build:  docker image build -t staticws .

# tag:    docker tag staticws <repo>/staticws:latest
# push:   docker push <repo>/staticws:latest
# pull:   docker pull <repo>/staticws:latest

# run:    docker container run --name staticws -d -p <port>:80 <repo>/staticws:latest

# delete: docker container rm -f staticws
# in:     docker container exec -it staticws /bin/sh

# compose:docker-compose up -d
# compose:docker-compose down

# buildx: docker buildx build -t staticwsx .