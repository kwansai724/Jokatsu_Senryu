#!/bin/bash
set -e

rm -f /jokatsu_senryu/tmp/pids/server.pid

exec "$@"
