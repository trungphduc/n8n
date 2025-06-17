FROM n8nio/n8n

# 👉 Chuyển sang root để cài nginx + bash
USER root

# Cài nginx và bash
RUN apk add --no-cache nginx bash

# Tạo thư mục cho nginx
RUN mkdir -p /run/nginx /usr/share/nginx/html

# Copy file xác thực Zalo OA
COPY ./static /usr/share/nginx/html

# Copy config nginx
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Copy start.sh và cấp quyền thực thi
COPY ./start.sh /start.sh
RUN chmod +x /start.sh

# 👉 Chuyển lại về user node
USER node

# 🔥 Dùng bash thay vì sh
CMD ["bash", "/start.sh"]
