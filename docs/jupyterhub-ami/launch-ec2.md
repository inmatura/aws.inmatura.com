# Launching the JupyterHUb AMI in EC2

1. Log in to AWS with a user with administrative privileges
1. Navigate to the
[JupyterHub AMI](https://aws.amazon.com/marketplace/pp/Daniel-Rodriguez-JupyterHub-multi-user-single-node/B07YSYZ2P6)
listing on the AWS Marketplace
1. Click `Continue to Subscribe`
1. Click on `Accept the Terms` (it might take 1 or 2 minutes for AWS to accept the offer).

    Note that there is no charge for subscribing to this offering only when launching an EC2 instance.

1. Once you are subscribed click `Continue to Configuration`
1. On the `Configure this software` page, select the AWS region where the EC2 instance will reside and click `Continue to Launch`
1. On the `Launch this software` page, you can configure the `Instance type`, `VPC`, `subnet`, `Security Group`, and `keypair`

    You can also select `Launch through EC2` under `Choose Action`, to use the regular EC2 flow

1. Finally click on `Launch`

Now go to the [EC2 Dashboard](https://console.aws.amazon.com/ec2) and locate the recently launched EC2 instance.

Copy the public IP address and open it in a browser and you should now see the JupyterHub UI.

!!! note
    Note that the UI might take a couple of minutes to start the first time
    while it's configuring the services and creating the first user.
    Also, be sure to use `HTTP` and not `HTTPS`.

![JupyterHub login](/assets/img/jupyterhub-ami/jupyterhub-login.png)

## Accessing JupyterHub

After clicking `Sign in with KeyCloak` you will be sent to KeyCloak where you
can log in to JupyterHub using the default user:

- Username: `jupyterhub-admin`
- Password: Instance ID of the EC2 instance, for example `i-0b3445939c749244c`

![KeyCloak login](/assets/img/jupyterhub-ami/keycloak-login.png)

You will now be redirected to JupyterHub and your Jupyter session will start,
you will now see the Jupyter Lab UI.

![Jupyter Lab](/assets/img/jupyterhub-ami/jupyter-lab.png)
