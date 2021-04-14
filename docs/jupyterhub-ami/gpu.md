# GPU

The JupyterHub AMI includes NVIDIA drivers to support all GPU instance types
out of the box, no extra configuration is needed.

For example, after launching AMI in a `g4dn.xlarge` instance run `nvidia-smi`.

```
$ nvidia-smi
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 460.32.03    Driver Version: 460.32.03    CUDA Version: 11.2     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  Tesla T4            On   | 00000000:00:1E.0 Off |                    0 |
| N/A   26C    P8     9W /  70W |      0MiB / 15109MiB |      0%      Default |
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

!!! info "Version"
    The version of the drivers installed is `460.32.03`.

## CUDA

Cuda version `11.2` is included to work with latest PyTorch and TensorFlow versions.

## PyTorch and TensorFlow

To test PyTorch and TensorFlow support for GPU use the following snippets:

```python
import torch as th

print(th.__version__)
print(th.cuda.is_available())
print(th.cuda.device_count())
print(th.cuda.current_device())
print(th.cuda.get_device_name(th.cuda.current_device()))
print(th.backends.cudnn.version())
```

```python
import tensorflow as tf

print(tf.__version__)
print(tf.test.is_built_with_cuda())
sys_details = tf.sysconfig.get_build_info()
print(sys_details["cuda_version"])
print(tf.test.is_built_with_gpu_support())
print(tf.config.list_physical_devices("GPU"))
print(tf.test.gpu_device_name())
```

!!! info "Sample Notebooks"
    These are also part of the sample notebooks `pytorch-gpu.ipynb` and `tensorflow-gpu.ipynb`.