#!/bin/sh

# 👉 Chạy nginx ở chế độ nền
echo "Starting nginx..."
nginx

# 👉 Chạy n8n (giữ container không thoát)
echo "Starting n8n..."
n8n