<!--
 ############################################################################
 Project: xSHELL (vundefined)
 File...: readme.md
 Created: Friday, 2022/12/30 - 04:54:21
 Author.: @fbnmtz, (fabiano.matoz@gmail.com)
 ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
 Last Modified: Saturday, 2023/02/25 - 18:46:02
 Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
 ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
 Version: 0.0.21.506
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
  - [Example of Usage (libsExample script)](#example-of-usage-libsexample-script)
    - [Code gerenated](#code-gerenated)
    - [Adding custom code](#adding-custom-code)
    - [libsExample output](#libsexample-output)
- [Libraries](#libraries)
    - [init](#init)
    - [args](#args)
    - [system](#system)
    - [colors](#colors)
    - [utils](#utils)
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
  xshell [-a <arguments>] [-e <editor>] [-f <name>] [-H] [-l] [-o <output>] [-h] [-v]

-> Available Options:
   -a,  --args <arguments> define <arguments> for new script
   -e,  --editor <editor>  define <editor> to open script
   -f,  --filename <name>  filename for new script
   -H,  --header           enable our default header on the new script
   -l,  --lib              define new script as a our LIB type (can be loaded with 'use' function)
   -o,  --output <output>  setup <output> directory for new script
   -h,  --help             show this help
   -v,  --version          print version and exit

v0.1.17-rc316 - writen by @fbnmtz 2020




```

[Go Back](#index)

### Example of Usage (libsExample script)

You can create your new script (default location `$HOME/bin`) using `xshell` tool:

```bash
xshell -f libsExample \
    -e nano \
    --args "
        id=-p,--print;code='echo.print.test';desc='print.some.code' 
        id=-n,--notify;var=title+r,text+r;desc='test.notify.system' 
        id=-m,--math;var=expression+r;desc='solve.math.expression'  
        id=-V,--volume;var=option+r;desc='volume.option.(up.or.down)'
    "
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
#!/usr/bin/env bash
# script: libsExample

_AUTHOR_="@fbnmtz"
_CREATED_AT_="2023"
_CURRENT_VERSION_="0.0.1"

# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~
# shellcheck disable=SC1090,SC2154
#   * SC1090: Can't follow non-constant source. Use a directive to specify location.
#       -> cant follow or source usage
#   * SC2154: var is referenced but not assigned.
#       -> variables will be created by or library system (don't worry)

# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~
source ~/bin/xSHELL/init
use args

# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~
xarg --id -p,--print --code 'echo print test' --desc 'print some code'
xarg --id -n,--notify --var title+r,text+r --desc 'test notify system'
xarg --id -m,--math --var expression+r --desc 'solve math expression'
xarg --id -V,--volume --var option+r --desc 'volume option (up or down)'
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~
# initilizae values before xrun (if you need to)

# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~
# arguments will be checked/validated here (use --xhelp arg for more info)
xrun --xreject-unknow --xrequire-one "$@"

# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~
# now put your code below


```

#### Adding custom code

After it, you can create all your code using args defined earlier.

Example:

```bash
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

-> Information Options:
   -p,  --print                 print some code
   -n,  --notify <title> <text> test notify system
   -m,  --math <expression>     solve math expression
   -V,  --volume <option>       volume option (up or down)
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

---

## Libraries

#### init

    Basic library to initialize our framework/system.

<details close="true">

* Variables

  * `$APP`
    * Store current script name
  * `$APP_DIR`
    * Store current script path
  * `$APP_HOME`
    * Default location to script save configs and related files
* Functions

  * `xsetHome {dir1, dir2}`
    * Create `$APP_HOME` directory. Default localtion is `$HOME/.fbnmtz/$APP`
  * `use lib1 lib2 lib3`
    * function to easily load libraries into your script
  * `xrequirements binary1 binary2`
    * function to check if a binary exists on your system. Pass program names separeted by spaces. Throw an error and exit if not found.
    * you can test conditional binarys using this syntax: `xrequirements bin1:bin2` (that means bin1 or bin2)
</details>
</br>

#### args
    This library is used to manage/generate/validate the command line arguments of a script.

<details close="true">

Functions
* `xarg`
  * used to define arguments: 
 
  ```
  # params supported:
    * --id <shortflat,longflag>
      * should be used with '--var' or '--code' 
        1. --var <var1:varvalue,var2+r,+o>
          1.1. `var:value`: this arg will set a var `var=value`
          1.2. `var+r`: (+r=required) this arg will require a new arg and i (can't be null)
          1.3. `var+o`: (+o=optional) this arg accepts another argument (but can be null)
        2. --code <shell commands>
          2.1. this arg will run arg received with `eval` function
    * --desc <description>
      * define description for this argument (will be used in help/usage information)

  # Examples of usage of 'xarg' function:

  xarg --id "-h,--help"    --code "xusage --help"                      --desc "show this help"
  xarg --id "-v,--version" --code "echo "$_CURRENT_VERSION_"; exit" --desc "print version and exit"

  ```
* `xrun`
  * validates arguments 
  ```
  # params to define validations:
    * --xrequire-one
    * --xreject-unknow
    
  # set version format to use release candidate version:
    * --xversionrc

  # help / information 
    * --xdebug 
    * --xhelp
  ```
* `xhelp`
  * set help information to the script. Mostly used internally but you can use it to set header and footer information. 

  ```
  # usable argumnets
    * --header=<value>
    * --footer=<value>
  ```

* `xusage`
* `xflag_require_value`
* `xrequire_one`

</details>
</br>

#### system
    Library to by an interface between your scritp and Operation System, providin some basic functions.

#### colors
    This library set variables with ANSI codes allowing you to use colors on your script. 

<details close="true">

* Variables
  ```bash
  # reset ansi escaping
  $RESET
  # styles
  $BOLD
  $DIM
  $UNDERLINED
  $BLINK
  $REVERSE
  $HIDDEN
  # foreground colors
  $BLACK
  $RED
  $GREEN
  $YELLOW
  $BLUE
  $MAGENTA
  $CYAN
  $WHITE
  # background colors
  $BGBLACK
  $BGRED
  $BGGREEN
  $BGYELLOW
  $BGBLUE
  $BGMAGENTA
  $BGCYAN
  $BGWHITE
  ```
  
</details>
</br>

#### utils
    A collection of auxiliary functions.

<details close="true">

Functions
* getPath
  * return full path of a first binary of all received via arguments
  ```bash
    # usage
    getPath nano vim micro emacs
  ```
* basePath
  * return base path of a file
  ```bash
  # return /etc
  basepath /etc/passwd
  ```
* tern
  * ternary command
  ```bash
    tern "expr" "true value" "false value"
  ```
* isROOT?
  * check if current user is root
* requireROOT
  * require root to continue script (non root users? exit)
<!-- * dots
  ```
  
  ``` -->
  
</details>
</br>

[Go Back](#index)

---

## TODO List

* [x] xshell: add support for define args for new scripts
* [x] Implent color system (draft)
* [ ] lib/arbs: Implements joint flags (ex: -lsaf)
* [ ] Create/integrate some library or system for Objetc Orientation (OO)
* [ ] Adjust some libs and scripts to work on MacOs

[Go Back](#index)

---

Contributions are welcome! &lt;3

Made with ❤️ and shellscript.
