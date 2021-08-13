# setup guide

Generate SSH Key

```
ssh-keygen -t ed25519
```

Create secrets

```
k create secret generic git-sync-ssh-key --from-file=./id_ed25519
```

Deploy containers

```
k apply -f deployment.yml
```