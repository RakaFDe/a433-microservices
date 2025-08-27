#jika image belum ada bisa pullpakai
#docker pull node:16-alpine / lalu cek docker run -it node:16-alpine sh

#build vue
FROM node:16-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# ngninx build
FROM nginx:alpine
# copy build ke nginx
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 8000
CMD ["nginx", "-g", "daemon off;"]
