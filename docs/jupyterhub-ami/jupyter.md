# Jupyter

## Jupyter Lab (default)

JupyterLab is the default IDE that will be shown to users after they log in.

![Jupyter Lab](/assets/img/jupyterhub-ami/jupyter-lab.png)

### Extensions

The following JupyterLab extensions are installed:

- [JupyterLab Git](https://github.com/jupyterlab/jupyterlab-git)
- [NBDime](https://nbdime.readthedocs.io/en/latest/index.html) - Notebook diffs
- [JupyterLab Dask](https://github.com/dask/dask-labextension)

## Jupyter Notebook Classic

The Classic Jupyter Notebook experience is also available.

To access it just change the URL path ending from `/lab` to `/tree`.

For example: `http://<ip-address>/user/jupyterhub-admin/tree`

![Jupyter Notebook Classic](/assets/img/jupyterhub-ami/jupyter-notebook.png)

!!! info "Kernels"
    All the existing Python and R kernels will also be available on Jupyter Notebook Classic.
