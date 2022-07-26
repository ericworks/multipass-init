
# Multipass-init cli Shortcuts
# ==============================



MULTIPASS_INIT_PATH_PREFIX="$HOME/Projects/multipass-init"

alias mp-sync-host="multipass list --format json | sudo python3 $MULTIPASS_INIT_PATH_PREFIX/sync-host.py"


function create-vm() {

  multipass launch -m 8G -c 4 -d 16G jammy $@
  mp-sync-host

}


function create-codium() {
  create-vm --cloud-init $MULTIPASS_INIT_PATH_PREFIX/vscode-init.yaml $@
}


function create-jupyter() {
  create-vm --cloud-init $MULTIPASS_INIT_PATH_PREFIX/jupyter-init.yaml $@
}


function create-rstudio() {
  multipass launch -m 8G -c 4 -d 16G focal --cloud-init $MULTIPASS_INIT_PATH_PREFIX/rstudio-server-init.yaml $@
  mp-sync-host
}


function create-jekyll() {
  create-vm -m 2G -c 2 -d 8G --cloud-init $MULTIPASS_INIT_PATH_PREFIX/vscode-jekyll-init.yaml $@
}


function create-docker() {
  create-vm -d 24G --cloud-init $MULTIPASS_INIT_PATH_PREFIX/containers/docker-base-init.yaml $@
}

