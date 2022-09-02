FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# FROM statement terminates previous block and starts anew
FROM nginx

# Stephen Grider needed for Elastic beanstalk, port opening
#EXPOSE 80

# destination folder is from nginx documentation
# https://hub.docker.com/_/nginx
COPY --from=builder /app/build /usr/share/nginx/html