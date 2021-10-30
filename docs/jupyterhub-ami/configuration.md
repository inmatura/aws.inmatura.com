# Management

## SSH

To change any configurationo SSH to the EC2 instance using the public IP address
of the instance and the keypair selected at launch time.
The default user is `ubuntu`.

```shell title="Terminal"
$ ssh -i ~/keypair.pem ubuntu@<ip-addres>
```

## Config directoriese

All config files for JupyterHub are located at the `/opt/jupyterhub/config/`
directory.

This includes the `jupyterhub_config.py` that can be used to control the behaviour of
JupyterHub.

Configuration for the Jupyter sessions can be set globally on the
`/etc/jupyter` directory. For example [Voila config](/jupyterhub-ami/voila/#configure-theme).

## DNS

By default JupyterHub will be available at the public IP address of the instance.

To set a specific DNS as the access point put the DNS on the
`/opt/jupyterhub/config/jupyterhub_dns` file. For example:

```shell title="/opt/jupyterhub/config/jupyterhub_dns"
myjupyterhub.domain.com
```

After that restart JupyterHub

```shell title="Terminal"
sudo systemctl restart jupyterhub
```

And can access JupyterHub at `http://myjupyterhub.domain.com`.

## SSL

Note that the software uses only `HTTP` for communication.
We **strongly** recommended adding SSL termination.

This can be achieved using an external load balancer such as AWS ALB
or any external service.

This can also be done directly on the JupyterHub configuration.
Add the following lines to `/opt/jupyterhub/config/jupyterhub_config.py`:

```shell title="/opt/jupyterhub/config/jupyterhub_config.py"
c.JupyterHub.ssl_key = '/path/to/my.key'
c.JupyterHub.ssl_cert = '/path/to/my.cert'
```
