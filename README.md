# multipass-init

## What is this repository

This is a simple multipass compatible cloud-init config for several popular
server softwares. I use these config files to create server-side softwares
in local virtual machine created using multipass. Simply type some command
like `create-jupyter` in terminal to create a fresh virtual machine running 
locally with the latest jupyter notebook softwares installed within minutes. 
Then through host browser, visit http://10.6.111.xxx:8888 to use 
the just created jupyter instance in super clean environment.

With cloud-init, It is extremely convinent to customize it. To keep your 
workspace presistent across virtual machines, you can:

1. mount your existing workspace data dir into the virtual machine. 
2. pull your workspace repository with the credentials files written directly
from cloud-init config or from local files.

## How to use

Change the cloud-init config path in `.bashrc` file. Append the content to 
your local `~/.bashrc`. Finally `source ~/.bashrc` to start using.

## Todo

- vscode-server seems shutting down itself after 3 hours not seeing an 
incoming connection.
- use bash script to 
  - auto detect current path
  - recognize existing alias in `.bashrc`
  - append or change the alia commands in `.bashrc`
