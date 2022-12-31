<!--
 ############################################################################
 Project: shell (none)
 File...: readme.md
 Created: Friday, 2022/12/30 - 04:54:21
 Author.: @fbnmtz, (fabiano.matoz@gmail.com)
 ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
 Last Modified: Saturday, 2022/12/31 - 11:06:48
 Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
 ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
 Version: 0.0.1.57
 ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
 Description: 
  >
 ############################################################################
 HISTORY:
-->
# Shell

This repository contains some scripts and a simple library system for shell.

## Install lib/scripts

```bash
# clone this repo to your '/home'
 git clone https://github.com/fbnmtz/shell ~/bin

# Add scripts to your  system $PATH
echo "export PATH="$PATH:$HOME/bin" >> ~/.profile
```

## Using libs

Now you can use this libs/funcions in your scripts follow steps bellow:

```bash
# import lib system to your script
source ~/bin/lib/init  

# load basic lib 'args'
use args

# you can list/validade all binaries/tools needed by your script easily using 'requirements' function
requirements ls cut docker

# you can easily define args and usage info with 'xargs' function
xargs --id -V,--variable --var var_name:var_value --desc "create a variable named as 'var_name' with 'var_value'"
# when receive -V or --var arg, this function will 
# equivalent code:
# var_name='var_value'    

```

### Main Lib's

* init
* args
* utils
* hashs

### Lib 'args'

* main functions
  * requirements
  * xargs
  * xrun

## Some scripts

1. [torctl](./docs/torctl.md)
