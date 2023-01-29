<!--
 ############################################################################
 Project: xSHELL (none)
 File...: readme.md
 Created: Friday, 2022/12/30 - 04:54:21
 Author.: @fbnmtz, (fabiano.matoz@gmail.com)
 ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
 Last Modified: Sunday, 2023/01/29 - 11:28:25
 Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
 ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
 Version: 0.0.14.252
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
    </br></br></br>xSHELL is a simple library system for bash/shell.</br></br></br>
</p>

## Install `xSHELL` library system

```bash
curl -sSL https://raw.githubusercontent.com/fbnmtz/shell/master/install | bash 

```

After run install command, you will have xSHELL on your home and added to your system `$PATH`

* `~/bin/xSHELL`

Within this library, comes `xshell` tool used create new scripts;

```
xshell -h

usage:
  xshell [-f <name>] [-l] [-H] [-e <editor>] [-h] [-v]

-> Available Options:
   -f,  --filename <name> filename for new script
   -l,  --lib             define script as a LIB
   -H,  --header          enable default header on the new script
   -e,  --editor <editor> define editor to open script
   -h,  --help            show this help
   -v,  --version         print version and exit

v0.1.9 - writen by @fbnmtz 2020

```

## Example of a script using xSHELL lib system

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

v0.0.6-rc81 - writen by @fbnmtz 2023

# using --math option
libsExapmle --math "2*2"
4

```

### Note about lib/args:

1. using `xarg` function, two options are automatically generated (`--help `and `--version`):

   1. --help

      `create a usage information based on defined parameters with function 'xarg'`
   2. --version

      `show de version defined by variable ${_CURRENT_VERSION_`}
2. some values come from the header information. If you don't use the same header, please define this variables before call `xrun` function:

   ```bash
   _AUTHOR_="YourNme"
   _CREATED_AT_="year"
   _CURRENT_VERSION_="X.X.X"
   ```

## Libraries

To update!!

# TODO List:

* [ ] Create/integrate some library or system for Objetc Orientation (OO)
* [ ] Adjust some libs and scripts to work on MacOs
* [ ] Implent color system
