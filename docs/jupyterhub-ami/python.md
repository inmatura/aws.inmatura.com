# Python

The JupyterHub AMI comes with multiple Python versions plus some
data science packages installed out of the box.
Extra packages can be easily installed on each Python environment.

## Python versions

Each Python installation is independent of each other, they are based on `Mambaforge`.

| Version         | Location                 |
| --------------- | ------------------------ |
| `Python 3.9.7`  | `/opt/python/3.9`        |
| `Python 3.8.12` | `/opt/python/3.8`        |
| `Python 3.7.12` | `/opt/python/3.7`        |
| `Python 3.8.12` | `/opt/python/3.8-rapids` |

!!! info "Owner"

    The owner of this directories is the `ubuntu` user (the same one used to SSH).

### Python Packages

For the all the environments the following packages are installed.

| Package          | Version        |
| ---------------- | -------------- |
| `altair`         | `4.2.0`        |
| `awscli`         | `1.22.27`      |
| `beautifulsoup4` | `4.10.0`       |
| `bokeh`          | `2.4.2`        |
| `bqplot`         | `0.12.31`      |
| `cloudpickle`    | `2.0.0`        |
| `dash`           | `2.0.0`        |
| `dask`           | `2021.12.0`    |
| `gensim`         | `4.1.2`        |
| `ipykernel`      | `6.6.1`        |
| `ipython`        | `7.30.1`       |
| `ipywidgets`     | `7.6.5`        |
| `matplotlib`     | `3.5.1`        |
| `nltk`           | `3.6.7`        |
| `numpy`          | `1.22.0`       |
| `nycflights13`   | `0.0.3`        |
| `pandas`         | `1.3.5`        |
| `Pillow`         | `9.0.0`        |
| `pyarrow`        | `6.0.1`        |
| `pyspark`        | `3.2.0`        |
| `requests`       | `2.26.0`       |
| `s3fs`           | `0.4.2`        |
| `scikit-image`   | `0.19.1`       |
| `scikit-learn`   | `1.0.2`        |
| `scipy`          | `1.7.3`        |
| `Scrapy`         | `2.5.1`        |
| `seaborn`        | `0.11.2`       |
| `spacy`          | `3.2.1`        |
| `statsmodels`    | `0.13.1`       |
| `tensorboard`    | `2.7.0`        |
| `tensorflow`     | `2.7.0`        |
| `torch`          | `1.10.1+cu113` |
| `torchaudio`     | `0.10.1+cu113` |
| `torchvision`    | `0.11.2+cu113` |
| `xgboost`        | `1.5.1`        |

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
