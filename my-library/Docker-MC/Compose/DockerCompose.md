# Docker Compose Application 

- Imagine we have a Voting application 

- Services used in the App
  - Python web app(Voting app): user votes btw cat or dog 
  - Redis: In memory DB 
  - .NET Worker: takes the vote in redis and sends to PostgreSQL 
  - PostgreSQL: Main DB 
  - Python web app(Result app): shows the result of the vote 

-  Each section represents a single container 
  - web : webserver portion of the app
  - db : database server portion of the app 

- eavh section can be comprised of different components 

## Using DOCKER RUN 

- we assume all the images for individual services/apps are created 

- Now let's run the containers in background 
  - docker run -d --name=redis redis 
  - docker run -d --name=db postgres:9.4 
  - docker run -d --name=vote -p 5000:80 voting-app 
  - docker run -d --name=result -p 5001:80 result-app
  - docker run -d --name=worker worker 

- We use links to to link the dependent containers 
  - voting-app depends on redis 
    - --link redis:redis 
  - worker depends on redis and postgres
    - --link redis:redis --link db:db 
  - result-app depends on postgres 
    - --link db:db 

## Docker Compose Versions 

- version 1
  - we can't specify network as docker compose attach all containers to the default bridge network 
  - we need links btw containers that needs to communicate 
  - you don't have to specify the version 

- version 2 
  - we can specify the network 
  - we use the services module to specify the images to run 
  - we don't need links, as the containers can communicate using their service names 
  - we can specify depends_on module 
    - to specify that a service depends on another service 

## How To Use Docker Compose 

- Define your app's environment using Dockerfile( create the image for individual services and components of your app)

- Define the services that make up your app in docker-compose.yml so they can be run together in an isolated  environment 

- Run docker compose up and the docker runs your entire app. 

### Sample of docker-compose.yml 

version: "3.9"  # optional since v1.27.0
services:
  web:
    build: .
    ports:
      - "5000:5000"
    volumes:
      - .:/code
      - logvolume01:/var/log
    links:
      - redis
  redis:
    image: redis
volumes:
  logvolume01: {}

























