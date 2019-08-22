
FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npx ng build demo

FROM nginx
EXPOSE 80
COPY --from=builder /app/dist/demo /usr/share/nginx/html