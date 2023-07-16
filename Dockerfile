
FROM node:18-slim AS build
WORKDIR /app
COPY package*.json ./
COPY . .
RUN npm install
RUN npm run build --prod

FROM nginx:1.21.1-alpine

COPY --from=build /app/dist/deploytest /usr/share/nginx/html

