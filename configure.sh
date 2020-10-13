#!/bin/sh

mkdir /tmp/v2ray

# Download V2Ray
curl -L -H "Cache-Control: no-cache" -o /tmp/v2ray/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip /tmp/v2ray/v2ray.zip -d /tmp/v2ray
install -m 755 /tmp/v2ray/v2ray /usr/local/bin/v2ray
install -m 755 /tmp/v2ray/v2ctl /usr/local/bin/v2ctl


# Remove temporary directory
rm -rf /tmp/v2ray


# chmod +x 给与文件执行权限
chmod +x v2ray v2ctl

if [ "$PROTOCOL" = "vless" ]; then
  # cp 是复制，-f 是强制复制
  cp -f /server_config_vless.json config.json
else
  cp -f /server_config_vmess.json config.json
fi

# sed -i 就是直接对文本文件进行操作
# sed -i 's/原字符串/新字符串/g' 文件地址
sed -i "s/your_uuid/$UUID/g" config.json
sed -i "s/your_path/$PATH/g" config.json

# nohup 加在一个命令的最前面，表示不挂断的运行命令
# & 加在一个命令的最后面，表示这个命令放在后台执行
nohup ./v2ray &