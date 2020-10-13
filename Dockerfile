FROM alpine:3.5

RUN apk add --no-cache --virtual .build-deps ca-certificates curl unzip

ADD server_config_vmess.json /server_config_vmess.json
ADD server_config_vless.json /server_config_vless.json
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
CMD /configure.sh
