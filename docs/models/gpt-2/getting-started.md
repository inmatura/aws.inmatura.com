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

        Here you can select the instance types you want for the endpoint. The minimun required is `ml.m5.2xlarge`

    1. Click on `Create endpoint configuration`
    1. Finally click on `Submit`

A new endpoint will be created (this can take a couple of minutes).

## Making a query

- https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_runtime_InvokeEndpoint.html
- https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html
- https://docs.aws.amazon.com/general/latest/gr/sigv4-signed-request-examples.html
