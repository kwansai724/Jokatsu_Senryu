#!/bin/bash
set -e

rm -f /$cms_app/tmp/pids/server.pid

exec "$@"
