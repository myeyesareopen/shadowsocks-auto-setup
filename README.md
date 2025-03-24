# Shadowsocks-libev 一键部署脚本

![Shell Script](https://img.shields.io/badge/Shell_Script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

一个全自动部署 Shadowsocks-libev 的 Bash 脚本，适用于快速搭建安全的 socks5 代理服务。

## 功能特性

- ✅ 全自动安装 shadowsocks-libev 核心组件
- 🔥 自动生成服务器连接二维码
- 🛡️ 集成 UFW 防火墙配置
- 📝 默认配置开箱即用
- 📊 实时服务状态验证

## 前提条件

- Debian/Ubuntu 系统
- Root 权限
- Bash 环境

## 快速开始

```bash
# 下载脚本
wget -O ss-server.sh https://raw.githubusercontent.com/yourname/repo/main/deploy-ss.sh

# 授予执行权限
chmod +x ss-server.sh

# 运行脚本
./ss-server.sh
