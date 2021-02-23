# EfficientNet-B3 API

The inference endpoint is a POST endpoint.
This endpoint accepts multiple `content-type`'s that allow for flexible query options.

## `image/png` and `image/jpeg`

The simplest `content-type`s supported are `jpeg` and `png` images.

The image have to be added to the request body in binary format. The response will be the top-5
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
    aws sagemaker-runtime invoke-endpoint --endpoint-name efficientnet-b3 --content-type image/jpeg --body fileb://./horses.jpg >(cat)
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


## `multipart/form-data`

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
      "image1":["sorrel","cowboy hat, ten-gallon hat","hartebeest","worm fence, snake fence, snake-rail fence, Virginia fence","horse cart, horse-cart"],
      "image2":["koala, koala bear, kangaroo bear, native bear, Phascolarctos cinereus","wombat","indri, indris, Indri indri, Indri brevicaudatus","teddy, teddy bear","Madagascar cat, ring-tailed lemur, Lemur catta"],
      "image3":["giant panda, panda, panda bear, coon bear, Ailuropoda melanoleuca","Arctic fox, white fox, Alopex lagopus","ice bear, polar bear, Ursus Maritimus, Thalarctos maritimus","lesser panda, red panda, panda, bear cat, cat bear, Ailurus fulgens","white wolf, Arctic wolf, Canis lupus tundrarum"]
    }
    ```

=== "CURL"

    In `cURL` it will be like doing doing:

    ```
    curl -X POST "https://runtime.sagemaker.us-east-1.amazonaws.com/endpoints/efficientnet-b3/invocations" \
      -H  "Content-Type: multipart/form-data" \
      -F "file=@horses.jpg;type=image/jpeg" \
      -F "file2=@koala.jpg;type=image/jpeg" \
      -F "file2=@panda.jpg;type=image/jpeg"

    ```

    ```
    {
      "image1":["sorrel","cowboy hat, ten-gallon hat","hartebeest","worm fence, snake fence, snake-rail fence, Virginia fence","horse cart, horse-cart"],
      "image2":["koala, koala bear, kangaroo bear, native bear, Phascolarctos cinereus","wombat","indri, indris, Indri indri, Indri brevicaudatus","teddy, teddy bear","Madagascar cat, ring-tailed lemur, Lemur catta"],
      "image3":["giant panda, panda, panda bear, coon bear, Ailuropoda melanoleuca","Arctic fox, white fox, Alopex lagopus","ice bear, polar bear, Ursus Maritimus, Thalarctos maritimus","lesser panda, red panda, panda, bear cat, cat bear, Ailurus fulgens","white wolf, Arctic wolf, Canis lupus tundrarum"]
    }
    ```

    Note that this command requires modification to authenticate the request with
    [AWS Signature Version 4](https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html)

