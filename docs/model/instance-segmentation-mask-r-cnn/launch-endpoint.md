# Deploy an Endpoint for Instance segmentation Mask R-CNN

## 1. Subscribe to the offering

1. Log in to AWS with a user with administrative privileges
1. Navigate to the
[Instance segmentation Mask R-CNN](https://aws.amazon.com/marketplace/pp/prodview-dxs3ysuie4q5m)
listing on the AWS Marketplace
1. Click `Continue to Subscribe`
1. Click on `Accept offer` (it might take 1 or 2 minutes for AWS to accept the offer)
    - Note that there is no charge for subscribing to this offering
    - Billing starts only when launching a Model Endpoint on SageMaker
1. Once you are subscribed click `Continue to Configuration`
1. On the `Configure and launch` page
    1. Select `SageMaker console` as the Launch Method (you can also use the AWS CLI)
    1. Select the version and region where you want to launch the model endpoint
    1. On `Amazon SageMaker options` select `Create a real-time inference endpoint`
1. Click on `View in Amazon SageMaker`

## 2. Create the endpoint

In the `Create endpoint` page:

1. Select a `Model name` e.g. `my-instance-segmentation`
1. Select or create a new IAM role for executing the model
1. Under `Container definition`:
    1. Verify `Use a model package subscription from AWS Marketplace` is selected
1. Click on `Next`
1. Select an `Endpoint name` e.g. `my-instance-segmentation`
1. Under `Attach endpoint configuration` select: `Create a new endpoint configuration`
1. Under `New endpoint configuration`:
    1. Verify the new model (e.g. `my-instance-segmentation`) is listed under `Production variants`
    1. Click on `Edit` in the `Actions` column to select the instance types you want for the endpoint. The minimun recommended is `ml.c5.xlarge`
    1. Click on `Create endpoint configuration`
1. Finally click on `Submit`

A new endpoint will be created (this might take a couple of minutes):

![SageMaker Endpoint](/assets/images/model/instance-segmentation-mask-r-cnn/sagemaker-endpoint.png)

## 3. Making a query

With the endpoint ready you will have an URL to make predictions, for example:

```plain title="SageMaker Endpoint URL"
https://runtime.sagemaker.us-east-1.amazonaws.com/endpoints/instance-segmentation-mask-r-cnn/invocations
```

This endpoint requires authentication using the
[AWS Signature Version 4](https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html)

- For complete documentation on how to query this endpoint see the [AWS Docs: InvokeEndpoint documentation in AWS](https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_runtime_InvokeEndpoint.html).
- For example: [using Python](https://docs.aws.amazon.com/general/latest/gr/sigv4-signed-request-examples.html).

We also provide example code to make a query to this Invocations endpoint
on the [API docs](/model/instance-segmentation-mask-r-cnn/api).
