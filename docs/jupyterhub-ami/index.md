# JupyterHub AMI

[Launch this offering in AWS](https://aws.amazon.com/marketplace/pp/Daniel-Rodriguez-JupyterHub-multi-user-single-node/B07YSYZ2P6).

The JupyterHub AMI provides a multi-user [JupyterHub](https://jupyterhub.readthedocs.io/en/stable/) installation
with simple user management that can be launched on any AWS EC2 instance type.

Features:

- Immediately start using your JupyterHub installation, no SSH required to launch any services
- Multiple Python 3 and R versions installed and configured
- Multiple IDEs including: JupyterLab, Jupyter Classic Notebook and RStudio IDE
- A set of most popular Open Source packages installed, easily install others as needed
- Basic set of extensions installed without clutteting the server so you can configure the installation as needed
- Manage access of multiple users using an industry standard system based on [KeyCloak](https://www.keycloak.org)
- Easily connect to external LDAP or Kerberos to federate users from KeyCloak
- No per RAM or CPU pricing, just a fee for the AMI and use any EC2 instance type including GPUs
- Based on Ubuntu 20.04
- Free trial

## Pricing

This model has a fee of `0.15` dollars per hour.
You will incur costs for software use **only** for as long as your EC2 instancee is running.

Infrastructure costs are independent and in addition to the costs of software
and it depends on the instance type selectd.
