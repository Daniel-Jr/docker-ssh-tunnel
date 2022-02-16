#!/bin/sh

if [ -z ${REMOTE_SERVER_IP+x} ]; then
    REMOTE_SERVER_IP="127.0.0.1"
fi

if  [ -z ${SSH_PORT+x} ] ; then
    SSH_PORT="22"
fi

if [ -z ${LOCAL_PORT+x} ] || [ -z ${REMOTE_PORT+x} ] || [ -z ${SSH_HOST+x} ] || [ -z ${SSH_USER+x} ] ; then 
    echo "some vars are not set"; 
    exit 1
fi

echo "starting SSH proxy $LOCAL_PORT:$REMOTE_SERVER_IP:$REMOTE_PORT on $SSH_USER@$SSH_HOST"

/usr/bin/ssh \
-NTC -o ServerAliveInterval=60 \
-o ExitOnForwardFailure=yes \
-o StrictHostKeyChecking=no \
-L $LOCAL_PORT:$REMOTE_SERVER_IP:$REMOTE_PORT \
$SSH_USER@$SSH_HOST \
-i /ssh_key/id_rsa