# Management

## SSH

You can SSH to the EC2 instance using the `ubuntu` user,
the public IP address of the instance and the keypair selected at launch time.

```
ssh -i ~/keypair.pem ubuntu@<ip-addres>
```
