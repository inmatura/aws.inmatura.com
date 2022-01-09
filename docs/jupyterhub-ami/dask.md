# Dask

The JupyterHub AMI includes Dask and it's JupyterLab extension.

You can use this extension to create a Dask cluster or to connect to a running one.

## Connecting to a running Dask cluster

If you create a Dask cluster using Python, for example:

```python
from dask.distributed import Client
client = Client()
```

You can connect the extension to this cluster using the Dashboard URL:

```python
print("Dashboard:", client.dashboard_link)
```

```plain
Dashboard: /user/jupyterhub-admin/proxy/8787/status
```

Paste this URL at the top of the Dask extension.

![Dask](/assets/img/jupyterhub-ami/dask-ext-url.png)

After that click on any of the metrics to create new Panes in Jupyter Lab.

![Dask](/assets/img/jupyterhub-ami/dask-jupyterlab.png)
