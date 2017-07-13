#!/bin/bash

USERID=`id -u`
if [ $USERID != 0 ]; then
  echo "Please use root user to run this script."
  exit 1
fi

# Installation.
apt-get install python-pip privoxy -y
pip install shadowsocks

# Config files.
sscfg="/etc/ss.json"
privoxycfg="/etc/privoxy/config"
proxycmd="/usr/bin/proxy"

if [ ! -f $sscfg ]; then

# Default config file of shadowsocks.
cat > "$sscfg" <<EOF
{
  "server": "1.1.1.1",
  "server_port": 8388,
  "local_address": "127.0.0.1",
  "local_port": 1080,
  "password": "passwd",
  "timeout": 300,
  "method": "aes-256-cfb",
  "fast_open": true,
  "workers": 1
}
EOF

fi

# Backup privoxy config file.
mv $privoxycfg /etc/privoxy/config.bak

# Create privoxy config file.
cat > "$privoxycfg" <<EOF
forward-socks5 / 127.0.0.1:1080 .
listen-address 127.0.0.1:8118
# local network do not use proxy
forward         192.168.*.*/     .
forward            10.*.*.*/     .
forward           127.*.*.*/     .
EOF

# Create `proxy` script.
cat > "$proxycmd" <<EOF
#!/bin/bash
http_proxy=http://127.0.0.1:8118 https_proxy=http://127.0.0.1:8118 \$*
EOF
chmod +x $proxycmd

[ ! -d /usr/local/sbin ] && mkdir -p /usr/local/sbin
cp ./start-ss.sh /usr/local/sbin/

# Install supervisor.
apt-get install supervisor

# Setup config file for sslocal.
SSLOCAL_CONF='/etc/supervisor/conf.d/sslocal.conf'
cat > "$SSLOCAL_CONF" <<EOF
[program:sslocal]
directory=/root
command=/usr/local/bin/sslocal -c /etc/ss.json
autostart=true
autorestart=true
startsecs=10
stdout_logfile=/var/log/sslocal/stdout.log
stdout_logfile_maxbytes=1MB
stdout_logfile_backups=10
stdout_capture_maxbytes=1MB
stderr_logfile=/var/log/sslocal/stderr.log
stderr_logfile_maxbytes=1MB
stderr_logfile_backups=10
stderr_capture_maxbytes=1MB
user = root
environment = HOME="/root", USER="root"
EOF

# Start services.
mkdir -p /var/log/sslocal
service supervisor restart
supervisorctl restart sslocal

echo "Please make configuration '/etc/ss.json'"
echo "Run: 'privoxy /etc/privoxy/config' to start privoxy."
echo "Run: 'proxy [your command]' for passing GFW."
