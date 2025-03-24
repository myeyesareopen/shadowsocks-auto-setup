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
wget -O ss-server.sh https://raw.githubusercontent.com/myeyesareopen/shadowsocks-auto-setup/refs/heads/main/ss-server.sh

# 授予执行权限
chmod +x ss-server.sh

# 运行脚本
./ss-server.sh

```markdown

## 配置参数

| 变量 | 默认值 | 说明 |
|------|--------|------|
| `PORT` | 1080 | 监听端口 |
| `PASSWORD` | 6mXy8P9vJq3ZbLkG7RcNfDhW2sTg4Y5B | 连接密码 |
| `METHOD` | aes-256-gcm | 加密协议 |
| `CONFIG_FILE` | /etc/shadowsocks-libev/config.json | 配置文件路径 |

> 提示：运行前请修改脚本中的默认密码和端口

## 防火墙配置

脚本会自动：
1. 放行指定 TCP 端口
2. 启用 UFW 防火墙
3. 持久化防火墙规则

查看开放端口：
```bash
sudo ufw status
```

## 服务管理

```bash
# 启动服务
sudo systemctl start shadowsocks-libev-server@config

# 查看状态
sudo systemctl status shadowsocks-libev-server@config

# 重启服务
sudo systemctl restart shadowsocks-libev-server@config

# 停止服务
sudo systemctl stop shadowsocks-libev-server@config
```

## 连接信息

脚本执行完成后将显示：
- 🌍 公网服务器地址
- 🔑 加密协议和密码
- ⚡ 快速连接二维码
- 📲 SS 协议链接（Base64 编码）

## 注意事项

1. 默认配置应仅用于测试环境
2. 生产环境务必修改密码和端口
3. 确保服务商安全组放行相应端口
4. IPv4/IPv6 双栈环境可能需要额外配置
5. 客户端需支持 `aes-256-gcm` 加密方式

## 卸载说明

```bash
sudo apt remove shadowsocks-libev
sudo ufw delete allow ${PORT}/tcp
```
