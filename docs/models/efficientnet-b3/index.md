# EfficientNet-B3 Image Classifier

Classify images using the [EfficientNet B3 model](http://proceedings.mlr.press/v97/tan19a/tan19a.pdf).
Generated labels are from [ImageNet](http://www.image-net.org).

Features:

- State of the art accuracy on the ImageNet validation dataset:
    - Top-1 Accuracy (err): `82.242 (17.758)`
    - Top-5 Accuracy (err): `96.114 (3.886)`
- Provides smaller and faster inference than `ConvNets`
- Flexible endpoint to classify one or multiple images with configurable parameters
- Only pay for what you use with a simple metered pricing model
- Same price independent of the resources used `memory/cpu/gpu`

See how to [launch this algorithm in AWS SageMaker](/models/efficientnet-b3/getting-started)
and [examples](/models/efficientnet-b3/examples).

## Pricing

This model has a fee of `0.15` dollars per hour.
You will incur costs for software use **only** for as long as your endpoint is running.

AWS infrastructure costs are independent and in addition to the costs of software
and it depends on the instance type seleced to run the algorithm.
