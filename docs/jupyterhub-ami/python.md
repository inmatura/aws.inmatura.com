# Python

The JupyterHub AMI comes with multiple Python versions plus some default
data science packages installed out of the box.

## Python versions

Each Python installation is independent of each other, they are based on `Mambaforge`.

| Version | Location |
|---|---|
| `Python 3.9.5` | `/opt/python/3.9` |
| `Python 3.8.5` | `/opt/python/3.8` |
| `Python 3.7.9` | `/opt/python/3.7` |
| `Python 3.8.5` | `/opt/python/3.8-rapids` |

!!! info "Owner"
    The owner of this directories is the `ubuntu` user (the same one used to SSH).

### Python Packages

For the all the environments the following packages are installed.

| Package | Version |
| --- | --- |
| `altair` | `4.1.0` |
| `awscli` | `1.19.51` |
| `beautifulsoup4` | `4.9.3` |
| `bokeh` | `2.3.1` |
| `cloudpickle` | `1.6.0` |
| `dash` | `1.20.0` |
| `gensim` | `4.0.1` |
| `ipykernel` | `5.5.3` |
| `ipython` | `7.22.0` |
| `ipython-genutils` | `0.2.0` |
| `ipywidgets` | `7.6.3` |
| `Keras` | `2.4.3` |
| `matplotlib` | `3.4.1` |
| `nltk` | `3.6.1` |
| `numpy` | `1.20.2` |
| `nycflights13` | `0.0.3` |
| `pandas` | `1.2.4` |
| `Pillow` | `8.2.0` |
| `pyarrow` | `3.0.0` |
| `pyspark` | `3.1.1` |
| `requests` | `2.24.0` |
| `s3fs` | `0.6.0` |
| `scikit-image` | `0.18.1` |
| `scikit-learn` | `0.24.1` |
| `scipy` | `1.6.2` |
| `Scrapy` | `2.5.0` |
| `seaborn` | `0.11.1` |
| `spacy` | `3.0.5` |
| `spacy-legacy` | `3.0.2` |
| `statsmodels` | `0.12.2` |
| `tensorboard` | `2.4.1` |
| `tensorflow` | `2.4.1` |
| `torch` | `1.8.1+cu111` |
| `torchaudio` | `0.8.1` |
| `torchvision` | `0.9.1+cu111` |
| `xgboost` | `1.4.0` |

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
