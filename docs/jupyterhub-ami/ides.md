# IDEs

The JupyterHub AMI includes multiple IDEs that work out of the box.

## Jupyter Lab (default)

When starting the JupyterHub session users will be droped to the Jupyter Lab
IDE.

![Jupyter Lab](/assets/img/jupyterhub-ami/jlab.png)

## Jupyter Notebook Classic

The Classic Jupyter Notebook experience is also available. To access it you
just need to change the URL path ending from `/lab` to `/tree`.
For example: `http://<ip-address>/user/jupyterhub-admin/tree`

![Jupyter Notebook Classic](/assets/img/jupyterhub-ami/jupyter-notebook.png)

All the existing Python and R kernels are the same from Jupyter Notebook to Jupyter Lab.

## RStudio IDE

You can access the RStudio IDE by clicking in the RStudio icon on Jupyter Lab
or in the `New` dropdown in Jupyter Notebook Classic

![RStudio](/assets/img/jupyterhub-ami/rstudio.png)

The only difference between using R from Jupyter to RStudio is that
RStudio is limited to one version of R, the newer installed in the system.

You can use the all the features from the RStudio such as Shiny.

![RStudio Shiny](/assets/img/jupyterhub-ami/rstudio-shiny.png)
