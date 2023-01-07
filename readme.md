<!--
 ############################################################################
 Project: shell (none)
 File...: readme.md
 Created: Friday, 2022/12/30 - 04:54:21
 Author.: @fbnmtz, (fabiano.matoz@gmail.com)
 ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
 Last Modified: Saturday, 2023/01/07 - 08:57:06
 Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
 ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
 Version: 0.0.10.155
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
curl -sSL https://raw.githubusercontent.com/fbnmtz/shell/master/install-shell | bash 

```

## Using lib system

Bellow, an example showing how you can use this libs/funcions in your scripts:

```bash
# script: libsExample

# import lib system to your script
source ~/bin/lib/init  

# load basic lib 'args'
use args

# you can list/validade all binaries/tools needed by your script easily using 'requirements' function
requirements echo

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
xargs --section "Custom Args"
xargs --id -p,--print --code "echo 'print test'" --desc "print some code"
xargs --id -m,--math  --var expression+r         --desc "solve math expression" 

# after define args, pass all script params (var $@) to 'xrun' function 
# xrun optional params:
#   * --xreject-unknow : throw error when receive an parameter not defined with 'xargs'
#   * --xrequire-one...: throw error if no param given
#   * --xversionrc.....: show full version with release candidate
xrun --xreject-unknow --xrequire-one --xversionrc "$@"

# code for -m/--math arg
if [ ! -z "$expression" ] ; then
    echo $(($expression))
fi

```

The code above will generate this output
```
libsExapmle -h

usage:
  libsExapmle [-p] [-m <expression>] [-h] [-v]

-> Custom Args:
   -p,  --print             print some code
   -m,  --math <expression> solve math expression

-> Information Options:
   -h,  --help              show this help
   -v,  --version           print version and exit

v0.0.1-rc1 - writen by @fbnmtz 2023

``` 
Options '--help' and '--version' are automatically generated

## Libraries

1. [LIB's](./lib/readme.md)
## Script's
   
1. [alert](docs/alert.md)
2. [mdate](docs/mdate.md)
3. [mpvtube](docs/mpvtube.md)
4. [torctl](docs/torctl.md)
5. [ytdl](docs/ytdl.md)
