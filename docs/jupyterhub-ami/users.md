# User management

The JupyterHub AMI user management is powered by [KeyCloak](https://www.keycloak.org).
This allows for centralized user management that can be connected to other
authentication backends such as LDAP.

You can access the KeyCloak management UI at: `http://<ip-address>/auth`.
Then Click on `Administration Console` and login using the `admin` username,
the password will be the EC2 instance ID, for example `i-0b3445939c749244c`.

You will land at the `jupyterhub` realm admin console

![JupyterHub KeyCloak](/assets/img/jupyterhub-ami/keycloak-realm.png)

Users that can login into the JupyterHub installation must belong to the `jupyterhub`
realm. For example the default `jupyterhub-admin` user is located there.

## Add a user

To add a new user:

1. User click on the `Users` button on the left navigation under
the `Manage` section.
1. Click on the `Add user` button on the right side of the table.
1. On the form type the username of the new user
1. Click on `Save`

![JupyterHub KeyCloak](/assets/img/jupyterhub-ami/keycloak-add-user.png)

You will be redirected to the new user page.
To add a password click on the `Credentials` page and set a temp password.

![JupyterHub KeyCloak](/assets/img/jupyterhub-ami/keycloak-user-page.png)

![JupyterHub KeyCloak](/assets/img/jupyterhub-ami/keycloak-user-temp-pass.png)

Now when the new user logs in with the temp password it will be prompted to
select a new onw.

![JupyterHub KeyCloak](/assets/img/jupyterhub-ami/keycloak-update-pass.png)

And after that it will launch it's Jupyter session.

## Other user actions

On the KeyCloak admin UI you can disable and delete users, connect to external
authentication systems such as AD/LDAP and more.

To take advantage of other funcionality of KeyCloak
please take a look at their [official documentation](https://www.keycloak.org/documentation).

