# temp container
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
CMD npm run build

# https://hub.docker.com/_/nginx/
# nginx starts automatically
FROM nginx 
# reference builder step
COPY --from=builder /app/build /usr/share/nginx/html
