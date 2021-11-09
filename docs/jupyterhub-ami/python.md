# Python

The JupyterHub AMI comes with multiple Python versions plus some default
data science packages installed out of the box.

## Python versions

Each Python installation is independent of each other, they are based on `Mambaforge`.

| Version | Location |
|---|---|
| `Python 3.9.7` | `/opt/python/3.9` |
| `Python 3.8.12` | `/opt/python/3.8` |
| `Python 3.7.12` | `/opt/python/3.7` |
| `Python 3.8.12` | `/opt/python/3.8-rapids` |

!!! info "Owner"
    The owner of this directories is the `ubuntu` user (the same one used to SSH).

### Python Packages

For the all the environments the following packages are installed.

| Package | Version |
| --- | --- |
| `altair` | `4.1.0` |
| `awscli` | `1.21.12` |
| `beautifulsoup4` | `4.10.0` |
| `bokeh` | `2.4.1` |
| `bqplot` | `0.12.31` |
| `cloudpickle` | `2.0.0` |
| `dash` | `2.0.0` |
| `dash-core-components` | `2.0.0` |
| `dash-html-components` | `2.0.0` |
| `dash-table` | `5.0.0` |
| `gensim` | `4.1.2` |
| `ipykernel` | `6.5.0` |
| `ipython` | `7.29.0` |
| `ipython-genutils` | `0.2.0` |
| `ipywidgets` | `7.6.5` |
| `Keras-Preprocessing` | `1.1.2` |
| `matplotlib` | `3.4.3` |
| `matplotlib-inline` | `0.1.3` |
| `nltk` | `3.6.5` |
| `numpy` | `1.21.4` |
| `nycflights13` | `0.0.3` |
| `pandas` | `1.3.4` |
| `Pillow` | `8.4.0` |
| `pyarrow` | `6.0.0` |
| `pyspark` | `3.2.0` |
| `requests` | `2.26.0` |
| `requests-oauthlib` | `1.3.0` |
| `s3fs` | `0.4.2` |
| `scikit-image` | `0.18.3` |
| `scikit-learn` | `1.0.1` |
| `scipy` | `1.7.2` |
| `Scrapy` | `2.5.1` |
| `seaborn` | `0.11.2` |
| `statsmodels` | `0.13.0` |
| `tensorboard` | `2.7.0` |
| `tensorboard-data-server` | `0.6.1` |
| `tensorboard-plugin-wit` | `1.8.0` |
| `tensorflow` | `2.7.0` |
| `tensorflow-estimator` | `2.7.0` |
| `tensorflow-io-gcs-filesystem` | `0.21.0` |
| `torch` | `1.10.0+cu113` |
| `torchaudio` | `0.10.0+cu113` |
| `torchvision` | `0.11.1+cu113` |
| `xgboost` | `1.5.0` |

!!! info "NLTK and Spacy Data"
    Additionally the Spacy and NLTK data is included as part of the AMI so you can use
    those libraries out of the box.

## Installing Python packages

Single users can install new packages into it's user space by using pip directly in the
target Python installation. For example, opening a new terminal in Jupyter and running:

```shell title="Terminal"
jupyter-user@ip-172-31-93-190:~$ /opt/python/3.8/bin/pip install boto
Defaulting to user installation because normal site-packages is not writeable
Collecting boto
  Downloading boto-2.49.0-py2.py3-none-any.whl (1.4 MB)
     |████████████████████████████████| 1.4 MB 21.5 MB/s
Installing collected packages: boto
Successfully installed boto-2.49.0
```

Will install `boto` just for the `jupyter-user` on the Python 3.8 environment.

### Installing global packages

If you wish to make this package available to all users for a particular Python installation,
[SSH](/jupyterhub-ami/management/#ssh) into the EC2 instance and run the
`pip install` command as the `ubuntu` user.

```shell title="Terminal"
ubuntu@ip-172-31-93-190:~$ /opt/python/3.7/bin/pip install boto
Collecting boto
  Downloading boto-2.49.0-py2.py3-none-any.whl (1.4 MB)
     |████████████████████████████████| 1.4 MB 19.7 MB/s
Installing collected packages: boto
Successfully installed boto-2.49.0
```

Now all users that open a Python 3.7 notebook will be able to use `boto`.
