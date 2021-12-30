# Docker Swarm 

- Now we can create a cluster of docker hosts/nodes in order to scale up our apps/containers 

- This is needed for high availability and loadbalancing 

- container orchestration 

- docker swarm init on the master node 

- docker swarm join --token <token> on the worker nodes 

- docker service is the swarm orchestration tool 
  - docker service create --replicas=3 -p 8000:80 my-web-server 
  - must be run on the master node