# login azure (primeira execução)
az login

# criar chaves de acesso ao Azure para o terraform (primeira execução)
az ad sp create-for-rbac --skip-assignment

#Setar os calores das variaveis appId, password geradas no comando anterior quando solicitado
# project_name = kubernetes-mba-se quando solicitado

cd terraform

# iniciar terraform (primeira execução)
terraform init

# planejar alterações
terraform plan

# alterar ambiente
terraform apply --auto-approve

cd ..

# obter credenciais do AKS
az aks get-credentials --resource-group rg-kubernetes-mba-se --name kubernetes-mba-se --overwrite-existing

# subir configuração da aplicação
kubectl apply -f aks/config

# subir configuração da aplicação
kubectl apply -f aks/pods

# subir configuração da aplicação
kubectl apply -f aks/service