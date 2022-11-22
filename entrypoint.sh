#!/bin/bash
set -e 

rm -f /get_jobs/tmp/pids/server.pid

exec "$@"