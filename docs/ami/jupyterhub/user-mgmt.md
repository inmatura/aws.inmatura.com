# User management

The JupyterHub AMI user management is powered by [KeyCloak](https://www.keycloak.org).
This allows for centralized user management that can be connected to other
authentication backends such as LDAP.

To access the KeyCloak management UI first go the `/auth` path prefix:

```plain title="URL"
http://<ip-address>/auth
```

Then click on `Administration Console` and login into the admin UI:

- username: `admin`
- default password is the EC2 instance ID, for example: `i-0b3445939c749244c`

On the top right corner select the `Jupyterhub` realm.

## Adding a user

For a user to be able to login into JupyterHub it must belong to the `jupyterhub` realm.

- The default `jupyterhub-admin` user is located there.
- You can change `realms` on the top left corner of the admin UI.

![JupyterHub KeyCloak](/assets/images/ami/jupyterhub/keycloak-select-realm.jpg)

To add a new user:

1. User click on the `Users` button on the left navigation under the `Manage` section.
2. Click on the `Add user` button on the right side of the table.
3. On the form type the username of the new user
4. Set a required action of `Update Password`
5. Click on `Create`

![JupyterHub KeyCloak](/assets/images/ami/jupyterhub/keycloak-add-user.jpg)

You will be redirected to the new user page.
Add a temporal password click on the `Credentials` tab and set a temp password.

![JupyterHub KeyCloak](/assets/images/ami/jupyterhub/keycloak-user-set-pass.jpg)


Now when the new user logs in with the temp password it will be prompted to
create a new one.

![JupyterHub KeyCloak](/assets/images/ami/jupyterhub/keycloak-update-pass.jpg)

And after that, the new user will be automatically sent to it's Jupyter session.

## Other user actions

On the KeyCloak admin UI you can disable and delete users, connect to external
authentication systems such as AD/LDAP and more.

To take advantage of other functionality of KeyCloak
please take a look at their [official documentation](https://www.keycloak.org/documentation).

## JupyterHub Users

Admin users are able to control users from the JupyterHub Admin Panel.

![JupyterHub Admin](/assets/images/ami/jupyterhub/jupyterhub-admin.jpg)

The default the `jupyterhub-admin` is an admin on JupyterHub.
