# temp container
FROM node:alpine as builder
WORKDIR '/app'

COPY package*.json ./
#COPY package.json .

RUN npm install
COPY . .
CMD npm run build

# https://hub.docker.com/_/nginx/
# nginx starts automatically
FROM nginx 

# Elastic beanstalk will map to this port automatically
EXPOSE 80
# reference builder step
COPY --from=builder /app/build /usr/share/nginx/html
