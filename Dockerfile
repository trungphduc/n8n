FROM n8nio/n8n

# 👉 Switch to root to install packages
USER root

# Cài nginx và supervisor
RUN apk add --no-cache nginx supervisor

# Tạo thư mục chứa file xác thực
COPY ./static /usr/share/nginx/html

# Copy config nginx và supervisor
COPY ./supervisord.conf /etc/supervisord.conf
RUN mkdir -p /run/nginx

# 👉 Chuyển lại user node (n8n chạy với user này)
USER node

# Start supervisor to run nginx + n8n song song
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]