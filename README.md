# meow-k8s

## values.yaml

Le fichier `values.yaml` contient les configurations par défaut pour les charts Helm. Vous pouvez personnaliser ces valeurs selon vos besoins.

```yaml
app:
  name: unikalo-meow
  image: killiankopp/meow:1.0
  replicas: 1
  port: 3000
  url: meow.unikalo.koden.bzh
  namespace: koden-clients
  secret: unikalo-mongodb-secret
```

Avant de déployer ce chart, vous devez créer le secret MongoDB dans le namespace. (cf déploiement MongoDB https://github.com/koden-process/unikalo-mongodb-k8s).

## ArgoCD
Pour déployer ces charts en utilisant ArgoCD :

```sh
kubectl apply -f app.yaml -n argocd
```

## Helm
Vous pouvez également déployer ce chart Helm de manière classique.

## Docker
Les versions Docker sont disponibles sur le repo https://hub.docker.com/r/killiankopp/meow/tags.
