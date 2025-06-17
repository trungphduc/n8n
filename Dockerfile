FROM n8nio/n8n

# 👉 Switch to root
USER root

# Cài nginx và supervisor
RUN apk add --no-cache nginx supervisor

# Copy file xác thực và config
COPY ./static /usr/share/nginx/html
COPY ./supervisord.conf /etc/supervisord.conf
RUN mkdir -p /run/nginx

# 👉 Chuyển lại user node
USER node

# 👉 Chạy supervisor (nginx + n8n song song)
CMD ["supervisord", "-c", "/etc/supervisord.conf"]