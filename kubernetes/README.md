# setup guide

## Create

Generate SSH Key

```
ssh-keygen -t ed25519
```

Register public key to GitHub repository on which ssh keys stored as 'Deploy keys'

https://qiita.com/tamorieeeen/items/c24f8285448b607b12dd

Create secrets

```
k create secret generic git-sync-ssh-key --from-file=./id_ed25519
```

Create ConfigMap

```
kubectl create configmap builder-config --from-file=config-builder-assets/
```

Deploy containers

```
k apply -f deployment.yml -f service.yml
```

## Delete

```
kubectl delete configmap builder-config
```
