# Management

## SSH

To change any configuration in the EC2 instance you can SSH using it's public
IP address and the keypair selected at launch time.
The default user is `ubuntu`.

```shell title="Terminal"
$ ssh -i ~/keypair.pem ubuntu@<ip-addres>
```

## Config directories

All config files for JupyterHub are located in the `/opt/jupyterhub/config/`
directory.

This includes the `jupyterhub_config.py` that can be used to control the behavior of
JupyterHub.

Configuration for the Jupyter sessions can be set globally on the
`/etc/jupyter` directory for example for [Voila config](/jupyterhub-ami/voila/#configure-theme).

## DNS

By default JupyterHub will be available at the public IP address of the instance.

To set a specific DNS as the access point put the DNS in the
`/opt/jupyterhub/config/jupyterhub_dns` file. For example:

```shell title="/opt/jupyterhub/config/jupyterhub_dns"
myjupyterhub.mydomain.com
```

Then restart JupyterHub

```shell title="Terminal"
sudo systemctl restart jupyterhub
```

Now access JupyterHub at `http://myjupyterhub.domain.com`.

!!! note "Jupyterhub realm"

    This configuration requires that the subdomain is pointing to the
    EC2 instance.

## SSL

Note that the software included in the AMI uses only `HTTP` for communication.
We **strongly** recommended adding SSL termination.

This can be achieved using an external load balancer such as AWS ALB
or any external service.

This can also be done directly on the JupyterHub configuration.
Generate the certs, move them to the instance and add the following lines to
`/opt/jupyterhub/config/jupyterhub_config.py`:

```shell title="/opt/jupyterhub/config/jupyterhub_config.py"
c.JupyterHub.ssl_key = '/path/to/my.key'
c.JupyterHub.ssl_cert = '/path/to/my.cert'
```
