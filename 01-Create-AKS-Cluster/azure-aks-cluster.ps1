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