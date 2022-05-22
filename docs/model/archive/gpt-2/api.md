# GPT-2 API

The inference endpoint is a POST endpoint that receives a JSON object on the body.

Input of the endpoint is a JSON object in the `Body` that contains the input to the model and the parameters
to control the different modes for text generation.

```
{
    "input": "This is an input text",
    "max_length": 50,
    "mode": "sample-top-p",
    "top_p": 0.92,
    "top_k": 50,
    "temperature": 0.7,
    "num_beams": 5,
    "no_repeat_ngram_size": 2,
    "num_return_sequences": 3,
    "seed": -1
}
```

The response of the model is a list of generated sequences.

```
[
  "This is an input text file which is created from a file.\n\nThis is the input text file which will be converted to a PDF and used as the source text.\n\nThis is the text file that is used to convert the PDF to",
  "This is an input text field.\n\nYou can customize this field through the following parameters:",
  "This is an input text box which has a lot of options. You will be able to change the size of the text and change the font and line height.\n\nYou can also add or remove the \"back\" button. If you select a"
]
```


Querying this [InvokeEndpoint](https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_runtime_InvokeEndpoint.html)
requires to handle the [AWS Signature Version 4](https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html).
We provide some examples on how to query this endpoint:


=== "Python (boto3)"

    Using the `boto3` python library:

    ```python
    content_type = "application/json"

    payload = json.dumps({"input": "This is the input of the algorithm"})

    response = client.invoke_endpoint(
        EndpointName=endpoint_name, ContentType=content_type, Body=payload
    )

    print(json.loads(response["Body"].read()))
    ```

    ```
    [
        'This is the input of the algorithm, and you can see that it has a few iterations (3, 4, 5, 6) and ends with a "cursor" (and you can see that there is an arrow pointing right).\n\n',
        'This is the input of the algorithm, which is a string (a list of letters) separated by a period. The only thing that is really guaranteed here is that the input has a certain length, and no more than 255 characters. This is a',
        'This is the input of the algorithm. The values you enter should be numbers in the range of 0–999. You can use a number of different input types:\n\n1–1,000: One of these random numbers (0–999'
    ]
    ```

=== "Python (requests)"

    Using [Python requests](https://requests.readthedocs.io/en/master/)
    and the Python [aws-requests-auth](https://github.com/DavidMuller/aws-requests-auth)
    library to handle the [AWS Signature v4](https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html) workflow.

    ```python
    import requests
    from aws_requests_auth.boto_utils import BotoAWSRequestsAuth

    auth = BotoAWSRequestsAuth(
        aws_host="runtime.sagemaker.us-east-1.amazonaws.com",
        aws_region="us-east-1",
        aws_service="sagemaker",
    )

    data = {"input": "Now we are using Python requests"}

    response = requests.post(
        "https://runtime.sagemaker.us-east-1.amazonaws.com/endpoints/gpt-2/invocations",
        json=data,
        auth=auth,
    )

    print(response.json())
    ```

    ```
    [
        'Now we are using Python requests module. You need to install it as follows.\n\nFor Python 2.7 :\n\nsudo apt install python-requests\n\nFor Python 3.x :\n\nsudo pip install requests\n\nStep',
        "Now we are using Python requests library to make a request to http://www.sitemap.org. We will make a GET request to the URL and get a list of all the site's pages.\n\n#include <Python.h",
        "Now we are using Python requests with Flask, with a few tweaks. I'll explain how to set up a simple API client with Python 3 and Flask 3 (which was just added as a module, just a week ago!).\n\nHere is the"
    ]
    ```

=== "AWS CLI"

    Using the [`AWS CLI`](https://aws.amazon.com/cli/).

    ```
    aws sagemaker-runtime invoke-endpoint \
        --endpoint-name gpt-2 \
        --content-type application/json \
        --body '{"input": "Now we use the AWS CLI"} \
        output.json
    ```

    ```
    $ cat output.json
    [
        "Now we use the AWS CLI to run the task to set up the environment:\n\n# set the AMI as the instance\n\naws ec2 describe-instance-role \"arn:aws:iam::123456789012:role",
        "Now we use the AWS CLI to create a new cloud resource. AWS CLI will generate a public key using the s3_key that we generated earlier. We'll use this to encrypt the data within this archive in order to protect the data from being",
        "Now we use the AWS CLI to get all of the public keys.\n\n$ aws ec2 describe-public-keys [{\"AccessKeyId\": \"your-access-key-id\", \"SecretAccessKey\": \"your-secret"
    ]
    ```

=== "CURL"

    Using `cURL` it will be like doing doing:

    ```
    curl -X POST "https://runtime.sagemaker.us-east-1.amazonaws.com/endpoints/gpt-2/invocations" \
      -H  "Content-Type: application/json" \
      --data '{"input": "Querying the model using curl."}'

    ```

    Note that this command requires modification to authenticate the request with
    [AWS Signature Version 4](https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html).


## Parameters

| Param | Deescription | Default |
|---|---|---|
| `input` | Text to be completed | **required** |
| `max_length` | Number of works to be generated | `100` |
| `num_return_sequences` | Number of sequences to return | `3` |
| `mode` | Options: `sample-top-p`, `sample-top-k`, `sample`, `beam`, `greedy` | `sample-top-p` |
| `top_p` | Top probability | `0.92` |
| `top_k` | Top K | `50` |
| `temperature` | Temperature | `0.7` |
| `num_beams` | Number of beams | `5` |
| `no_repeat_ngram_size` | No repeat n-gram size | `2` |
| `seed` | Set random seed before making a prediction | `None` |

The `input`, `max_length` and `num_return_sequences` parameters can be used in all modes.

## Mode: `sample-top-p`

This is the default mode to generate text.
It works as a nice default for a variety of inputs.

These parameters can be used on this mode:

| Param | Default value |
|---|---|
| `top_p` | `0.92` |
| `top_p` | `50` |

## Mode: `sample-top-k`

These parameters can be used on this mode:

| Param | Default value |
|---|---|
| `top_k` | `50` |

## Mode: `sample`

This mode works as a general version of `sample-top-p` and `sample-top-k`.

These parameters can be used on this mode:

| Param | Default value |
|---|---|
| `top_p` | `0.92` |
| `top_k` | `50` |
| `temperature` | `0.7` |

## Mode: `beam`

These parameters can be used on this mode:

| Param | Default value |
|---|---|
| `num_beams` | `5` |
| `no_repeat_ngram_size` | `2` |

## Mode: `greedy`

There are no arguments on this mode.
