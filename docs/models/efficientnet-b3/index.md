# EfficientNet-B3: Image Classifier

This model provides top-k category predictions out of the 1000 classes on [ImageNet](http://www.image-net.org) based on the [EfficientNet B3 algorithm](http://proceedings.mlr.press/v97/tan19a/tan19a.pdf).
This network provides state of the art accuracy on [ImageNet](http://www.image-net.org) and at the same time it provides a smaller model and faster inference than other models such as `ConvNets`.

Features:

- State of the art accuracy on the ImageNet validation dataset:
    - Top-1 Accuracy (err): `82.242 (17.758)`
    - Top-5 Accuracy (err): `96.114 (3.886)`
- Provides smaller and faster inference than `ConvNets`
- Flexible endpoint to classify one or multiple images with configurable parameters
- Only pay for what you use with a simple metered pricing model
- Same price independent of the resources (`memory/cpu/gpu`) used

Learn how to [launch this algorithm in AWS SageMaker](/models/efficientnet-b3/getting-started)
and see [examples](/models/efficientnet-b3/examples) from the actual API.

## Pricing

This model has a fee of `0.15` dollars per hour.
You will incur costs for software use **only** for as long as the endpoint is running.

AWS infrastructure costs are independent and in addition to the costs of the software
and it depends on the instance type seleced to host the algorithm.
