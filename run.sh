#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

docker run -d \
    --name=jdownloader-2 \
    -p 5800:5800 \
    -v "$DIR/config:/config:rw" \
    -v "$HOME/Downloads/jdownloader:/output:rw" \
    jlesage/jdownloader-2


echo http://localhost:5800
