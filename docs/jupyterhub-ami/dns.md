# Custom DNS

By default JupyterHub will be available at the public IP address of the instance.

To set a custom DNS, e.g. `jupyterhub.domain.com`, as the access point:

1. In AWS configure a Elastic IP address to the EC2 instance
2. Add a DNS `A record` from the subdomain to the Elastic IP
3. On the EC2 instance create a `/opt/jupyterhub/config/jupyterhub_dns` file
   and write the DNS

```shell title="/opt/jupyterhub/config/jupyterhub_dns"
jupyterhub.domain.com
```

4. Execute the `/usr/local/bin/jupyterhub-boot.sh` script.

```shell title="Terminal"
$ /usr/local/bin/jupyterhub-boot.sh
```

Now you should be able to access `http://jupyterhub.domain.com`
and login as usual.

## SSL

Depending on the desired DNS configuration you might need to configure
SSL termination on the EC2 instance. See [SSL](/jupyterhub-ami/ssl)

You can also relax this options on the DNS services. For example on CloudFlare:

- The `Flexible` option encrypts traffic **only** between the browser and Cloudflare.
  So you don't need to enable SSL on the EC2 instance.
- The `Full` and `Full (strict)` configurations requires to configure
  [SSL](/jupyterhub-ami/ssl) on the EC2 instance
