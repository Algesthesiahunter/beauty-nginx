# Main
FROM openresty/openresty:1.15.8.2-alpine
ARG gitCommit
ENV GIT_COMMIT ${gitCommit}

RUN mkdir -p /usr/local/openresty/nginx/conf
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY ssl /

CMD echo "ui gitCommit:${GIT_COMMIT}" \
  && openresty -t \
  && openresty -g 'daemon off;'
