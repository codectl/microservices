# Postgresql

A PostgreSQL database using a Kubernetes resource, StatefulSet.

## How to connect

The database instance is found under the name ```postgres```. Since the service is of type ```NodePort```, it can also
be reached directly on the node. The connection would look
like ```postgresql://<username>:<password>@<node fqdn>:<node port>/<database>```.
