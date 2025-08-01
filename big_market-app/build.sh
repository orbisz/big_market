# 普通镜像构建，随系统版本构建 amd/arm
docker build --no-cache -t orbiszx/big-market-app:3.2 -f ./Dockerfile .

# 兼容 amd、arm 构建镜像
# docker buildx build --load --platform liunx/amd64,linux/arm64 -t orbisz/xfg-frame-archetype-app:1.0 -f ./Dockerfile . --push