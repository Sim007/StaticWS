# Staticws (Static webserver)
This repo is a showcase of staticpage on a webserver.
We will build a container image and run a container on several platforms.

In this repo you find:
- sources
- Dockerfile
- configuration files

## Workflow
- Clone this repo or copy and unpack the zip
- Open Visual Studio Code
- Open Docker Desktop

## Build - Ship - Run in Docker CLI
In Docker Desktop we can do the following:

Build container image:
```powershell
docker image build -t staticws:latest .
```
Ship container image to Docker Hub:
```powershell
docker tag staticws <repo>/staticws:latest
docker push <repo>/staticws:latest
docker pull <repo>/staticws:latest
```
Run the container with:
```powershell
docker container run --name staticws -d -p <port>:80 <repo>/staticws:latest  
in browser: http://localhost:<port>
```
Notes:  
- port = port on host  
- repo = name on Docker Hub

## Run with Docker compose in Docker CLI 
```powershell
cd <directory of repo>
docker-compose up -d
in browser: http://localhost:4220
```

## Run in Docker Desktop k8s with kubectl
The k8s cluster runs in Docker Desktop.

### Some k8s cluster commands
With CLI command kubectl (Docker Desktop has installed it for you)  
With kubectl version we check if k8s is working:
```
kubectl version
```
To get help:
```
kubectl --help
```
  
You can show the clusters you can manage with kubectl with:
```
kubectl config get-contexts
```
Choose the correct cluster with:
```
kubectl config use docker-desktop
```
Show how many nodes there are with:
```
kubectl get nodes
```
### Run pod (container) the imperative way
You can run a container the imperative (Docker) way:
```
kubectl run staticwsink8s --image=sim007/staticws --port=4203 --expose=true
```
K8s is a cluster - we have define a service (loadbalancer) - to access staticws from a browser:
```
kubectl expose deployment staticwsink8s --type=LoadBalancer --type=LoadBalancer --port=4203 --target-port=80
```
You can open staticws in a browser:
```
https:\\localhost:4203
```
### Run staticws the declarative
We define our desired state in a k8s yaml with resources:
- deployment and 
- service

Goto directory of staticws with k8s yaml.
Deploy staticws with:
```powershell
kubectl -f staticws.yaml
```
Check staticws in a browser with:
```
http://localhost:4223
```
## Run with K8S in Azure AKS in a Docker CLI
```powershell
cd <directory of repo>
kubectl -f staticws4Azure.yaml
```
Note: you need an Azure account and an AKS cluster

## Run in play with Docker
In browser goto https://labs.play-with-docker.com/  
Login and start Virtual machine
```powershell
git clone https://github.com/Sim007/staticws.git 
docker container run --name staticws -d -p <port>:80 <repo>/staticws:latest
```

## Run in play with K8s
In browser goto https://labs.play-with-k8s.com/  
Login and start k8s environment
```powershell
git clone https://github.com/Sim007/staticws.git 
kubectl -f staticws.yaml
```

## Azure DevOps:
- Azure pipeline
    - Build pipeline
    - Release pipeline

## GitLab CI
To do  

## Build staticws within docker-compose
In a developer use case it is handy to also have building the container image in docker-compose

In the docker-compose there is line
```
build: .
```
If the container image is not present in docker or docker registry it will build the container image and tag as you defined in keyword image in docker-compose.

If make you make a change you can build with the following docker-compose command:
```
docker compose up --build
```

If only want to build give:
```
docker-compose build
```
This the same as:
```
docker build -t <repo>/name .
```


