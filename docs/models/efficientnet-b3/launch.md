# Launching the EfficientNet-B3 model in SageMaker

1. Log in to AWS with a user with administrative privileges
1. Navigate to the
[EfficientNet-B3](https://aws.amazon.com/marketplace/pp/Daniel-Rodriguez-GPT-2-XL-Text-generation/prodview-cdujckyfypprg)
listing on the AWS Marketplace
1. Click `Continue to Subscribe`
1. Click on `Accept offer` (it might take 1 or 2 minutes for AWS to accept the offer).

    Note that there is no charge for subscribing to this offering only when launching the model on SageMaker

1. Once you are subscribed click `Continue to Configuration`
1. On the `Configure and launch` page
    1. Select `SageMaker console` as the Launch Method (you can also use the CLI if you preffer)
    1. Select the version and region where you want to launch the model
    1. On `Amazon SageMaker options` select `Create a real-time inference endpoint`
    1. Click on `View in Amazon SageMaker`
1. You will be sent to the `Create endpoint` wizard on the Amazon SageMaker console
    1. Name the model, e.g. `efficientnet-b3`
    1. Select or create a new IAM role for executing the model
    1. Under `Container definition` be sure `Use a model package subscription from AWS Marketplace` is selected
    1. Click on `Next`
    1. Name the endpoint, e.g. `efficientnet-b3`
    1. Under `Attach endpoint configuration` select `Create a new endpoint configuration`
    1. Be sure the named model (e.g. `efficientnet-b3`) is listed under `Production variants`

        Here you can select the instance types you want for the endpoint. The minimun required is `ml.m5.4xlarge`

    1. Click on `Create endpoint configuration`
    1. Finally click on `Submit`

A new endpoint will be created (this can take a couple of minutes).

![SageMaker efficientnet-b3 endpoint](/assets/img/models/efficientnet-b3/sagemaker-endpoint.png)

## Making a query

With the endpoint ready you will have an URL to make predictions, for example:
```
https://runtime.sagemaker.us-east-1.amazonaws.com/endpoints/efficientnet-b3/invocations
```

For complete documentation on how to query this endpoint see the [AWS Docs: InvokeEndpoint documentation in AWS](https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_runtime_InvokeEndpoint.html).

The key part being how to handlee the
[AWS Signature Version 4](https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html),
for example [using Python](https://docs.aws.amazon.com/general/latest/gr/sigv4-signed-request-examples.html).

We provide some examples using some HTTP clients.

We will use this photo of some horses as an example:

![Horses](/assets/img/models/efficientnet-b3/horses.jpg)

### boto

You can use the Python `boto3` library to make a query.

```python
import boto3

client = boto3.client("sagemaker-runtime")
endpoint_name = "efficientnet-b3"

content_type = "image/jpeg"

with open("validation/horses.jpg", "rb") as f:
    payload = bytearray(f.read())

response = client.invoke_endpoint(
    EndpointName=endpoint_name, ContentType=content_type, Body=payload
)

print(response["Body"].read())
```

Response:

```json
["sorrel","cowboy hat, ten-gallon hat","hartebeest","worm fence, snake fence, snake-rail fence, Virginia fence","horse cart, horse-cart"]
```

Note that [`sorrel` is a type of horse](https://en.wikipedia.org/wiki/Sorrel_(horse)).

### API docs

For a complete documentation of the API with it's different modes and parameters
see [API](/models/efficientnet-b3/api).

