# 使用轻量级的 Alpine Linux 作为基础镜像
FROM alpine:latest

# 安装必要的依赖：curl, bash, ca-certificates
RUN apk add --no-cache curl bash ca-certificates

# 设置工作目录
WORKDIR /app

# 写入启动脚本
RUN echo '#!/bin/bash' > start.sh && \
    echo 'bash <(curl -sL https://raw.githubusercontent.com/komari-monitor/komari-agent/refs/heads/main/install.sh) -e https://komari.04260321.xyz -t QjZcai3mzxbxHPjZNIdHap --disable-web-ssh --ignore-unsafe-cert --month-rotate 1' >> start.sh && \
    chmod +x start.sh

# 运行探针脚本
CMD ["/bin/bash", "./start.sh"]
