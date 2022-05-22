# Instance segmentation Mask R-CNN: Performance

The model supports both CPU and GPU in instance types.
Depending on the instance type selected the inference time might vary considerably. The recommended approach is to use an instance with a GPU.

We provide some simple benchmarks on some instance types but encourage you to do your own to determine
the instance type and number of concurrent instances combination for your use case and number of users.

| Instance Type | Concurrent users | Request Count | Failure Count | Median Response Time (ms) | 90%ile Response Time (ms) | Average Response Time (ms) | Min Response Time (ms) | Max Response Time (ms) | Average Content Size (bytes) | Number of Requests/s |
|---|---|---|---|---|---|---|---|---|---|---|
| ml.m5.xlarge | 1 | 100 | 0 | 7400 | 8800 | 7292 | 5542 | 9213 | 1014 | 0.1 |
| ml.g4dn.2xlarge | 1 | 100 | 0 | 630 | 1200 | 758 | 423 | 2668 | 1044 | 0.5 |
| ml.g4dn.2xlarge | 5 | 500 | 0 | 690 | 1500 | 843 | 407 | 3095 | 1039 | 2 |
| ml.g4dn.2xlarge | 10 | 1000 | 0 | 950 | 2000 | 1138 | 422 | 4713 | 1053 | 3.1 |
<!-- |  |  |  |  |  |  |  |  |  |  |  | -->

## Other resources

- [Load test and optimize an Amazon SageMaker endpoint using automatic scaling](https://aws.amazon.com/blogs/machine-learning/load-test-and-optimize-an-amazon-sagemaker-endpoint-using-automatic-scaling/)
