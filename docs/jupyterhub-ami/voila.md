# Voila

The JupyterHub AMI includes [Voila](https://voila.readthedocs.io/en/stable/)
to create dashboards using Jupyter Notebooks.

To use Voila from Jupyter Lab open any notebook and click on the Voila icon.

![Voila](/assets/img/jupyterhub-ami/voila-flex.png)

## Configure Theme

To configure a different theme add a `jupyter_config.json` file at the
users home directory and configure Voila:

```json title="jupyter_config.json"
{
    "VoilaConfiguration": {
        "template": "flex",
        "enable_nbextensions": true
    }
}
```

To configure this globally change the `/etc/jupyter/jupyter_config.json` file.
