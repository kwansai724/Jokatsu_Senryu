FROM nginx:latest

# デフォルトで用意されている個別設定ファイルを削除
RUN rm -f /etc/nginx/conf.d/*

ARG ENVIRONMENT
ARG WORKDIR

ENV TZ Asia/Tokyo
RUN echo "${TZ}" > /etc/timezone \
      && dpkg-reconfigure -f noninteractive tzdata

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/conf.d/${ENVIRONMENT}.conf /etc/nginx/conf.d/${WORKDIR}.conf

# Nginxをforeground起動
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf

EXPOSE 80
