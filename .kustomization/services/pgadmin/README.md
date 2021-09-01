# pgAdmin

Kubernetes installation for [pgAdmin](https://www.pgadmin.org/) app.

So the application ```pgAdmin 4``` describes itself as a web based administration tool for the PostgreSQL database. The
docker used for this installation is ```dpage/pgadmin4``` and its code and documentation can be found online.

## Install

Run the following instructions in the same order to have it installed:

```bash
$ cd kubernetes/services/pgadmin
$ kubectl apply -f psp.yaml
$ kubectl apply -f sa.yaml
$ kubectl apply -f configmap.yaml
$ kubectl apply -f deployment.yaml
$ kubectl apply -f svc.yaml
$ kubectl apply -f nginx.yaml
$ kubectl apply -f ingress.yaml
```

## Access

Because of an issue with ingress, the application is only accessible via ```NodePort```. Therefore, it is accessible
on ```http://<node url>:<node port>/pgadmin4```.

## License

[GPLv3](LICENSE) license
