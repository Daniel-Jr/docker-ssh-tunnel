# Docker SSH Tunnel

Create a lightweight Alpine Linux based SSH tunnel to a host.  Uses pure SSH.

## Required Parameters

```bash
# local port on your machine
LOCAL_PORT=12038

# remote port from the machine your SSH into
REMOTE_PORT=12038

# OPTIONAL defaults to 127.0.0.1
REMOTE_SERVER_IP="my.internal.network"

# the host you're connecting to
SSH_HOST="my.host"

SSH_USER="user"
```
Also be sure to inject/mount your private ssh key into the container to `/ssh_key/id_rsa`

## Example

```bash

docker run -it --rm \
-p 12038:12038 \
-e LOCAL_PORT=12038 \
-e REMOTE_PORT=12038 \
-e SSH_HOST=187.57.173.238 \
-e SSH_USER=ec2-user \
-v ~/.ssh/id_rsa:/ssh_key/id_rsa:ro \