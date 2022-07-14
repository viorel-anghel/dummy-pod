# dummy-pod

This is a container which can be used for various debug tasks in Docker and Kubernetes. 
It is designed to contain many useful tools or you can extend it if needed.

## To build it

```
export TAG=0.6
# docker build -t dummy:$TAG .
```

## To run and test on the local docker engine

```
docker run -d  -p 6789:8080 --name dummy dummy:$TAG
# curl http://localhost:6789/cgi-bin/status
```

## Parameters
The default port inside container is 8080 and the default message is "ok". Those can be changed with environment variables PORT and TEXT, for example:
```
docker run -d  -e TEXT=nobine -e PORT=8181 -p 6789:8181 --name dummy dummy:$TAG
curl http://localhost:6789/
```

## Using it in kubernetes

You will need to push it to an image repository. If you wish to use my container from docker hub, try the name `vvang/dummy:0.6` or whatever tag is listed at https://hub.docker.com/r/vvang/dummy

You can just create the pod with an imperative command:
```
kubectl run dummy --image=vvang/dummy:0.6  # optional -n namespace
```

Or you can use the provided yaml file which also shows the use of environment variables and other goodies.

To enter inside a pod, use:
```
kubectl exec -ti dummy -- bash
    root@dummy# ps -ef
    root@dummy# ifconfig
    root@dummy# exit
```

We recommend to leave this pod there but if you want to delete it:
```bash
kubectl delete pod dummy  # optional -n namespace
```

