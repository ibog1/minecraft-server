#!/usr/bin/env sh
set -eu

cd /data

# EULA must be provided via environment variable
echo "eula=${EULA}" > eula.txt

# server.properties generated strictly from environment variables
# User must define all values in .env
if [ ! -f server.properties ]; then
  cat > server.properties <<EOF
server-port=${SERVER_PORT}
online-mode=${ONLINE_MODE}
enable-query=${ENABLE_QUERY}
query.port=${QUERY_PORT}
motd=${MOTD}
EOF
fi

# JVM memory settings must be provided via environment variables
exec java -Xms"${XMS}" -Xmx"${XMX}" -jar /opt/mc/server.jar nogui
