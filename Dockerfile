FROM node:18-alpine

# Cài bash, nginx, các công cụ cần
RUN apk add --no-cache bash nginx

# Cài n8n global
RUN npm install -g n8n

# Tạo thư mục cần thiết
RUN mkdir -p /usr/share/nginx/html /run/nginx

# Copy file HTML xác thực
COPY ./static /usr/share/nginx/html

# Copy config nginx
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Copy script start.sh
COPY ./start.sh /start.sh
RUN chmod +x /start.sh

# Expose cả 2 cổng: n8n (5678), nginx (8081)
EXPOSE 5678 8081

# CMD chạy cả nginx và n8n song song
CMD ["sh", "/start.sh"]
