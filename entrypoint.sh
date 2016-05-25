#!/bin/bash
set -e
chmod -R +x /etc/periodic/
exec $0 "$@"