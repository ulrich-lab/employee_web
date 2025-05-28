FROM nginx:alpine
COPY web_code/ /usr/share/nginx/html
EXPOSE 80
