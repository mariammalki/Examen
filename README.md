# Examen Pratique DevOps – CV One Page

Ce dépôt contient tous les éléments nécessaires pour l'examen pratique DevOps visant à automatiser le déploiement d'une application **CV One Page** avec un pipeline CI/CD complet et la supervision via Grafana Cloud.

---

## Table des matières

1. [Préparation de l'environnement](#préparation-de-lenvironnement)  
2. [Automatisation avec Ansible](#automatisation-avec-ansible)  
3. [Pipeline CI/CD avec Jenkins](#pipeline-cicd-avec-jenkins)  
4. [Déploiement Docker avec Terraform](#déploiement-docker-avec-terraform)  
5. [Orchestration Kubernetes avec K3s et Argo CD](#orchestration-kubernetes-avec-k3s-et-argo-cd)  
6. [Supervision et Monitoring avec Grafana Cloud](#supervision-et-monitoring-avec-grafana-cloud)  
7. [Structure du dépôt](#structure-du-dépôt)  

---

## Préparation de l'environnement

- VM Ubuntu Server 24.04 nommée `DEVOPS-LAB`.  
- Accès par clés SSH depuis la machine locale (clé publique copiée dans `~/.ssh/authorized_keys`).  
![Configurer l’accès par clés SSH à DEVOPS-LAB](captures-Exam/accès-par-clés-SSH.png)

- Commande de test SSH :
ssh mariem@192.168.1.28
## Automatisation avec Ansible

Les rôles Ansible présents dans ansible/ automatisent :

Mise à jour du système (apt update && apt upgrade).

Installation de Docker.

Installation de Terraform.

Installation de Jenkins.

Exemple de commande pour exécuter le playbook :

ansible-playbook -i inventory.yml playbook.yml --ask-become-pass

## Pipeline CI/CD avec Jenkins

Récupération du code GitHub : https://github.com/mariammalki/cv-one-page.

Scrutation automatique toutes les 5 minutes.

Construction de l'image Docker basée sur Nginx.

Push sur Docker Hub (compte : mariem507).

Notification Slack après exécution.


## Déploiement Docker avec Terraform

Terraform déploie un conteneur Docker nommé moncv

1. Ecrire le code (main.tf).
2. Initialiser (terraform init).
3. Planifier (terraform plan).
4. Appliquer (terraform apply).
5. Tester : http://<IP_VM>:8585 .


Test d’accès depuis la machine locale : http://192.168.1.28:8585.

## Orchestration Kubernetes avec K3s et Argo CD

Installation K3s Single Node :

curl -sfL https://get.k3s.io | sh -
sudo k3s kubectl get nodes

Déploiement via Argo CD :

Path du repo : /k8s

Namespace : default

Sync Policy : Automatic

Test d’accès : http://192.168.1.28:30085.

## Supervision et Monitoring avec Grafana Cloud

Création d’un compte Grafana Cloud (plan Free).

Installation de Grafana Alloy / Grafana Agent sur la VM :

ARCH="amd64" GCLOUD_HOSTED_METRICS_URL="https://prometheus-prod-58-prod-eu-central-0.grafana.net/api/prom/push" GCLOUD_RW_API_KEY="<API_TOKEN>" /bin/sh -c "$(curl -fsSL https://storage.googleapis.com/cloud-onboarding/alloy/scripts/install-linux.sh)"


Configuration du fichier agent.yaml pour VM, Docker et K3s 

Vérification :

sudo systemctl status alloy.service




























1. Ecrire le code (main.tf).
2. Initialiser (terraform init).
3. Planifier (terraform plan).
4. Appliquer (terraform apply).
5. Tester : http://<IP_VM>:8585 .
