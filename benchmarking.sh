#! /bin/sh

# Single thread
time cat </dev/urandom | head -c 1G | gzip >/dev/null

# Multi thread
time cat </dev/urandom | head -c 1G | pigz >/dev/null
