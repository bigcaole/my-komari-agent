# 使用基础镜像
FROM alpine:latest

# 安装必要工具
RUN apk add --no-cache curl bash ca-certificates

# 设置工作目录
WORKDIR /opt/komari

# 1. 下载探针二进制文件 (针对 amd64 架构)
# 2. 赋予执行权限
RUN curl -L https://github.com/komari-monitor/komari-agent/releases/latest/download/komari-agent-linux-amd64 -o agent && \
    chmod +x agent

# 直接启动二进制文件，跳过安装脚本的服务检测环节
# 使用 CMD 形式确保进程是容器的主进程
CMD ["./agent", "-e", "https://komari.04260321.xyz", "-t", "QjZcai3mzxbxHPjZNIdHap", "--disable-web-ssh", "--ignore-unsafe-cert", "--month-rotate", "1"]
