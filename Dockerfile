FROM n8nio/n8n

# 👉 Switch to root để cài nginx
USER root

# Cài nginx
RUN apk add --no-cache nginx

# Tạo thư mục chạy nginx và copy file xác thực
RUN mkdir -p /run/nginx /usr/share/nginx/html

# Copy file HTML xác thực vào nginx
COPY ./static /usr/share/nginx/html

# Copy file cấu hình nginx
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Copy script để khởi động song song nginx + n8n
COPY ./start.sh /start.sh
RUN chmod +x /start.sh

# 👉 Chuyển lại về user node
USER node

# ✅ FIX: Dùng "sh" thay vì "/bin/sh"
CMD ["sh", "/start.sh"]
