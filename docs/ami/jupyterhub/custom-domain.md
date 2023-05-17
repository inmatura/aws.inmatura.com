# Custom Domain

By default JupyterHub will be available at the public IP address of the instance.

You can easily set a a custom domain, e.g. `jupyterhub.domain.com`,
that the Load Balancer and JupyterHub will use.

1. Optional but recommended: Configure a Elastic IP address to the EC2 instance
2. Add a DNS `A record` to the domain pointing to the Elastic IP Address
3. On the EC2 instance create a `/opt/jupyterhub/config/jupyterhub_dns` file
   and write the hostname

```shell title="/opt/jupyterhub/config/jupyterhub_dns"
jupyterhub.domain.com
```

4. Execute the `/usr/local/bin/jupyterhub-boot.sh` script.

```shell title="Terminal"
$ /usr/local/bin/jupyterhub-boot.sh
```

Now you should be able to access `http://jupyterhub.domain.com`
and login as usual.

You can also configure [HTTPS](/ami/jupyterhub/https/).
