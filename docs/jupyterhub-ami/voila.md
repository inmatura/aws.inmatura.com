# Voila

The JupyterHub AMI includes [Voila](https://voila.readthedocs.io/en/stable/)
to create dashboards using Jupyter Notebooks.

To use Voila from Juptyer Lab open any notebook and click on the Voila Icon

![Voila](/assets/img/jupyterhub-ami/voila-flex.png)

## Configure Theme

The default Voila theme is [jupyter-flex](https://jupyter-flex.danielfrg.com/)
that allows to easily create dashboards using cell tags.

!!! info "Sample notebook"
    See the `voila-altair.ipynb` for a sample of jupyter-flex.

To configure a different theme add a `jupyter_config.json` at the home directory
and configure Voila:

```json
{
    "VoilaConfiguration": {
        "template": "flex",
        "enable_nbextensions": true
    }
}
```

To configure this globally change the `/etc/jupyter/jupyter_config.json` file.
