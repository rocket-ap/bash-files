#!/bin/bash

# Define source file paths
SOURCE_01="/var/rocket-ssh/xray/conf/01_vless_tcp.json"
SOURCE_02="/var/rocket-ssh/xray/conf/02_vmess_tcp.json"

# # Define destination file names (03 and 04 in the current directory)
# DEST_01="/var/rocket-ssh/xray/conf/03_vless_tcp.json"
# DEST_02="/var/rocket-ssh/xray/conf/04_vmess_tcp.json"

# # Copy the source files to the current directory with new names
# cp "$SOURCE_01" "$DEST_01"
# cp "$SOURCE_02" "$DEST_02"

# Remove the tcpSettings block from the JSON structure in both files
# Using jq to remove the "tcpSettings" field inside the "streamSettings" block
jq '(.inbounds[] | .streamSettings) |= del(.tcpSettings)' "$SOURCE_01" > temp_03.json && mv temp_03.json "$SOURCE_01"
jq '(.inbounds[] | .streamSettings) |= del(.tcpSettings)' "$SOURCE_02" > temp_04.json && mv temp_04.json "$SOURCE_02"

echo "tcpSettings block removed from both files."


