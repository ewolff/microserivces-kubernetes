# Plain old microservices on Kubernetes
This directory contains the manifest files to deploy the microservices on kubernetes. We will create these in their own
namespace to keep things clean.

## Create the namespace
```bash
kubectl create namespace demo-app
```

## Deploy the microservices
```bash
kubectl apply -f microservices-vanilla-k8/ -n demo-app
```

## Verify the deployment
```bash
$ kubectl get all -n demo-app
NAME                            READY   STATUS    RESTARTS   AGE
pod/apache-66859fc665-jrh86     1/1     Running   0          5s
pod/catalog-6f9d48448b-p9g7v    1/1     Running   0          5s
pod/customer-687dd654c5-chxg5   1/1     Running   0          5s
pod/order-57d554f7f7-b69td      1/1     Running   0          5s

NAME               TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
service/apache     NodePort    10.101.91.174   <none>        80:30954/TCP   5s
service/catalog    ClusterIP   10.97.191.86    <none>        8080/TCP       5s
service/customer   ClusterIP   10.99.248.140   <none>        8080/TCP       5s
service/order      ClusterIP   10.96.206.40    <none>        8080/TCP       5s

NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/apache     1/1     1            1           5s
deployment.apps/catalog    1/1     1            1           5s
deployment.apps/customer   1/1     1            1           5s
deployment.apps/order      1/1     1            1           5s

NAME                                  DESIRED   CURRENT   READY   AGE
replicaset.apps/apache-66859fc665     1         1         1       5s
replicaset.apps/catalog-6f9d48448b    1         1         1       5s
replicaset.apps/customer-687dd654c5   1         1         1       5s
replicaset.apps/order-57d554f7f7      1         1         1       5s
```

## Access the microservices
We currently expose the apache service as a NodePort. This will act as the entry point to the services and we can reach 
it by accessing its node port.

![Microservices](../doc-images/microservices-ui.png)

## apache service
The apache service just acts as a reverse proxy to the other services. It is exposed as a node port to allow external 
access. It has a very simple configuration that just proxies requests to the other services. You can refer to its 
[config](../microservice-kubernetes-demo/apache) for more details.

## Summary
At this point we now have 4 microservices deployed in the kubernetes cluster. We can access them via the apache service
which is exposed as a node port. The other 3 services are `ClusterIP` services and can only be accessed from within the
kubernetes cluster.

One point to note here is that the services are not secured in any way. We will look at securing the services later. For
now each service just talks on http and is accessible from anywhere in the cluster.

