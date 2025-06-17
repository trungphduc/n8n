FROM n8nio/n8n

# Cài nginx và supervisor
RUN apk add --no-cache nginx supervisor

# Copy file xác thực Zalo
COPY ./static /usr/share/nginx/html

# Copy cấu hình nginx và supervisor
COPY ./supervisord.conf /etc/supervisord.conf

# Tạo folder nginx
RUN mkdir -p /run/nginx

# CMD: chạy supervisor để quản lý nhiều process
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]