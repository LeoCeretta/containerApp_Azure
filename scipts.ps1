docker build -t blog-leo-app:latest .

docker run -d -p 80:80 blog-leo-app:latest

az login

#Create a resource group
az group create --name containerappslab03 --location eastus

#Create a container registry
az acr create --resource-group containerappslab03 --name blogleoregistry --sku Basic

#Login to the container registry
az acr login --name blogleoregistry

#Tag the image
docker tag blog-leo-app:latest blogleoregistry.azurecr.io/blog-leo-app:latest

#Push the image to the container registry
docker push blogleoregistry.azurecr.io/blog-leo-app:latest

##containerID = blogleoregistry.azurecr.io/blog-leo-app:latest
##Username = blogleoregistry
##Password = localizada no Azure portal, na seção "Access keys" do container registry

#Create a container app environment
az containerapp env create --name blogleo-env --resource-group containerappslab03 --location eastus

#Create a container app
az containerapp create --name blogleo-app --resource-group containerappslab03 --environment blogleo-env --image blogleoregistry.azurecr.io/blog-leo-app:latest --target-port 80 --ingress external --registry-username blogleoregistry --registry-server blogleoregistry.azurecr.io --registry-password ...