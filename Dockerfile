# 베이스: 공식 NGINX 웹 서버(alpine 리눅스 기반이라 작음)
FROM nginx:alpine

# 커스텀 1: 이미지 이름표(메타데이터)
LABEL org.opencontainers.image.title="my-workstation-web"

# 커스텀 2: 환경 변수
ENV APP_ENV=dev

# 커스텀 3: 기본 환영 페이지를 내 페이지로 교체
COPY app/ /usr/share/nginx/html/

# 커스텀 4: 30초마다 웹 서버가 응답하는지 자가 점검
HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget -q -O /dev/null http://localhost/ || exit 1

EXPOSE 80