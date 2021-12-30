- This is high level of replicaset to the pods in a node 

- The deployment is used to configure changes to all the pods in the replicaset

- This is used to upgrade, scale and undo
   - it can be used to create new replicaset
   - it can be used to remove a deployment


- We use a deployment manifest file for deployment
  - The deployment looks if its labels match that of the replicaset level and pods level

  Kind: Deployment
  metadata:
    labels:
      environment: test

  spec:
    replicas: 3
    selector:
      matchLabels:
        environment: test
    minReadySeconds: 10
    strategy:
      rollingUpdate:
        maxSurge: 1
        maxUnavailable: 0
      type: RollingUpdate

  template:
    metadata:
      labels:
        environment: test

- For the above manifest file, the deployment will manage the pods with label:  environment: test
  and the replica set within

- If a pod has been created outside of the deployment manifest file, but the pod
  has been created with the label tag  environment: test,

  - The deployment manifest file will just create 2 more pods to meet the replica set
    desired state.

- The rolling update section of the replica set is the system on how the container images
  in the pods are updated without any downtime.


- The deployment file will be checked into a version control
