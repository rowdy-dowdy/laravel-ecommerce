# run sail after git clone
- docker run --rm --interactive --tty -v $(pwd):/app composer install

# if permision
- sudo chmod 666 /var/run/docker.sock

# if ERROR [internal] load metadata for docker.io/library/ubuntu
- rm  ~/.docker/config.json