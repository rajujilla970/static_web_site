FROM nginx:alpine
COPY ./static-web-app /usr/share/nginx/html
EXPOSE 80
