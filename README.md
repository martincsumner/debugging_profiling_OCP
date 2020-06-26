
curl -L https://github.com/boot2podman/machine/releases/download/v0.16/podman-machine.darwin-amd64 --output /usr/local/bin/podman-machine chmod +x


/Users/martins_rh/redhat_work/podman_share


podman-machine create --virtualbox-boot2podman-url https://github.com/snowjet/boot2podman-fedora-iso/releases/download/d1bb19f/boot2podman-fedora.iso --virtualbox-memory="4096" --virtualbox-share-folder ~/redhat_work/podman_share:code fedbox


podman run -p 8080:80/tcp --rm httpd

sudo podman-machine ip fedbox

curl http://192.168.99.122:8080


 
 podman-machine stop fedbox
 podman-machine start fedbox
 
 
 
 podman-machine rm fedbox
 
 

