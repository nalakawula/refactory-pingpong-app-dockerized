# pingpong-app built in with node js

## How to create docker image
First, copy .env.example to .env and edit the content if needed.

Then, Build docker image using provided `Dockerfile`:

```
docker build . -t sumarsono/pingpong:v1
```

After that push the image to docker registry (i will push to docker hub):

```sh
docker push sumarsono/pingpong:v1
```

## Run the app on Minikube
First, start the minikube:

```sh
minikube start --driver=docker
```

Verify that minikube status is ready

```sh
kubectl get nodes
```

Then, we can deploy the app on minikube using provided yaml file

```sh
kubectl create ns refactory-test
kubectl apply -f k8s/
```

That command will create pingpong-app Deployment, and pingpong-app service under refactory-test name space. Verify with:

```sh
kubectl -n refactory-test get all
```

Access the app with this command:

```sh
minikube -n refactory-test service pingpong-app
```

It's will print

```sh
|----------------|--------------|-------------|---------------------------|
|   NAMESPACE    |     NAME     | TARGET PORT |            URL            |
|----------------|--------------|-------------|---------------------------|
| refactory-test | pingpong-app |          80 | http://192.168.49.2:30412 |
|----------------|--------------|-------------|---------------------------|
```

We can `curl` the url:

```sh
curl 192.168.49.2:30412
```

The output is:

```sh
{"data":"ok"}
```
