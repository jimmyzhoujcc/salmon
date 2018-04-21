#!/bin/bash

/usr/sbin/ntpdate time.nist.gov time.windows.com > /dev/null 2>&1

echo 'This is a test script' date
date
uname
hostname
