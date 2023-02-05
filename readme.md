<!--
 ############################################################################
 Project: xSHELL (none)
 File...: readme.md
 Created: Friday, 2022/12/30 - 04:54:21
 Author.: @fbnmtz, (fabiano.matoz@gmail.com)
 ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
 Last Modified: Sunday, 2023/02/05 - 00:04:48
 Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
 ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
 Version: 0.0.19.329
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

## Index
- [Index](#index)
- [Install](#install)
- [`xshell` Command](#xshell-command)
  - [Example of Usage](#example-of-usage)
    - [Code gerenated](#code-gerenated)
    - [Adding custom code](#adding-custom-code)
    - [libsExample output](#libsexample-output)
- [Libraries](#libraries)
    - [init](#init)
    - [args](#args)
    - [system](#system)
- [TODO List](#todo-list)

---

## Install
Steps to install `xSHELL` library system

```bash
curl -sSL https://raw.githubusercontent.com/fbnmtz/shell/master/install | bash 

```

After run install command, you will have xSHELL on your home and added to your system `$PATH`

* `~/bin/xSHELL`

---

## `xshell` Command
Within this library, comes `xshell` tool used create new scripts;

```
xshell -h

usage:
  xshell [-a <arguments>] [-e <editor>] [-f <name>] [-H] [-l] [-h] [-v]

-> Available Options:
   -a,  --args <arguments> define <arguments> for new script
   -e,  --editor <editor>  define <editor> to open script
   -f,  --filename <name>  filename for new script
   -H,  --header           enable our default header on the new script
   -l,  --lib              define new script as a our LIB type (can be loaded with 'use' function)
   -h,  --help             show this help
   -v,  --version          print version and exit

v0.1.15-rc300 - writen by @fbnmtz 2020


```
[Go Back](#index)

### Example of Usage

You can create your new script using `xshell` tool:


```bash
xshell -f libsExample \
    -e nano \
    --args "
    id=-p,--print;code='echo.print.test';desc='print-some-code' 
    id=-n,--notify;var=title+r,text+r;desc='test.notify.system' 
    id=-m,--math;var=expression+r;desc='solve.math.expression'  
    id=-V,--volume;var=option+r;desc='volume.option.(up.or.down)'"
```

<!-- # now, you can easily define args and usage info with 'xarg' function
# params supported:
#      * --id <shortflat,longflag>
#            this param require two params 
#                1. --var or --code
#                2. --desc
#          * --var <var1:varvalue,var2+r,var3+o>
#          * --desc <description>
# We have another param made to be used alone 
#      * --section <group name>
#            this param will group args defined after it -->

#### Code gerenated

`xshell` command above will generate this code below and open the new file on defined editor:
<details close="true">

```bash
# script: libsExample

#!/usr/bin/env bash

_AUTHOR_="fabiano.matoz@gmail.com"
_CREATED_AT_="2023"
_CURRENT_VERSION_="0.0.1"


# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~
# shellcheck disable=SC1090,SC2154
#   * SC1090: Can't follow non-constant source. Use a directive to specify location.
#       -> cant follow or source usage
#   * SC2154: var is referenced but not assigned.
#       -> variables created by or library system (don't worry)

# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~
source ~/bin/xSHELL/init
use args
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~

xarg --id -p,--print --code 'echo print test' --desc 'print-some-code'
xarg --id -n,--notify --var title+r,text+r --desc 'test notify system'
xarg --id -m,--math --var expression+r --desc 'solve math expression'
xarg --id -V,--volume --var option+r --desc 'volume option (up or down)'
```


#### Adding custom code

After it, you can create all your code using args defined earlier.

Example:

```bash
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

#### libsExample output

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

</details>
</br>

[Go Back](#index)

<!-- ### Note about lib/args:

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
[Go Back](#index) -->

## Libraries

#### init
#### args
#### system
* ### utils
  
[Go Back](#index)

## TODO List

* [ ] Implements joint flags (ex: -lsaf)
* [ ] Create/integrate some library or system for Objetc Orientation (OO)
* [ ] Adjust some libs and scripts to work on MacOs
* [ ] Implent color system

[Go Back](#index)

---


Contributions are welcome! &lt;3

Made with :heart: and shellscript.
