# Deploy an endpoint for a custom EfficientNet model

[Once a custom model has been trained](/model/efficientnet-b3/train)
it's possible to create a SageMaker Endpoint to make inferences on new data.

## 1. Create Model Package

Under `Training` > `Training Jobs` select the target training job,
click on `Actions` and then `Create Model Package`.

![Create model package](/assets/images/model/efficientnet-b3/create-model-package.png)

In the `Create model package` page:

1. Fill the `Model package name` e.g. `ants-and-bees`
1. Verify that in `Inference specification options`:
`Provide the algorithm used for training and its model artifacts` is selected
1. The `Algorithm and model artifacts` will be filled automatically including the
`Algorithm ARN` and `Location of model artifacts`
    - The `Location of model artifacts` will be the output of the `Training Job`
    e.g. `s3://my-bucket/ants-bees-output/output/model.tar.gz`
1. Click on `Next`
1. Under `Validate this resource` select `No`
1. Click `Create model package`

A new `Model Package` will be created.

## 2. Create Endpoint

Select the `Model package`, click on `Action` and then on `Create endpoint`.

![Create model package](/assets/images/model/efficientnet-b3/create-endpoint.png)


In the `Create model and endpoint`:

1. Under `Model settings`
    1. Select a `Model name` e.g. `ants-and-bees`
    1. Select an `IAM role` that has access to S3 (where the trained model was saved)
1. Under `Container definition`
    1. Verify `Use a model package subscription from AWS Marketplace` is selected
    1. Verify `Selected model package ARN` is pointing to the newly created `Model Package`
1. Click on `Next`
1. Select an `Endpoint name` e.g. `ants-and-bees`
1. Under `Attach endpoint configuration` select `Create a new endpoint configuration`
1. Under `New endpoint configuration` and `Production variants`
    - Click `Edit` in the `Actions` columns and select the instance type for the endpoint.
    The minimum recommended is `ml.c5.xlarge`
    1. Click on `Create endpoint configuration`
1. Click on `Submit`

A new endpoint will be created.

!!! note
    It might take a couple of minutes for the endpoint to be available.

## 3. Making a query

With the endpoint ready you will have an URL to make predictions, for example:

```
https://runtime.sagemaker.us-east-1.amazonaws.com/endpoints/ants-and-bees/invocations
```

--8<--
docs/model/snippets/info-how-to-query.md
--8<--

As a quick example let's use these two images:

=== "Ant"
    <img src="/assets/images/model/efficientnet-b3/ant1.jpg" width="300" />

=== "Bee"
    <img src="/assets/images/model/efficientnet-b3/bee1.jpg" width="300" />

Querying the endpoint:

=== "Python + boto: Ant"

    ```python
    import boto3

    client = boto3.client("sagemaker-runtime")
    endpoint_name = "ants-and-bees"

    with open("validation/ant1.jpg", "rb") as f:
        payload = bytearray(f.read())

    response = client.invoke_endpoint(
        EndpointName=endpoint_name,
        ContentType="image/jpeg",
        CustomAttributes='{"decode": true}',
        Body=payload,
    )

    print(response["Body"].json())
    ```

    ```
    ['ants', 'bees']
    ```

    We can see the first label is `ants`.

=== "Python + boto: Bee"

    ```python
    import boto3

    client = boto3.client("sagemaker-runtime")
    endpoint_name = "ants-and-bees"

    with open("validation/bee1.jpg", "rb") as f:
        payload = bytearray(f.read())

    response = client.invoke_endpoint(
        EndpointName=endpoint_name,
        ContentType="image/jpeg",
        CustomAttributes='{"decode": true}',
        Body=payload,
    )

    print(response["Body"].json())
    ```

    ```
    ['bees', 'ants']
    ```

    We can see the first predicted label is `bees`.

!!! info "Full API docs"
    For the complete documentation of the API including the different inputs and responses
    and more ways to query the Invocations endpoint see the [API page](/model/efficientnet-b3/api).

