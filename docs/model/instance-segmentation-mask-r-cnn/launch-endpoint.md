# Deploy an Endpoint for Object detection Mask R-CNN

## 1. Subscribe to the offering

1. Log in to AWS with a user with administrative privileges
1. Navigate to the
[Object Detection Mask R-CNN](https://aws.amazon.com/marketplace/pp/prodview-dxs3ysuie4q5m)
listing on the AWS Marketplace
1. Click `Continue to Subscribe`
1. Click on `Accept offer` (it might take 1 or 2 minutes for AWS to accept the offer)

    Note that there is no charge for subscribing to this offering only when launching the Endpoint on SageMaker.

1. Once you are subscribed click `Continue to Configuration`
1. On the `Configure and launch` page
    1. Select `SageMaker console` as the Launch Method (you can also use the AWS CLI)
    1. Select the version and region where you want to launch the model endpoint
    1. On `Amazon SageMaker options` select `Create a real-time inference endpoint`
1. Click on `View in Amazon SageMaker`

## 2. Create the endpoint

In the `Create endpoint` page:

1. Select a `Model name` e.g. `img-obj-mask-r-cnn`
1. Select or create a new IAM role for executing the model
1. Under `Container definition`
    1. Verify `Use a model package subscription from AWS Marketplace` is selected
1. Click on `Next`
1. Select an `Endpoint name` e.g. `img-obj-mask-r-cnn`
1. Under `Attach endpoint configuration` select `Create a new endpoint configuration`
1. Under `New endpoint configuration`
    1. Verify the new model (e.g. `img-obj-mask-r-cnn`) is listed under `Production variants`
    1. Click on `Edit` in the `Actions` column and select the instance types you want for the endpoint. The minimun recommended is `ml.c5.xlarge`
    1. Click on `Create endpoint configuration`
1. Finally click on `Submit`

A new endpoint will be created (this can take a couple of minutes):

![SageMaker efficientnet-b3 endpoint](/assets/images/model/efficientnet-b3/sagemaker-endpoint.png)

## 3. Making a query

With the endpoint ready you will have an URL to make predictions, for example:

```
https://runtime.sagemaker.us-east-1.amazonaws.com/endpoints/img-obj-mask-r-cnn/invocations
```

!!! info "How to query this Endpoint"
    For complete documentation on how to query this endpoint see the [AWS Docs: InvokeEndpoint documentation in AWS](https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_runtime_InvokeEndpoint.html).

    The key part being how to handlee the
    [AWS Signature Version 4](https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html),
    for example [using Python](https://docs.aws.amazon.com/general/latest/gr/sigv4-signed-request-examples.html).

A simple example using `boto` and this photo as input:

![Horses](/assets/images/model/img-obj-mask-r-cnn/horse-guard.jpg){width=600px}

```python
import boto3

# Read image
with open("validation/horse-guard.jpg", "rb") as f:
    payload = bytearray(f.read())

# Make request
content_type = "image/jpeg"
accept_mime_type = "image/jpeg"

response = client.invoke_endpoint(
    EndpointName=endpoint_name,
    ContentType=content_type,
    Accept=accept_mime_type,
    Body=payload,
)

# Write segmented output image
with open("validation/horse-guard.segmented.jpg", "wb") as f:
    f.write(response["Body"].read())

```

Response:

![Horses](/assets/images/model/img-obj-mask-r-cnn/horse-guard.segmented.jpg){width=600px}


!!! info "Full API docs"
    For the complete documentation of the API including the different inputs and responses
    and more ways to query the Invocations endpoint see the [API page](/models/img-obj-mask-r-cnn/api).
