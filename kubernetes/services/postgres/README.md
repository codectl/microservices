# Postgresql

A PostgreSQL database in high-availability mode managed by [KubeDB](https://kubedb.com/).

The detailed documentation on PostgreSQL using KubeDB can be
found [here](https://kubedb.com/docs/v2021.06.23/guides/postgres/).

## Install

Run the following instructions in the same order to have it installed:

```bash
$ cd kubernetes/services/postgresql
$ kubectl apply -f psp.yaml
$ kubectl apply -f sa.yaml
$ kubectl apply -f rbac.yaml
$ kubectl apply -f pg-auth.yaml
$ kubectl apply -f kubedb.yaml
```

## Access

The primary database instance is found under the name ```ha-postgres```. Since the service is of type ```NodePort```, it
can also be reached directly on the node. The connection would look
like ```postgresql://<username>:<password>@<node fqdn>:<node port>/<database>```

## License

[GPLv3](LICENSE) license
