<!--
 ############################################################################
 Project: bin (none)
 File...: xSHELL/readme.md
 Created: Friday, 2022/12/30 - 04:54:21
 Author.: @fbnmtz, (fabiano.matoz@gmail.com)
 ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
 Last Modified: Thursday, 2023/01/19 - 16:56:09
 Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
 ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
 Version: 0.0.13.248
 ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
 Description: 
  >
 ############################################################################
 HISTORY:
-->

<p align="center">
    <a href="https://www.codefactor.io/repository/github/fbnmtz/xSHELL/">
        <img src="https://www.codefactor.io/repository/github/fbnmtz/xSHELL/badge">
    </a>
    <a href="https://github.com/fbnmtz/shell/issues">
        <img src="https://img.shields.io/github/issues/fbnmtz/shell.svg">
    </a>
    <a href="https://img.shields.io/github/forks/fbnmtz/shell.svg">
        <img src="https://img.shields.io/github/forks/fbnmtz/shell.svg">
    </a>
    <a href="https://github.com/fbnmtz/shell/stargazers">
        <img src="https://img.shields.io/github/stars/fbnmtz/shell.svg">
    </a>
    <a href="https://github.com/fbnmtz/shell/graphs/contributors">
      <img alt="GitHub Contributors" src="https://img.shields.io/github/contributors/fbnmtz/shell" />
    </a>
    </br>
    <a href="https://repology.org/metapackage/shell/versions">
        <img src="https://repology.org/badge/tiny-repos/shell.svg">
    </a>
    <a href="https://gitHub.com/fbnmtz/xSHELL/releases/">
        <img src="https://img.shields.io/github/release/fbnmtz/xSHELL.svg">
    </a>
    <!-- <a href="#">
        <img src="https://img.shields.io/github/downloads/fbnmtz/xSHELL/total">
    </a> -->
</p>

<p align="center">
    <img width="250px" src="./docs/logo.jpg" align="center" alt="GitHub Readme Stats" />
</p>

This repository contains some scripts and a simple library system for shell.

## Install 'xSHELL' library system and scripts

```bash
curl -sSL https://raw.githubusercontent.com/fbnmtz/shell/master/install | bash 

```

## Using libs

Bellow, an example showing how you can use this libs/funcions in your scripts:

```bash
# script: libsExample

## import lib system to your script
source ~/bin/xSHELL/init  

# load basic lib 'args'
use args

# you can list/validade all binaries/tools needed by your script easily using 'requirements' function
xrequirements echo

# now, you can easily define args and usage info with 'xarg' function
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
xarg --section "Custom Args"
xarg --id -p,--print   --code "echo 'print test'" --desc "print some code"
xarg --id -n,--notify  --var title+r,text+r       --desc "test notify system"
xarg --id -m,--math    --var expression+r         --desc "solve math expression" 
xarg --id -V,--volume  --var option+r             --desc "volume option (up or down)" 

# after define args, pass all script params (var $@) to 'xrun' function 
# xrun optional params:
#   * --xreject-unknow : throw error when receive an parameter not defined with 'xarg'
#   * --xrequire-one...: throw error if no param given
#   * --xversionrc.....: show full version with release candidate
xrun --xreject-unknow --xrequire-one --xversionrc "$@"

# code for -m/--math arg
if [ -n "$expression" ] ; then
    echo $(($expression))
fi

# test notification function on lib/system 
if [ -n "$title" ]; then
    xsys.notify "$title" "$text"
fi

# test volume function on lib/system
if [ -n "$option" ]; then
    xsys.vol "--$option"
    xsys.notify Volume "$option" # - $(xsys.vol "--status")"
fi

```

The code above will generate this output

```
# check help
libsExapmle -h

usage:
  libsExapmle [-p] [-n <title> <text>] [-m <expression>] [-V <option>] [-h] [-v]

-> Custom Args:
   -p,  --print                 print some code
   -n,  --notify <title> <text> test notify system
   -m,  --math <expression>     solve math expression
   -V,  --volume <option>       volume option (up or down)

-> Information Options:
   -h,  --help                  show this help
   -v,  --version               print version and exit

v0.0.6-rc81 - writen by @fbnmtz 2023****

# using --math option
libsExapmle --math "2*2"
4

```

### Note:

1. Some options are automatically generated:
   1. --help

      `create a usage information basedo on defined parameters with function 'xarg'`
   2. --version

      `show de version defined by variable ${_CURRENT_VERSION_`}
2. some values come from the header information. If you don't use the same header, please define this variables:
   1. \_AUTHOR\_="YourNme"
   2. \_CREATED_AT\_="year"
   3. \_CURRENT_VERSION\_="X.X.X"

## Libraries

To update!!

# TODO List:

* [ ] Create/integrate some library or system for Objetc Orientation (OO)
* [ ] Adjust some libs and scripts to work on MacOs
* [ ] Implent color system
