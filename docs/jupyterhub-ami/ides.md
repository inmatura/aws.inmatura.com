# IDEs

The JupyterHub AMI includes multiple IDEs that work out of the box.

## Jupyter Lab (default)

JupyterLab is the default IDE that will be shown to users after log in.

![Jupyter Lab](/assets/img/jupyterhub-ami/jupyter-lab.png)

## Jupyter Notebook Classic

The Classic Jupyter Notebook experience is available.

To access it just change the URL path ending from `/lab` to `/tree`.
For example: `http://<ip-address>/user/jupyterhub-admin/tree`

![Jupyter Notebook Classic](/assets/img/jupyterhub-ami/jupyter-notebook.png)

!!! info "Kernels"
    All the existing Python and R kernels will also be available on Jupyter Notebook Classic.

## RStudio IDE

You can access the RStudio IDE by clicking on the `RStudio` icon on Jupyter Lab.

!!! info "Jupyter Notebook Classic"
    Click on the `New` dropdown and then click on `RStudio`.

![RStudio](/assets/img/jupyterhub-ami/rstudio-shiny.png)

The only difference between using R from Jupyter and RStudio is that
RStudio is limited to one version of R (the latest installed in the system).

You can use all the features from the RStudio IDE such as developing Shiny Apps.

![RStudio Shiny](/assets/img/jupyterhub-ami/rstudio-shiny.png)

## VS Code

You can access VS Code by clicking on the `VS Code` icon on Jupyter Lab.

!!! info "Jupyter Notebook Classic"
    Click on the `New` dropdown and then click on `VS Code`.

The VS Code Python and Jupyter extensions are installed so it's possible to start coding
Python out of the box.

![VS Code](/assets/img/jupyterhub-ami/vscode.png)

!!! info "Python interpreter"

    Be sure to select the correct Python interpreter under `/opt/python`.
    For more info see [Packages](/jupyterhub-ami/packages/#python).
