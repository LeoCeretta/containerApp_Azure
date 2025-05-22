FROM nginx:latest

# Copie arquivos de configuração personalizados, se necessário
# COPY ./nginx.conf /etc/nginx/nginx.conf

COPY Blog/html /usr/share/nginx/html

EXPOSE 80
