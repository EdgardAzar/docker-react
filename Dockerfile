FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80 
#EXPOSE instruction is used for port mapping,elastic beanstalk will look for expose and whatever port is listed it will be listed automatically
COPY --from=builder /app/build /usr/share/nginx/html