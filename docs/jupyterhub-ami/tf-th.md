# TensorFlow and PyTorch

Tensorflow and PyTorch GPU versions are installed in all Python environments.

```python title="Python"
import torch as th

print(th.__version__)
print(th.cuda.is_available())
print(th.cuda.device_count())
print(th.cuda.current_device())
print(th.cuda.get_device_name(th.cuda.current_device()))
print(th.backends.cudnn.version())
```

```python title="Python"
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
    These sample codes are included in sample notebooks: `pytorch-gpu.ipynb` and `tensorflow-gpu.ipynb`.
