# 📝 Blog Containerizado no Azure

Este repositório contém os arquivos e instruções para a implantação de uma aplicação de **Blog** utilizando containers, hospedada no serviço **Azure Container Apps**. O processo envolve a utilização do **Azure CLI**, **Docker** e o **Azure Container Registry (ACR)** para build, push e deploy da aplicação.

---

## 🔧 Tecnologias Utilizadas

- [Azure CLI](https://learn.microsoft.com/pt-br/cli/azure/)
- [Docker](https://www.docker.com/)
- [Azure Container Registry](https://azure.microsoft.com/pt-br/products/container-registry/)
- [Azure Container Apps](https://learn.microsoft.com/pt-br/azure/container-apps/)
- [Visual Studio Code](https://code.visualstudio.com/)
- Portal Azure

---

## 📁 Estrutura do Projeto

```
📦 Blog
 ┣ 📂 html
 ┃ ┣ 📄 create-post.html
 ┃ ┣ 📄 index.html
 ┃ ┗ 📄 post-detail.html
 ┣ 📄 Dockerfile
 ┗ 📄 README.md
```

---

## 🚀 Passo a Passo de Implantação

### 1. Login na Azure via CLI

```bash
az login
```

### 2. Criação do Grupo de Recursos

```bash
az group create --name MeuGrupoBlog --location eastus
```

### 3. Criação do Azure Container Registry (ACR)

```bash
az acr create --resource-group MeuGrupoBlog --name MeuRegistroContainerBlog --sku Basic
```

### 4. Login no ACR

```bash
az acr login --name MeuRegistroContainerBlog
```

### 5. Build da imagem Docker local

```bash
docker build -t meu-blog-app .
```

### 6. Tag da imagem para o ACR

```bash
docker tag meu-blog-app MeuRegistroContainerBlog.azurecr.io/meu-blog-app:v1
```

### 7. Push da imagem para o ACR

```bash
docker push MeuRegistroContainerBlog.azurecr.io/meu-blog-app:v1
```

### 8. Criação da Azure Container App

```bash
az containerapp create \
  --name BlogAppContainer \
  --resource-group MeuGrupoBlog \
  --image MeuRegistroContainerBlog.azurecr.io/meu-blog-app:v1 \
  --registry-server MeuRegistroContainerBlog.azurecr.io \
  --environment MeuAmbienteContainer \
  --ingress external \
  --target-port 80 \ 
  --registry-username blogleoregistry \
  --registry-server blogleoregistry.azurecr.io \
  --registry-password Disponibilizado no portal Azure dentro do Container Registry no Acess Key
```

---

## 📷 Prints dos Recursos Criados

### Grupo de Recursos, Container Registry e Container App no Portal Azure

> [Print dos recursos](/assets/Captura%20de%20tela%202025-05-22%20094714.png)  
> [Print dos recursos2](/assets/Captura%20de%20tela%202025-05-22%20094820.png)
---

## 🌐 Print da Aplicação em Execução

> [Print da aplicação](/assets/Captura%20de%20tela%202025-05-22%20100002.png)  
> [Print da aplicação2](/assets/Captura%20de%20tela%202025-05-22%20100027.png)

---

## 📄 Dockerfile Utilizado

```dockerfile
# Exemplo de Dockerfile
FROM nginx:latest
COPY html /usr/share/nginx/html
EXPOSE 80
```

---

## ✅ Status

✅ Deploy concluído com sucesso  
✅ Aplicação rodando em ambiente Azure  
✅ Imagem armazenada no Azure Container Registry  

---

## 🧠 Aprendizados

- Como usar o Azure CLI para criar e gerenciar recursos
- Como configurar e enviar imagens Docker para o ACR
- Como criar e expor uma aplicação no Azure Container Apps
- Conceitos de deploy moderno baseado em containers
