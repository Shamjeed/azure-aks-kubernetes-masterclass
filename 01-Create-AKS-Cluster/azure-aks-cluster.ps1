#Azure Help Reource
https://learn.microsoft.com/en-us/azure/aks/learn/quick-kubernetes-deploy-cli 

$ResourseGroupName="aks-rg1"
$KubernetesClusterName= "aksdemo1"
$Location="eastus"
$MySqlServerName="aksmswebappdb"
$AdministratorUserName="dbadmin"
$password="RedHat3018"
$secureString = ConvertTo-SecureString $password -AsPlainText -Force
$Sku="B_Gen5_1"
$StorageInMb=5120

az login

# Create resourse group
az group create --name $ResourseGroupName --location $Location

# Create AKS cluster
az aks create -g $ResourseGroupName -n $KubernetesClusterName --enable-managed-identity --node-count 1 --enable-addons monitoring --enable-msi-auth-for-monitoring  --generate-ssh-keys

# Configure kubectl to connect to your Kubernetes cluster using the az aks get-credentials command.
az aks get-credentials --resource-group $ResourseGroupName --name $KubernetesClusterName

# List Kubernetes Worker Nodes
kubectl get nodes 
kubectl get nodes -o wide

# List Namespaces
kubectl get namespaces

# List Pods from all namespaces
kubectl get pods --all-namespaces

# For more commands Please check C:\Users\shamj\IdeaProjects\azure-aks-kubernetes-masterclass\01-Create-AKS-Cluster\README.md

kubectl apply -f kube-manifests/

# Verify Pods
kubectl get pods

# Verify Deployment
kubectl get deployment

# Verify Service (Make a note of external ip)
kubectl get service

# Access Application
http://<External-IP-from-get-service-output>

http://20.62.187.66

# Delete Applications
kubectl delete -f kube-manifests/

# Delete cluster
$ResourseGroupName="aks-rg1"
az group delete --name $ResourseGroupName --yes --no-wait