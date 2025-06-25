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

Commencez par modifier le fichier `app.yaml` pour y inclure les valeurs spécifiques à votre déploiement.

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: unikalo-meow
  namespace: argocd
spec:
  project: koden-clients
  source:
    repoURL: "https://github.com/koden-process/unikalo-meow-k8s.git"
    targetRevision: main
    path: charts
  destination:
    server: https://kubernetes.default.svc
    namespace: koden-clients
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true

```

Pour déployer : 
```sh
kubectl apply -f app.yaml -n argocd
```

## Docker
Les versions Docker sont disponibles sur le repo https://hub.docker.com/r/killiankopp/meow/tags.
