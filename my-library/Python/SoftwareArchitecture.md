# Software Architecture

- Monilithic Architecture

  - All codes are globbed up in just one file
  - useful for small application
  -

- Layered Architecture

  - splits all parts of the application in layers
  - closed layer can communicate with closed layer directly below it
  - opened layer means it can be used by all layers
  - Simple Layered architecture
    - Presentation layer ( Frontend )
      - holds the index.html
      - server-static.js
      - This layer communicates with the business layer using a http GET request
    - business layer
      - The business layer has a logic that communicates with the data layer and extracts data
    - data layer
      - The database layer
    - Drawback
      - If developers make changes to one of the layers, then all layers will have to be restarted

- Microservices Architecture
  - Most popular for building web applications

## SPRING BOOT

- This is an open source micro framework maintained by a company called pivotal
- provides java developers with a platform to get started with an auto configurable production-grade spring application.

## How a spring boot project is deployed to kubernetes

- create the project
- create a docker file
- create a local image of docker
- push image to a container registry
- run a deployment
