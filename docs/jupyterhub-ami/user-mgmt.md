# User management

The JupyterHub AMI user management is powered by [KeyCloak](https://www.keycloak.org).
This allows for centralized user management that can be connected to other
authentication backends such as LDAP.

You can access the KeyCloak management UI at the `/auth` path prefix:

```plain title="URL"
http://<ip-address>/auth
```

- Click on `Administration Console`
- Login into the admin UI:
    - username: `admin`
    - default password is the EC2 instance ID, for example: `i-0b3445939c749244c`

On the top right corner select the `Jupyterhub` realm.

!!! note "Jupyterhub realm"
    For a user to be able to login into JupyterHub it must belong to the `jupyterhub` realm.

    The default `jupyterhub-admin` user is located there.


![JupyterHub KeyCloak](/assets/img/jupyterhub-ami/keycloak-realm.png)

## Add an user

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
select a new one.

![JupyterHub KeyCloak](/assets/img/jupyterhub-ami/keycloak-update-pass.png)

And after that, the new user will be sent to its Jupyter session.

## Other user actions

On the KeyCloak admin UI you can disable and delete users, connect to external
authentication systems such as AD/LDAP and more.

To take advantage of other functionality of KeyCloak
please take a look at their [official documentation](https://www.keycloak.org/documentation).

## JupyterHub Admin

Admin users are able to control users from the JupyterHub Admin Panel.

![JupyterHub Admin](/assets/img/jupyterhub-ami/jupyterhub-admin.png)

The default the `jupyterhub-admin` is also an admin.

