# EfficientNet-B3 API

The inference endpoint is a `POST` endpoint
that accepts multiple `content-type` for different image types and other query options.

## Content-type: `image/png` and `image/jpeg`

The simplest `content-type` supported are `image/jpeg` and `image/png` images.

The image have to be added to the request body in binary format. The response will be the top-k
predictions for the given image.


=== "Python (boto3)"

    Using the `boto3` python library:

    ```python
    import boto3

    client = boto3.client("sagemaker-runtime")
    endpoint_name = "efficientnet-b3"

    content_type = "image/jpeg"

    with open("validation/horses.jpg", "rb") as f:
        payload = f.read()
        payload = bytearray(payload)

    response = client.invoke_endpoint(
        EndpointName=endpoint_name, ContentType=content_type, Body=payload
    )

    print(response["Body"].read())
    ```

    ```
    ["sorrel","cowboy hat, ten-gallon hat","hartebeest","worm fence, snake fence, snake-rail fence, Virginia fence","horse cart, horse-cart"]
    ```

=== "AWS CLI"

    Using the [`AWS CLI`](https://aws.amazon.com/cli/).

    ```
    aws sagemaker-runtime invoke-endpoint \
        --endpoint-name efficientnet-b3 \
        --content-type image/jpeg \
        --body fileb://./horses.jpg >(cat)
    ```

=== "CURL"

    In `cURL` it will be like doing doing:

    ```
    curl -X POST "https://runtime.sagemaker.us-east-1.amazonaws.com/endpoints/efficientnet-b3/invocations" \
      -H  "Content-Type: image/jpeg" \
      --data-binary "@horses.jpg"
    ```

    ```
    ["sorrel","cowboy hat, ten-gallon hat","hartebeest","worm fence, snake fence, snake-rail fence, Virginia fence","horse cart, horse-cart"]
    ```

    Note that this command requires modification to authenticate the request with
    [AWS Signature Version 4](https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html)


## Content-type: multipart/form-data

The enpoint also allows for the `content-type: multipart/form-data`.

This allows users to send multiple images and get labels for each image in one single request.

=== "Python (boto3)"

    We use [`requests`](https://requests.readthedocs.io/en/master/)
    to easily construct the body of a `multipart/form-data` request.

    ```python
    import boto3
    import requests

    r = requests.Request(
        "POST",
        "http://localhost:8080/invocations",
        files={
            "image1": open("validation/horses.jpg", "rb"),
            "image2": open("validation/koala.jpg", "rb"),
            "image3": open("validation/panda.jpg", "rb"),
        },
    )
    r = r.prepare()

    content_type = r.headers["Content-Type"]
    payload = r.body

    # Make query

    client = boto3.client("sagemaker-runtime")
    endpoint_name = "efficientnet-b3"

    response = client.invoke_endpoint(
        EndpointName=endpoint_name, ContentType=content_type, Body=payload
    )

    print(response["Body"].read())
    ```

    ```
    {
      "image1": ["sorrel","cowboy hat, ten-gallon hat","hartebeest","worm fence, snake fence, snake-rail fence, Virginia fence","horse cart, horse-cart"],
      "image2": ["koala, koala bear, kangaroo bear, native bear, Phascolarctos cinereus","wombat","indri, indris, Indri indri, Indri brevicaudatus","teddy, teddy bear","Madagascar cat, ring-tailed lemur, Lemur catta"],
      "image3": ["giant panda, panda, panda bear, coon bear, Ailuropoda melanoleuca","Arctic fox, white fox, Alopex lagopus","ice bear, polar bear, Ursus Maritimus, Thalarctos maritimus","lesser panda, red panda, panda, bear cat, cat bear, Ailurus fulgens","white wolf, Arctic wolf, Canis lupus tundrarum"]
    }
    ```

=== "CURL"

    In `cURL` it will be like doing doing:

    ```
    curl -X POST "https://runtime.sagemaker.us-east-1.amazonaws.com/endpoints/efficientnet-b3/invocations" \
      -H  "Content-Type: multipart/form-data" \
      -F "file=@horses.jpg;type=image/jpeg" \
      -F "file2=@koala.jpg;type=image/jpeg" \
      -F "file3=@panda.jpg;type=image/jpeg"

    ```

    ```
    {
      "image1": ["sorrel","cowboy hat, ten-gallon hat","hartebeest","worm fence, snake fence, snake-rail fence, Virginia fence","horse cart, horse-cart"],
      "image2": ["koala, koala bear, kangaroo bear, native bear, Phascolarctos cinereus","wombat","indri, indris, Indri indri, Indri brevicaudatus","teddy, teddy bear","Madagascar cat, ring-tailed lemur, Lemur catta"],
      "image3": ["giant panda, panda, panda bear, coon bear, Ailuropoda melanoleuca","Arctic fox, white fox, Alopex lagopus","ice bear, polar bear, Ursus Maritimus, Thalarctos maritimus","lesser panda, red panda, panda, bear cat, cat bear, Ailurus fulgens","white wolf, Arctic wolf, Canis lupus tundrarum"]
    }
    ```

    Note that this command requires modification to authenticate the request with
    [AWS Signature Version 4](https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html)


## Custom Attributes

The API accepts the [`AWS Custom-Attributes` header](https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_runtime_InvokeEndpoint.html)
from SageMaker to control the different attributes of the model.

This header should be `JSON` formated string with the different values for the parameters.

| Param | Default | Description |
|---|---|---|
| `top_k` | `5` | Top number of label to return |

For example a to get the top-1 reply instead of the default of 5:

```
X-Amzn-SageMaker-Custom-Attributes: {"top_k": 1}
```

For example to just get one reply:

=== "Python (boto3)"

    Using the `boto3` python library:

    ```python
    import boto3

    client = boto3.client("sagemaker-runtime")
    endpoint_name = "efficientnet-b3"

    content_type = "image/jpeg"
    custom_attributes = '{"top_k": 1}'

    with open("validation/horses.jpg", "rb") as f:
        payload = f.read()
        payload = bytearray(payload)

    response = client.invoke_endpoint(
        EndpointName=endpoint_name,
        ContentType=content_type,
        CustomAttributes=custom_attributes
        Body=payload,
    )

    print(response["Body"].read())
    ```

    ```
    ["sorrel"]
    ```

