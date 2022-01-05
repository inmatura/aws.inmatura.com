# GPU

The JupyterHub AMI includes NVIDIA drivers and multiple versions of CUDA to support
the GPUs available on AWS and the different data science library, no extra configuration is needed.

| Software         | Version     |
| ---------------- | ----------- |
| `NVIDIA Drivers` | `495.29.05` |
| `CUDA`           | `11.0`      |
| `CUDA`           | `11.1`      |
| `CUDA`           | `11.2`      |
| `CUDA`           | `11.3`      |
| `CUDA`           | `11.4`      |
| `CUDA`           | `11.5`      |

For example, after launching AMI in a `g4dn.xlarge` instance run `nvidia-smi`.

```shell title="Terminal"
$ nvidia-smi
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 495.29.05    Driver Version: 495.29.05    CUDA Version: 11.5     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  Tesla T4            On   | 00000000:00:1E.0 Off |                    0 |
| N/A   26C    P8     8W /  70W |      0MiB / 15109MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+
```
