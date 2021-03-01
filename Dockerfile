# stage 1
FROM node:latest as node 
WORKDIR /app
COPY . .
RUN npm install 
RUN npm run ng build --configuration=production


# stage 2
 FROM nginx:alpine
 COPY --from=node /app/dist/angular-frontend /usr/share/nginx/html 
# Copy the default nginx.conf provided 
 #COPY --from=node /nginx.conf /etc/nginx/conf.d/default.conf
 EXPOSE 80
