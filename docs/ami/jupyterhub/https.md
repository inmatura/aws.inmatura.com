# HTTPS

The software included in the AMI uses `HTTP` for communication.
We **strongly** encourage adding SSL termination.

This can be achieved using an external load balancer such as AWS ALB
or other domain hosting services like Cloudflare.

## Enable HTTPS

1. Create a file name: `/opt/jupyterhub/config/jupyterhub_https`

```shell title="Terminal"
touch /opt/jupyterhub/config/jupyterhub_https
```

2. Restart the JuptyerHub service:

```shell title="Terminal"
$ /usr/local/bin/jupyterhub-boot.sh
```

In some cases this is all you need. For example if you are using CloudFlare with
the `Flexible` SSL option, this setup will give you SSL termination between the
browser and Cloudflare. Which is enough for most cases.

Depending on the desired DNS configuration you might need to
configure SSL termination on the EC2 instance, see below.

If you do this you will have SSL termination between the DNS provider and the
EC2 instance.

- In cloudflare this is equivalent to the `Full` and `Full (strict)` SSL settings.

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

Finally tell the JupyterHub service to use `HTTPS`:

1. Create a file named: `/opt/jupyterhub/config/jupyterhub_https`

```shell title="Terminal"
touch /opt/jupyterhub/config/jupyterhub_https
```

2. Restart the JuptyerHub service:

```shell title="Terminal"
$ /usr/local/bin/jupyterhub-boot.sh
```
