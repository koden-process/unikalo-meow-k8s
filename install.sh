#!/bin/sh

read -p "Entrez le nom du repo (REPO) ex : user/repo : " REPO
read -p "Entrez le nom de l'application (APP_NAME) : " APP_NAME
read -p "Entrez le nom du projet ArgoCD (PROJECT_NAME) : " PROJECT_NAME
read -p "Entrez le nom du secret Kubernetes (SECRET_NAME) : " SECRET_NAME
read -p "Entrez le namespace Kubernetes (NAMESPACE) : " NAMESPACE
read -p "Entrez l'URL' (URL) : " URL

sed -i '' "s/REPO/$REPO/g" app.yaml
sed -i '' "s/APP_NAME/$APP_NAME/g" app.yaml
sed -i '' "s/PROJECT_NAME/$PROJECT_NAME/g" app.yaml
sed -i '' "s/NAMESPACE/$NAMESPACE/g" app.yaml


sed -i '' "s/APP_NAME/$APP_NAME/g" charts/values.yaml
sed -i '' "s/PROJECT_NAME/$PROJECT_NAME/g" charts/values.yaml
sed -i '' "s/NAMESPACE/$NAMESPACE/g" charts/values.yaml
sed -i '' "s/SECRET_NAME/$SECRET_NAME/g" charts/values.yaml

kubectl apply -f app.yaml -n argocd

echo "Déploiement terminé avec succès."

git add .
git commit -m "Update app.yaml"
git push

echo "Les fichiers ont été mis à jour sur Github."