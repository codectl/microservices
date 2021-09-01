# pgAdmin

Kubernetes installation for [pgAdmin](https://www.pgadmin.org/) app.

So the application ```pgAdmin 4``` describes itself as a web based administration tool for the PostgreSQL database. The
docker used for this installation is ```dpage/pgadmin4``` and its code and documentation can be found online.

## ⚠️ Note

Component not currently under usage, therefore, not supported.

## Access

Because of an issue with ingress, the application is only accessible via ```NodePort```. Therefore, it is accessible
on ```http://<node url>:<node port>/pgadmin4```.
