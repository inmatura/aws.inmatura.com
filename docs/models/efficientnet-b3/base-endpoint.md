# Deploy an endpoint for the base EfficientNet model

The base [EfficientNet model](https://aws.amazon.com/marketplace/pp/prodview-b4jqie4ebeo4y)
provides image classification on the 1000 ImageNet labels.

!!! info "Custom model"
    To create a custom model to classify images in based in custom labels see [the Training page](/models/efficientnet-b3/train).

## 1. Subscribe to the offering

1. Log in to AWS with a user with administrative privileges
1. Navigate to the
[EfficientNet-B3](https://aws.amazon.com/marketplace/pp/prodview-b4jqie4ebeo4y)
listing on the AWS Marketplace
1. Click `Continue to Subscribe`
1. Click on `Accept offer` (it might take 1 or 2 minutes for AWS to accept the offer).

    Note that there is no charge for subscribing to this offering only when launching the model on SageMaker

1. Once you are subscribed click `Continue to Configuration`
1. On the `Configure and launch` page
    1. Select `SageMaker console` as the Launch Method (you can also use the AWS CLI)
    1. Select the version and region where you want to launch the model endpoint
    1. On `Amazon SageMaker options` select `Create a real-time inference endpoint`
1. Click on `View in Amazon SageMaker`

## 2. Create the endpoint

In the `Create endpoint` page:

1. Select a `Model name` e.g. `efficientnet-b3`
1. Select or create a new IAM role for executing the model
1. Under `Container definition`
    1. Verify `Use a model package subscription from AWS Marketplace` is selected
1. Click on `Next`
1. Select an `Endpoint name` e.g. `efficientnet-b3`
1. Under `Attach endpoint configuration` select `Create a new endpoint configuration`
1. Under `New endpoint configuration`
    1. Verify the new model (e.g. `efficientnet-b3`) is listed under `Production variants`
    1. Click on `Edit` in the `Actions` column and select the instance types you want for the endpoint. The minimun recommended is `ml.c5.xlarge`
    1. Click on `Create endpoint configuration`
1. Finally click on `Submit`

A new endpoint will be created (this can take a couple of minutes).

![SageMaker efficientnet-b3 endpoint](/assets/img/models/efficientnet-b3/sagemaker-endpoint.png)

## 3. Making a query

With the endpoint ready you will have an URL to make predictions, for example:

```
https://runtime.sagemaker.us-east-1.amazonaws.com/endpoints/efficientnet-b3/invocations
```

--8<--
docs/models/snippets/info-how-to-query.md
--8<--

A simple example using `boto` and this photo as input:

![Horses](/assets/img/models/efficientnet-b3/horses.jpg)

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

!!! note "Sorrel"
    Note that [`sorrel` is a type of horse](https://en.wikipedia.org/wiki/Sorrel_(horse)).

!!! info "Full API docs"
    For the complete documentation of the API including the different inputs and responses
    and more ways to query the Invocations endpoint see the [API page](/models/efficientnet-b3/api).

