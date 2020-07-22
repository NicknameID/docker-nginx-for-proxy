FROM nginx:1.16-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY naproxy.conf /etc/nginx/naproxy.conf
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add --no-cache bash apache2-utils \
    && chmod +x /docker-entrypoint.sh
STOPSIGNAL SIGTERM
CMD ["/docker-entrypoint.sh"]