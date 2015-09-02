#!/bin/bash

mkdir -p /data
exec /usr/bin/supervisord -n
