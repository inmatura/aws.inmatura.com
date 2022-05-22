# GPT-2 Performance

The GPT-2 models is very big (`+7 Gb` in disk) model.
In memory this model even bigger and can take a lot of resources to make inferences.

For this reason we recommended a minimum type of `ml.c5.4xlarge`.

- On this instance type it can take up to 40-50 secs to get a response for one query

The model supports GPU instances out of the box, for example using the `ml.g4dn.xlarge` instance

- This provides faster inference times, around 10-20 seconds

Note that because of the nature of this model and API it can only process one request at a time.
So you would need to scale this accordingly to how many concurrent users you expect.

## Other resouces

- [Load test and optimize an Amazon SageMaker endpoint using automatic scaling](https://aws.amazon.com/blogs/machine-learning/load-test-and-optimize-an-amazon-sagemaker-endpoint-using-automatic-scaling/)
