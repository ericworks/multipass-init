alias create-vm="multipass launch -m 8G -c 4 -d 16G jammy"

alias create-codium="multipass launch -m 16G -c 4 -d 64G jammy --cloud-init ~/Projects/multipass-init/vscode-server-init.yaml"

alias create-jupyter="multipass launch -m 16G -c 4 -d 64G jammy --cloud-init ~/Projects/multipass-init/jupyter-init.yaml"

alias create-rstudio="multipass launch -m 16G -c 4 -d 64G focal --cloud-init ~/Projects/multipass-init/rstudio-server-init.yaml"
