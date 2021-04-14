# Object Detection Mask R-CNN model

The [Object Detection Mask R-CNN model](https://aws.amazon.com/marketplace/pp/prodview-dxs3ysuie4q5m)
provides state of the art object detection on images with fast inference times.

[Launch on SageMaker](https://aws.amazon.com/marketplace/pp/prodview-dxs3ysuie4q5m).

Features:

- State of the art accuracy on the COCO 2017 dataset
    - Box AP: `43.0`
- Based on the [Mask R-CNN paper](https://arxiv.org/abs/1703.06870v3)
- Network Architecture: ResNet + FPN (Feature Pyramid Network): [ResNeXt](https://github.com/facebookresearch/ResNeXt) - 101
- Flexible endpoint to make inferences on images: Returns a segmented image in different formats or the metadata as JSON
- Only pay for what you use with a simple metered pricing model
- Same price independent of the resources (`memory/cpu/gpu`) used

## Pricing

This model has a fee of `0.15` dollars per hour for real time inference and `1` dollar per hour for batch jobs.

You will incur costs for software use **only** for as long as the Endpoint is running.

AWS infrastructure costs are independent and in addition to the costs of the software
and it depends on the instance type selected to host the algorithm.
