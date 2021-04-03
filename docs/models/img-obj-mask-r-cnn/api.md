# Object Detection Mask R-CNN model: API

The model Endpoint accepts an image `Content-Type` of: `image/jpeg` or `image/png`
and returns an image or a JSON object. The reponse type can be controlled by the `Accept` header or by the [`Custom Attributes` header](https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_runtime_InvokeEndpoint.html#API_runtime_InvokeEndpoint_RequestSyntax).

Example image `horse-guard.jpg`:

![Horse Guard](/assets/img/models/img-obj-mask-r-cnn/horse-guard.jpg){width=300px}

=== "Python (boto3) - JPEG"

    Using the `boto3` python library to make a request and save the output to a file.

    We use set the `Accept` header to `image/jpeg` so that the model returns a segmented image.

    ```python
    import boto3

    client = boto3.client("sagemaker-runtime")
    endpoint_name = "img-obj-mask-r-cnn"

    # Read image
    with open("horse-guard.jpg", "rb") as f:
        payload = bytearray(f.read())

    # Make request
    content_type = "image/jpeg"
    accept_mime_type = "image/jpeg"

    response = client.invoke_endpoint(
        EndpointName=endpoint_name,
        Accept=accept_mime_type,
        ContentType=content_type,
        Body=payload,
    )

    # Write segmented output image
    with open("horse-guard.segmented.jpg", "wb") as f:
        f.write(response["Body"].read())
    ```

    ![Horses](/assets/img/models/img-obj-mask-r-cnn/horse-guard.segmented.jpg){width=600px}

=== "Python (boto3) - JSON"

    Using the `Custom-Attributes` Header to control the output instead of the `Accept` header.

    Note that `Accept` is used first.

    ```python
    import boto3

    client = boto3.client("sagemaker-runtime")
    endpoint_name = "img-obj-mask-r-cnn"

    # Read image
    with open("validation/horse-guard.jpg", "rb") as f:
        payload = bytearray(f.read())

    # Make request
    content_type = "image/jpeg"
    custom_attributes = '{"response_type": "json"}'

    response = client.invoke_endpoint(
        EndpointName=endpoint_name,
        CustomAttributes=custom_attributes
        ContentType=content_type,
        Body=payload,
    )

    # Parse and print output image
    import json

    print(json.loads(response["Body"].read()))
    ```

    ```json
    {
        "labels":
            ["horse 100%", "person 99%", "person 99%", "person 99%", "person 98%", "person 93%", "person 92%", "frisbee 90%", "umbrella 89%", "person 53%"],
        "boxes": [
            [127.11386108398438, 247.31301879882812, 465.427978515625, 480.0],
            [254.72451782226562, 164.79159545898438, 335.8401184082031, 401.29840087890625],
            [0.9573012590408325, 279.462646484375, 75.12348175048828, 479.47015380859375],
            [49.450260162353516, 275.5840759277344, 79.73651123046875, 369.51434326171875],
            [114.95684051513672, 268.72479248046875, 149.48388671875, 397.9055480957031],
            [512.51806640625, 279.2389831542969, 561.9500732421875, 382.5887145996094],
            [560.3663330078125, 272.36761474609375, 598.057373046875, 356.83721923828125],
            [306.2652587890625, 147.22177124023438, 315.6444396972656, 168.5187225341797],
            [507.4710388183594, 267.3088684082031, 571.6740112304688, 296.2601623535156],
            [594.297607421875, 264.638427734375, 614.7077026367188, 345.806396484375]
        ]
    }
    ```

=== "AWS CLI"

    Using the [`AWS CLI`](https://aws.amazon.com/cli/).

    ```
    aws sagemaker-runtime invoke-endpoint \
        --endpoint-name img-obj-mask-r-cnn \
        --accept application/json \
        --content-type image/jpeg \
        --body fileb://./horse-guard.jpg >(cat)
    ```

=== "CURL"

    In `cURL` it will be like doing doing:

    ```
    curl -X POST "https://runtime.sagemaker.us-east-1.amazonaws.com/endpoints/img-obj-mask-r-cnn/invocations" \
      -H "Accept: application/json" \
      -H "Content-Type: image/jpeg" \
      --data-binary "@horse-guard.jpg"
    ```

    Note that this command requires modification to authenticate the request using
    [AWS Signature Version 4](https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html)


## Response

The API Reponse is based on the `Accept` header of the request:

1. `image/jpeg`: Segmented image in JPEG format
1. `image/png`: Segmented image in PNG format
1. `application/json`: JSON object with the metadata of the objects founds

The JSON object has the following structure:

```json
{
    "labels": ["<label 1> <probability>", "<label 2> probability", ...],
    "boxes": [
        [x1, y1, x2, y2],
        [x1, y2, x2, y2],
        ...
    ]
}
```

The coordinates indicate a box from point `(x1, y1)` to `(x2, y2)`.
The `(0, 0)` point is the top left corner of the image

## Custom Attributes

The API uses the
[`AWS Custom-Attributes` header](https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_runtime_InvokeEndpoint.html)
from SageMaker to control the parameters and output of the model.

This header should be `JSON` formated string with the different values for the parameters.

| Param | Default | Description |
|---|---|---|
| `response_type` | `""` `(str)` | Response type. One of: `jpeg`, `png`, `json`. (Same as the Accept header). |

Example

```
X-Amzn-SageMaker-Custom-Attributes: {"top_k": 1}
```
