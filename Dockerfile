FROM n8nio/n8n

# 👉 Switch to root để cài nginx
USER root

RUN apk add --no-cache nginx

# Copy file xác thực
COPY ./static /usr/share/nginx/html

# Tạo thư mục nginx và config nginx để serve HTML
RUN mkdir -p /run/nginx && echo "server {
    listen 8081;
    location / {
        root /usr/share/nginx/html;
        index index.html;
    }
}" > /etc/nginx/conf.d/default.conf

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# 👉 Chuyển về user node
USER node

# Chạy script start song song nginx + n8n
CMD ["/bin/sh", "/start.sh"]
