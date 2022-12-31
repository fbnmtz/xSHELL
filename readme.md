<!--
 ############################################################################
 Project: shell (none)
 File...: readme.md
 Created: Friday, 2022/12/30 - 04:54:21
 Author.: @fbnmtz, (fabiano.matoz@gmail.com)
 ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
 Last Modified: Saturday, 2022/12/31 - 16:07:38
 Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
 ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
 Version: 0.0.3.130
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

# Add scripts to your system $PATH
echo "export PATH="$PATH:$HOME/bin" >> ~/.profile
```

## Using lib system

Now you can use this libs/funcions in your scripts following steps bellow:

```bash
# import lib system to your script
source ~/bin/lib/init  

# load basic lib 'args'
use args

# you can list/validade all binaries/tools needed by your script easily using 'requirements' function
requirements ls cut docker

# now, you can easily define args and usage info with 'xargs' function
# params supported:
#      * --id <shortflat,longflag>
#            this param require two params 
#                1. --var or --code
#                2. --desc
#          * --var <var1:varvalue,var2+r,var3+o>
#          * --desc <description>
# We have another param made to be used alone 
#      * --section <group name>
#            this param will group args defined after it

# example: how to set args/actions
xargs --id -p,--print --code "echo 'print test'" --desc "print some code"
xargs --id -m,--math  --var expression+r         --desc "solve math expression" 

# after define args, pass all script params (var $@) to 'xrun' function 
# xrun params:
#   * --xreject-unknow : throw error when receive an parameter not defined with 'xargs'
#   * --xrequire-one: throw error if no param given
#   * --xversionrc: show full version with release candidate
xrun --xreject-unknow --xrequire-one --xversionrc "$@"

# code for -m/--math arg
if [ ! -z "$expression" ] ; then
    echo $(($expression))
fi

```

## Libraries

1. [LIB's](./lib/readme.md)
## Script's
   
1. [torctl](./docs/torctl.md)
2. [mdate](docs/mdate.md)
