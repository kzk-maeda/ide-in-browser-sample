#!/bin/bash
set -m
/usr/sbin/sshd &
NODE_ENV=default npm start
fg %1