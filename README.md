# Microservices with consul - Kubernetes Example

This repository contains a simple example of how to use consul with kubernetes to create a service discovery system and
service mesh using consul connect. The Microservices are a nice and small example of services that can easily be run on 
kubernetes. The credit for these belongs to [Eberhard Wolff](https://github.com/ewolff) and his 
[microservices-kubernetes repo](https://github.com/ewolff/microservice-kubernetes)

This repository is a fork of the original repository with the addition of consul and consul connect to the microservices.
There are also some minor changes to the kubernetes deployment files to make them work with consul.

## Deployment Guides
* [Consul](consul-setup/README.md) - How to install consul on kubernetes
* [vanilla microservices](microservices-vanilla-k8/README.md) - How to deploy the microservices on kubernetes. These are the 
  microservices without consul.
* [service mesh microservices](microservices-consul-k8/README.md) - How to deploy the microservices on kubernetes with consul 
  connect. These are the microservices utilising the service mesh.