# GPU

The JupyterHub AMI includes NVIDIA drivers and multiple versions of CUDA to support
the GPUs available on AWS and the different data science libraries, no extra configuration is needed.

| Software         | Version     |
| ---------------- | ----------- |
| `NVIDIA Drivers` | `495.29.05` |

For example, after launching AMI in a `g4dn.xlarge` instance:

```shell title="Terminal"
$ nvidia-smi
ubuntu@ip-172-31-27-202:~$ nvidia-smi
Tue May 16 21:58:15 2023
+---------------------------------------------------------------------------------------+
| NVIDIA-SMI 530.30.02              Driver Version: 530.30.02    CUDA Version: 12.1     |
|-----------------------------------------+----------------------+----------------------+
| GPU  Name                  Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf            Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                                         |                      |               MIG M. |
|=========================================+======================+======================|
|   0  Tesla T4                        On | 00000000:00:1E.0 Off |                    0 |
| N/A   44C    P0               27W /  70W|   2248MiB / 15360MiB |      0%      Default |
|                                         |                      |                  N/A |
+-----------------------------------------+----------------------+----------------------+

+---------------------------------------------------------------------------------------+
| Processes:                                                                            |
|  GPU   GI   CI        PID   Type   Process name                            GPU Memory |
|        ID   ID                                                             Usage      |
|=======================================================================================|
|    0   N/A  N/A      3003      C   /opt/python/3.10-rapids/bin/python         2144MiB |
|    0   N/A  N/A      3058      C   /opt/python/3.10/bin/python                 100MiB |
+---------------------------------------------------------------------------------------+
```

## Cuda

The different versions of Cuda to support Tensorflow and PyTorch are installed
as conda packages and are available on the respective [Python](/ami/jupyterhub/python/) installations.
