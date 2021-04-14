# GPU

The JupyterHub AMI includes NVIDIA drivers to support all GPU instance types
out of the box, no extra configuration is needed.

For example, after launching AMI in a `g4dn` instance run `nvidia-smi`.

```
```

!!! info "Version"
    The version of the drivers installed is `460`.

## CUDA

Cuda version `11.2` is included and it's tested using the latest PyTorch and TensorFlow versions.

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
