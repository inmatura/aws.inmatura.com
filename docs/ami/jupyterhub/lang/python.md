# Python

The JupyterHub AMI comes with multiple Python versions plus some
data science packages installed out of the box.
Extra packages can be easily installed on each Python environment.

## Python versions

Each Python installation is independent of each other, they are based on `Mambaforge`.

| Version         | Location                 |
| --------------- | ------------------------ |
| `Python 3.10.10` | `/opt/python/3.10`        |
| `Python 3.10.10` | `/opt/python/3.10-rapids` |
| `Python 3.9.`    | `/opt/python/3.9`         |
| `Python 3.8.`    | `/opt/python/3.8`         |

!!! info "Owner"

    The owner of this directories is the `ubuntu` user (the same one used to SSH).

### Python Packages

For the all the environments the following packages are installed.

| Package          | Version        |
| ---------------- | -------------- |
| `altair`         | `5.0.0`        |
| `awscli`         | `1.27.134`      |
| `beautifulsoup4` | `4.12.2`       |
| `bokeh`          | `3.1.1`        |
| `bqplot`         | `0.12.39`      |
| `dash`           | `2.9.3`        |
| `dask`           | `2023.5.0`    |
| `gensim`         | `4.3.1`        |
| `ipykernel`      | `6.23.1`        |
| `ipython`        | `8.13.2`       |
| `ipywidgets`     | `8.0.6`        |
| `matplotlib`     | `3.7.1`        |
| `nltk`           | `3.8.1`        |
| `numpy`          | `1.23.5`       |
| `pandas`         | `2.0.1`        |
| `Pillow`         | `9.5.0`        |
| `pyarrow`        | `12.0.0`        |
| `pyspark`        | `3.4.0`        |
| `requests`       | `2.28.2`       |
| `scikit-image`   | `0.20.0`       |
| `scikit-learn`   | `1.2.2`        |
| `scipy`          | `1.10.1`        |
| `Scrapy`         | `2.9.0`        |
| `seaborn`        | `0.12.2`       |
| `spacy`          | `3.5.3`        |
| `statsmodels`    | `0.14.0`       |
| `tensorboard`    | `2.12.3`        |
| `tensorflow`     | `2.12.0`        |
| `torch`          | `2.0.1+cu118` |
| `torchaudio`     | `2.0.2+cu118` |
| `torchvision`    | `0.15.2+cu118` |
| `xgboost`        | `1.7.5`        |


### Conda Packages

For all the environments this conda packages are installed

| Package          | Version        |
| ---------------- | -------------- |
| `cudatoolkit`    | `11.8.0`       |

!!! info "NLTK and Spacy Data"

    Additionally the Spacy and NLTK data is included as part of the AMI so you can use
    those libraries out of the box.

## Installing Python packages

Single users can install new packages into it's user space by using pip directly in the
target Python installation. For example, opening a new terminal in Jupyter and running:

```shell title="Terminal"
jupyter-user@ip-172-31-93-190:~$ /opt/python/3.10/bin/pip install boto
Defaulting to user installation because normal site-packages is not writeable
Collecting boto
  Downloading boto-2.49.0-py2.py3-none-any.whl (1.4 MB)
     |████████████████████████████████| 1.4 MB 21.5 MB/s
Installing collected packages: boto
Successfully installed boto-2.49.0
```

Will install `boto` just for the `jupyter-user` on the Python 3.10 environment.

### Installing global packages

If you wish to make this package available to all users for a particular Python installation,
[SSH](/jupyterhub-ami/management/#ssh) into the EC2 instance and run the
`pip install` command as the `ubuntu` user.

```shell title="Terminal"
ubuntu@ip-172-31-93-190:~$ /opt/python/3.9/bin/pip install boto
Collecting boto
  Downloading boto-2.49.0-py2.py3-none-any.whl (1.4 MB)
     |████████████████████████████████| 1.4 MB 19.7 MB/s
Installing collected packages: boto
Successfully installed boto-2.49.0
```

Now all users that open a Python 3.9 notebook will be able to import and use `boto`.

## Install other versions of Python

You can install and register other versions of Python.

You can [SSH](/ami/jupyterhub/management/) and install them for example using
[mambaforge](https://github.com/conda-forge/miniforge):

```shell title="Terminal"
PREFIX_NAME=my-python
MAMBAFORGE_VERSION=23.1.0-1

download_url=https://github.com/conda-forge/miniforge/releases/download/${MAMBAFORGE_VERSION}/Mambaforge-${MAMBAFORGE_VERSION}-Linux-x86_64.sh

sudo curl -L -o Mambaforge-${MAMBAFORGE_VERSION}-Linux-x86_64.sh $download_url
sudo bash Mambaforge-${MAMBAFORGE_VERSION}-Linux-x86_64.sh -b -p /opt/python/${PREFIX_NAME}

# Fix permissions
sudo chown -R ubuntu:ubuntu $PREFIX_ROOT/${PREFIX_NAME}

# Install ipykernel
/opt/python/my-python/bin/pip install ipykernel
```

Finally you can register it as a new kernel:

```shell title="Terminal"
sudo /opt/python/my-python/bin/python -m ipykernel install --name my-python --display-name "My Python Custom"
```
