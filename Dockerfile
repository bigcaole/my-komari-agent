# 使用基础镜像
FROM alpine:latest

# 安装必要工具：curl(下载), bash(运行), ca-certificates(证书), python3(防休眠服务)
RUN apk add --no-cache curl bash ca-certificates python3

# 设置工作目录
WORKDIR /opt/komari

# 下载探针并赋予权限
RUN curl -L https://github.com/komari-monitor/komari-agent/releases/latest/download/komari-agent-linux-amd64 -o agent && \
    chmod +x agent

# 暴露 8080 端口（虽然探针不用，但用于骗过系统保活）
EXPOSE 8080

# 启动脚本：同时启动 Python Web 服务器和 Komari 探针
CMD python3 -m http.server 8080 & ./agent -e https://komari.04260321.xyz -t QjZcai3mzxbxHPjZNIdHap --disable-web-ssh --ignore-unsafe-cert --month-rotate 1
