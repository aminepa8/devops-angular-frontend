# stage 1
FROM node:latest as node 
WORKDIR /app
COPY . .
RUN npm install 
RUN npm run ng build --prod


# stage 2
 FROM nginx:alpine
 COPY --from=node /app/dist/angular-frontend /usr/share/nginx/html
 EXPOSE 80
