# Networking In Docker 

- when docker is created, it creates 3 networks by default 
  - bridge 
    - This is the default network, docker is attached to 
    - usually in the 172.17.x.x range 
  - none 
  - host 
- To specify a new network for a container
  - docker run --network=none 

- To access the containers from the outside world, map ports in the containers to ports on the docker host 

- Another way to access the container is to associate the container with the host network, no network isolation btw host and container 

- We can create our own internal network 
  - docker network create --driver bridge --subnet 182.18.0.0/16 custom-isolated-network 

## Docker Network Commands 

- docker network ls : list all docker networks 

- docker inspect <cont.ID>
  - info about network settings (IP, network-drive, Mac-address, Gateway)

- Docker has builtin DNS server that helps containers reach eachother by names 
  - DNS server: 127.0.0.11 

- Docker creates seperate namespaces for each container 

## Docker Storage 

- when you install docker, it creates a folder structure : /var/lib/docker 
  - docker stores all its data in /var/lib/docker 
  - when you create a docker volume 
    - docker volume create docker_vol
    - it creates a folder data_vol in /var/lib/docker/volumes 
    - you can mount the volume inside the docker container from the docker run command 
      - docker run -v data_vol:/var/lib/mysql mysql : volume mount 
      - docker run -v /path/to/volume:/var/lib/mysql mysql : bind mount 
      - latest way is to use docker run --mount 

- Layered architecture 
  - image creation during docker build process is in the image layer 
    - image layer = read only 

  - docker run = container layer 
    - container layer = read,write layer 





























