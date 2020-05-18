# Main
FROM nginx:1.17.7
ARG gitCommit
ENV GIT_COMMIT ${gitCommit}

RUN  mkdir -p /ssl
COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.conf.template /etc/nginx/nginx.conf.template
COPY ssl/* /ssl/

CMD echo "ui gitCommit:${GIT_COMMIT}" \
  && nginx -t \
  && nginx -g 'daemon off;'
