# Postgresql

A PostgreSQL database in high-availability mode managed by [KubeDB](https://kubedb.com/).

The detailed documentation on PostgreSQL using KubeDB can be
found [here](https://kubedb.com/docs/v2021.06.23/guides/postgres/).

## Access

The primary database instance is found under the name ```ha-postgres```. Since the service is of type ```NodePort```, it
can also be reached directly on the node. The connection would look
like ```postgresql://<username>:<password>@<node fqdn>:<node port>/<database>```

## License

[GPLv3](LICENSE) license
