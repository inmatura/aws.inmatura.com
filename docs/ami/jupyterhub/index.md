# JupyterHub AMI

![Jupyter Lab](/assets/images/ami/jupyterhub/jupyter-lab.jpg)

[Launch this offering in AWS](https://aws.amazon.com/marketplace/pp/Daniel-Rodriguez-JupyterHub-multi-user-single-node/B07YSYZ2P6).

The JupyterHub AMI provides a multi-user [JupyterHub](https://jupyterhub.readthedocs.io/en/stable/)
installation with a batteries included approach and simple user management
that can be launched on any EC2 instance type including GPUs.

Latest version: `2.4`.

Features:

- Immediately start using your JupyterHub installation, no SSH required to launch any services
- Multiple IDEs including JupyterLab, Jupyter Classic Notebook, RStudio IDE, and VS Code
- Multiple Python and R versions installed and configured
- A set of most popular Open Source packages installed and configured
- Easily installation of more packages, you have control
- Basic set of extensions installed without cluttering the server so you can configure the installation as needed
- Manage access of multiple users using an industry-standard system based on [KeyCloak](https://www.keycloak.org)
- Easily connect to external LDAP or Kerberos to federate users from KeyCloak
- Easily configure a custon DNS for SSL termination
- GPU and multiple version of CUDA installed for the best usage of PyTorch and TensorFlow
- No per RAM or CPU pricing. Just a small fee for the AMI and use any EC2 instance type including GPUs
- Based on Ubuntu 22.04
- Free trial

## Pricing

This model has a fee of `0.15` dollars per hour.
You will incur costs for software use **only** for as long as your EC2 instance is running.

Infrastructure costs are independent and in addition to the costs of software
and it depends on the instance type selected.
