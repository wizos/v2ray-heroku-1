mkdir v2ray
cd v2ray

# Download V2Ray
# wget --no-check-certificate -O v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
curl -L -H "Cache-Control: no-cache" -o v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip

unzip v2ray.zip

echo "执行A"
# chmod +x 给与文件执行权限
chmod +x v2ray v2ctl

echo "执行b"
if [ "$PROTOCOL" = "vless" ]; then
  cp -f /server_config_vless.json .
  mv server_config_vless.json config.json
else
  cp -f /server_config_vmess.json .
  mv server_config_vmess.json config.json
fi

echo "执行C"
sed -i "s/your_uuid/$UUID/g" config.json
sed -i "s/your_path/$WSPATH/g" config.json

cat config.json
echo "执行D"
# nohup ./v2ray &
./v2ray
