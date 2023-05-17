# Management

## SSH

To change any configuration in the EC2 instance you can SSH using it's public
IP address and the KeyPair selected at launch time.
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
`/etc/jupyter` directory for example for [Voila config](/ami/jupyterhub/voila/#configure-theme).
