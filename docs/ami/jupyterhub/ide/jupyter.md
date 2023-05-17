# Jupyter

## Jupyter Lab (default)

JupyterLab is the default IDE that will be shown to users after they log in.

![Jupyter Lab](/assets/images/ami/jupyterhub/jupyter-lab.jpg)

### Extensions

The following JupyterLab extensions are installed:

- [JupyterLab Git](https://github.com/jupyterlab/jupyterlab-git)
- [NBDime](https://nbdime.readthedocs.io/en/latest/index.html) - Notebook diffs
- [JupyterLab Dask](https://github.com/dask/dask-labextension)

### Gator

The Gator extension allows you to easily manage the packages.

![Jupyter Notebook Classic](/assets/images/ami/jupyterhub/jupyter-gator.jpg)

## Environment Variables

If you need to set custom env variables on the kernel you can add them to it's
respective `kernel.json`. For example:

`/usr/local/share/jupyter/kernels/python3.10/kernel.json`

```json
{
 "argv": [
  "/opt/python/3.10/bin/python",
  "-m",
  "ipykernel_launcher",
  "-f",
  "{connection_file}"
 ],
 "display_name": "Python 3.10",
 "language": "python",
 "metadata": {
  "debugger": true
 },
 "env": {
    "CUDNN_PATH": "/opt/python/3.10/lib/python3.10/site-packages/nvidia/cudnn/lib",
    "LD_LIBRARY_PATH": "/opt/python/3.10/lib/:/opt/python/3.10/lib/python3.10/site-packages/nvidia/cudnn/lib/"
 }
}
```

## Jupyter Notebook Classic

The Classic Jupyter Notebook experience is also available.

To access this view just change the URL path ending from `/lab` to `/tree`.

For example: `http://<ip-address>/user/jupyterhub-admin/tree`

![Jupyter Notebook Classic](/assets/images/ami/jupyterhub/jupyter-notebook-classic.jpg)

!!! info "Kernels"
    All the existing Python and R kernels will also be available on Jupyter Notebook Classic.
