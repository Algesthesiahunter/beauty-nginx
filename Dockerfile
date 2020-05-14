# Main
FROM nginx:1.18.0-alpine
ARG gitCommit
ENV GIT_COMMIT ${gitCommit}

RUN  mkdir -p /ssl
COPY nginx.conf /etc/nginx/nginx.conf
COPY ssl/* /ssl/

CMD echo "ui gitCommit:${GIT_COMMIT}" \
  && nginx -t \
  && nginx -g 'daemon off;' \
  && nginx
