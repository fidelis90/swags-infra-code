# Docker Registry 

- central repository of all docker mages 

- image: nginx/nginx 
  - nginx: hostname/account 
  - nginx: image/repo 

## Private Registry 

- Incase you don't want to host images on dockerhub 
- docker has a container to run private repo
- sudo docker run -d -p 5000:5000 --name registry registry:2 
  - Registry is the container managed by docker which can be used to host private repositories 
  - we are tagging the registry container as 2 to differentiate it on the docker host 

- Now let's tag one of our existing images so that we can push it to our local repo 
  - sudo docker tag <imageid> localhost:5001/centos 
   - localhost:5001 is the location of the new private repo 
   - the repo name is tagged centos

- Now we can push the image to the private repo 
  - docker push localhost:5001/centos  