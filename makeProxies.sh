#!/bin/bash

# takes in stuff like
# http://77.73.241.154:80
# socks5://148.251.249.243:3128
# make jdownloader-compliant .jdproxies file

input=$1
if [ -z "$input" ]; then
    echo >&2 "need to pass input file in form of protocol://host:ip"
    exit 1
fi
output=proxies.jdproxies



echo '{ "customProxyList" : [ { "proxy" : { "username" : null, "password" : null, "port" : 80, "address" : null, "type" : "NONE", "preferNativeImplementation" : false, "resolveHostName" : false, "connectMethodPrefered" : false }, "rangeRequestsSupported" : true, "filter" : null, "pac" : false, "reconnectSupported" : true, "enabled" : true }' > "$output"
sed 's/^\(.*\):\/\/\(.*\):\([0-9]*\)\s*$/, {"proxy": {"username": null, "password": null, "port": \3, "address": "\2", "type": "\U\1\E", "preferNativeImplementation": false, "resolveHostName": false, "connectMethodPrefered": false }, "rangeRequestsSupported": true, "filter": null, "pac": false, "reconnectSupported": false, "enabled": true }/' "$input" >> "$output"
echo ']}' >> "$output"
