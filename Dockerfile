FROM gliderlabs/alpine:edge
LABEL maintainer="prenom.nom@univ-rouen.fr"
RUN echo http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN addgroup -g 1000 -S www-data \
 && adduser -u 1000 -D -S -G www-data www-data
RUN apk upgrade --update-cache --available
RUN apk add --update && apk add --no-cache -f bash nginx ca-certificates supervisCOPY ./conf/supervisord.conf /etc/supervisord.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY src/ /var/www/html/
RUN mkdir -p /run/nginx && mkdir /tmp/nginx
RUN chown -R www-data:www-data /var/lib/nginx && chown -R www-data:wwwRUN sed -i s/'user = nobody'/'user = www-data'/g /etc/php7/php-fpm.d/www.conf
RUN sed -i s/'group = nobody'/'group = www-data'/g /etc/php7/php-fpm.d/www.conf
EXPOSE 80
CMD ["/usr/bin/supervisord", "-n" , "-c", "/etc/supervisord.conf"]
# 
# FROM python:3.7-alpine
# WORKDIR /code
# ENV FLASK_APP=app.py
# ENV FLASK_RUN_HOST=0.0.0.0
# RUN apk add --no-cache gcc musl-dev linux-headers
# COPY requirements.txt requirements.txt
# RUN pip install -r requirements.txt
# EXPOSE 5000
# COPY . .
# CMD ["flask", "run"]


#FROM node:14-alpine AS builder

# FROM node:14-alpine

# COPY package*.json ./

# RUN npm install

# COPY . .

# EXPOSE 3000

# ENTRYPOINT ["node","index.js"]


#CMD ["node","index.js"]

#ARG environment

#RUN npm install && \
#    ./node_modules/@angular/cli/bin/ng build --configuration=$environment --output-path=dist

# nginx state for serving content
#FROM nginx:alpine

# Copy static assets from builder stage
#COPY --from=builder /app/dist/  /usr/share/nginx/html/

#COPY nginx.conf /etc/nginx/nginx.conf 

# Containers run nginx with global directives and daemon off
#ENTRYPOINT ["nginx", "-g", "daemon off;"]
