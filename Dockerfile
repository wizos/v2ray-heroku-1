FROM alpine:3.5

RUN apk add --no-cache --virtual .build-deps ca-certificates curl unzip

RUN mkdir -m 777 /v2ray

COPY server_config_vmess.json /server_config_vmess.json
COPY server_config_vless.json /server_config_vless.json
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
CMD /configure.sh