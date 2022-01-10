# SSL

The software included in the AMI uses `HTTP` for communication.
We **strongly** encourage adding SSL termination.

This can be achieved using an external load balancer such as AWS ALB
or other domain hosting services.

## Configure SSL termination at the EC2 instance

If you need to enable SSL between the Load Balancer and the EC2 instance:

1. Generate the certificates for the target DNS and move them to the EC2 instance
2. Configure the DNS to point to the EC2 IP address
3. Update the `/opt/jupyterhub/state/traefik.toml` file.
   Uncomment the SSL lines by point them to the path of the certificates on the instance

```shell title="/opt/jupyterhub/state/traefik.toml"
[entryPoints.https.tls]
[[entryPoints.https.tls.certificates]]
certFile = "/path/to/certs/traefik.crt"
keyFile = "/path/to/certs/traefik.key"
```
