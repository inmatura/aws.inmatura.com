# PyTorch and Tensorflow

GPU versions for both libraries are installed in all Python environments.

```python title="Python"
import torch as th

print(th.__version__)
print(th.cuda.is_available())
print(th.cuda.device_count())
print(th.cuda.current_device())
print(th.cuda.get_device_name(th.cuda.current_device()))
print(th.backends.cudnn.version())
```

```plain title="Output"
2.0.1+cu118
True
1
0
Tesla T4
8600
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

```plain title="Output"
2.12.0
True
11.8
True
[PhysicalDevice(name='/physical_device:GPU:0', device_type='GPU')]
/device:GPU:0
```


!!! info "Sample Notebooks"
    These code samples are included in the AMI: `pytorch-gpu.ipynb` and `tensorflow-gpu.ipynb`.
