#!/bin/zsh

echo -e "auth sufficient pam_tid.so\n$(cat /etc/pam.d/sudo)" > /etc/pam.d/sudo
