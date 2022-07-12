FROM jenkins 
USER root
RUN mkdir -p /tmp/download && \
    curl -L https://get.docker.com/builds/linux/x86_64/docker-1.13.1.tgz | tar -xz -C /tmp/download && \ 
    rm -rf /tmp/download/docker/dockerd && \
    mv /tmp/download/docker/docker* /usr/local/bin/ && \
    rm -rf /tmp/download && \
    groupadd -g 999 doctor && \
    usermod -aG docker jenkins
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
