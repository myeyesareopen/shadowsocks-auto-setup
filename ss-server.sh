#!/bin/bash

# Shadowsocks-libev 一键安装脚本
# 配置参数：
PORT=1080
PASSWORD="6mXy8P9a"
METHOD="aes-256-gcm"
CONFIG_FILE="/etc/shadowsocks-libev/config.json"

echo "正在更新软件源..."
sudo apt update -qq

echo "安装 shadowsocks-libev..."
sudo apt install -y shadowsocks-libev qrencode ufw

echo "创建配置文件..."
sudo mkdir -p /etc/shadowsocks-libev
sudo tee $CONFIG_FILE > /dev/null <<EOL
{
    "server": "0.0.0.0",
    "server_port": $PORT,
    "password": "$PASSWORD",
    "method": "$METHOD",
    "fast_open": true
}
EOL

echo "配置防火墙..."
sudo ufw allow $PORT/tcp
sudo ufw --force enable

echo "启用并启动服务..."
sudo systemctl stop shadowsocks-libev-server@config.service 2>/dev/null
sudo systemctl start shadowsocks-libev-server@config
sudo systemctl enable shadowsocks-libev-server@config

echo "验证服务状态..."
sleep 2
systemctl status shadowsocks-libev-server@config --no-pager

echo "生成连接二维码..."
CONFIG_STR=$(echo -n "$METHOD:$PASSWORD@$(curl -4s ifconfig.me):$PORT" | base64 -w 0)
echo "ss://$CONFIG_STR" | qrencode -t UTF8
echo -e "\n\033[32m部署成功！\033[0m"
echo -e "服务器信息：\n地址：\033[33m$(curl -4s ifconfig.me)\033[0m\n端口：\033[33m$PORT\033[0m\n密码：\033[33m$PASSWORD\033[0m\n加密：\033[33m$METHOD\033[0m"
echo -e "SS 链接：\033[4;34mss://$CONFIG_STR\033[0m"
