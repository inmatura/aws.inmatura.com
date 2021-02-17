# Getting started with GPT-2

## Launching the model on Sage Maker

1. Log in to AWS with a user with administrative privileges
1. Navigate to the
[GPT-2](https://aws.amazon.com/marketplace/pp/Daniel-Rodriguez-GPT-2-XL-Text-generation/prodview-cdujckyfypprg)
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
    1. Name the model, e.g. `gpt-2`
    1. Select or create a new IAM role for executing the model
    1. Under `Container definition` be sure `Use a model package subscription from AWS Marketplace` is selected
    1. Click on `Next`
    1. Name the endpoint, e.g. `gpt-2`
    1. Under `Attach endpoint configuration` select `Create a new endpoint configuration`
    1. Be sure the named model (e.g. `gpt-2`) is listed under `Production variants`

        Here you can select the instance types you want for the endpoint. The minimun required is `ml.m5.4xlarge`

    1. Click on `Create endpoint configuration`
    1. Finally click on `Submit`

A new endpoint will be created (this can take a couple of minutes).

![SageMaker GPT-2 endpoint](/assets/img/models/gpt-2/sagemaker-endpoint.png)

## Making a query

With the endpoint ready you will have an URL to make predictions, for example:
```
https://runtime.sagemaker.us-east-1.amazonaws.com/endpoints/gpt-2/invocations
```

For documentation on how to query it see the [InvokeEndpoint documentation in AWS](https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_runtime_InvokeEndpoint.html).

The key part being how to handlee the
[AWS Signature Version 4](https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html),
for example [using Python](https://docs.aws.amazon.com/general/latest/gr/sigv4-signed-request-examples.html).

### Insonmia

To test the endpoint you can use the [Insonmia HTTP client](https://insomnia.rest)
that supports AWS Authentication.

Just select the Auth method `AWS IAM v4` and fill the credentials, region and use
`sagemaker` as the service.

![Insonmia Auth](/assets/img/models/insonmia-aws-auth.png)

Select `JSON` as the body type and use the following test query:

```
{
    "input": "This is an input text",
    "seed": 0
}
```

The result should be:

```
[
  "This is an input text string that has a single character.\n\nExample: This is the label of the message.\n\nA message is the textual content of a message. For example, a message consists of a message-id, a subject",
  "This is an input text file.\n\nAn example input file would look like:\n\nInputFile. write! (\"foo.txt\", \"Hello world!\");\n\nYou can read and write the contents of a file using File#read",
  "This is an input textbox for a user entered text.\n\n[ { \" text \" : \" Hello World \" }, { \" text \" : \" Goodbye World \" }, { \" text \" : \" Hello Again \" }, { \" text \" :"
]
```

### boto

You can also use the Python `boto3` library to make a query.

```python
import boto3

client = boto3.client('sagemaker-runtime')
endpoint_name = "gpt-2"

content_type = "application/json"
payload = '{"input": "This is an input text"}'

response = client.invoke_endpoint(
    EndpointName=endpoint_name,
    ContentType=content_type,
    Body=payload
)

response["Body"].read()
```

### API docs

For a complete documentation of the API with it's different modes and parameters
see [API](/models/gpt-2/api).

