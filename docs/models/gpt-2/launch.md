# Launching the GPT-2 model in SageMaker

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

With the SageMaker Endpoint ready you will have an HTTP endpoint to make predictions, for example:
```
https://runtime.sagemaker.us-east-1.amazonaws.com/endpoints/gpt-2/invocations
```

We provide examples on how to query this endpoint on the [API page](/models/gpt-2/api).

- Also see the documentation [InvokeEndpoint documentation in AWS](https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_runtime_InvokeEndpoint.html)
- The key part being how to handlee the
[AWS Signature Version 4](https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html),
for example [using Python](https://docs.aws.amazon.com/general/latest/gr/sigv4-signed-request-examples.html)

### Insonmia

To test the endpoint you can use the [Insonmia HTTP client](https://insomnia.rest)
that supports AWS Authentication.

Create a new `POST` request and select the Auth method `AWS IAM v4`,
fill the credentials, region and use `sagemaker` as the service.

![Insonmia Auth](/assets/img/models/insonmia-aws-auth.png)

Select `JSON` as the body type and use the following test query:

```
{
    "input": "This is an input text"
}
```

With a response like this:

```
[
  "This is an input text box that will be used to input the password. The user may select a user name and password to save for later.\n\nPassword fields allow users to save themselves as a user on our server, which may be useful for",
  "This is an input text for the next button.\n\nYou can also press the backspace key twice to erase the text to the right.\n\nPressing the backspace key again to clear the previously typed text will delete the previous line.",
  "This is an input text for the widget, and it must be in the correct format. The format must be one of the following:\n\n\nText to enter on the form\n\nExample: What is the total distance in miles to your next destination"
]
```
