<!--
 ############################################################################
 Project: xSHELL (none)
 File...: readme.md
 Created: Friday, 2022/12/30 - 04:54:21
 Author.: @fbnmtz, (fabiano.matoz@gmail.com)
 ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
 Last Modified: Saturday, 2026/09/19 - 21:45:30
 Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
 ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
 Version: 0.1.4.588
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

## Summary

- [Summary](#summary)
- [Install](#install)
  - [Arguments](#arguments)
  - [Files](#files)
    - [ENV](#env)
- [`xshell` command](#xshell-command)
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
curl -sSL https://raw.githubusercontent.com/fbnmtz/xSHELL/refs/heads/master/scripts/install | bash
```

After run install command, you will have the variable `$_xSHELL_` PATH with the default install location, or a customized path of your choice. This also will add configs on some system files:

### Arguments

You can pass arguments to install script adding `-s -- ` to bash following arguments do install script

* `--verbose`: enable rich information output
* `--dir`: define directory used on installation

```bash
curl -sSL https://raw.githubusercontent.com/fbnmtz/xSHELL/refs/heads/master/scripts/install | bash -s -- --verbose --dir /custom/path
```

### Files

If installed as root, will change files on etc and home folder of each user

* System:
  * /etc/profile
  * /etc/bashrc
  * /etc/bash.bashrc
  * /etc/profile.d/xSHELL.sh
* each user:
  * .profile
  * .bashrc
  * .bash_profile
  * .bash_login
  * .zshrc
  * .zprofile
  * .zlogin

#### ENV

this content will be added to listed files:

```bash
export xSHELL_PATH="/opt/xSHELL"
export xSHELL_INIT="${xSHELL_PATH}/init"
export xSHELL_BIN="${xSHELL_PATH}/bin"
export xSHELL_SCRIPTS="${xSHELL_PATH}/scripts"
export xSHELL_EXAMPLES="${xSHELL_PATH}/examples"
export PATH="${PATH}:${xSHELL_PATH}:${xSHELL_BIN}:${xSHELL_SCRIPTS}:${xSHELL_EXAMPLES}:${HOME}/bin"
xs_init(){ source "${xSHELL_PATH}/init" ; }
```

[Go Back](#summary)

## `xshell` command

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

[Go Back](#summary)

### Example of Usage (libsExample script)

You can create your new script (default location `$HOME/bin`) using `xshell` tool:

```bash
xshell -f libsExample \
    -e nano \
    --args "
        -p,--print;code='echo.print.test';desc='print.some.code' 
        -n,--notify;var=title+r,text+r;desc='test.notify.system' 
        -m,--math;var=expression+r;desc='solve.math.expression'  
        -V,--volume;var=option+r;desc='volume.option.(up.or.down)'
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

XS_AUTHOR="@fbnmtz"
XS_CREATED_AT="2023"
XS_CURRENT_VERSION="0.0.1"

# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~
# shellcheck disable=SC1090,SC2154
#   * SC1090: Can't follow non-constant source. Use a directive to specify location.
#       -> cant follow or source usage
#   * SC2154: var is referenced but not assigned.
#       -> variables will be created by or library system (don't worry)

# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~
source "$xSHELL_INIT"
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

[Go Back](#summary)

<!-- ### Note about lib/args:

1. using `xarg` function, two options are automatically generated (`--help `and `--version`):

   1. --help

      `create a usage information based on defined parameters with function 'xarg'`
   2. --version

      `show de version defined by variable ${XS_CURRENT_VERSION`}
2. some values come from the header information. If you don't use the same header, please define this variables before call `xrun` function:

   ```bash
   XS_AUTHOR="YourNme"
   XS_CREATED_AT="year"
   XS_CURRENT_VERSION="X.X.X"
   ```
[Go Back](#summary) -->

---

## Libraries

#### init

```
Basic library to initialize our framework/system.
```

<details close="true">

* Variables

  * `$APP`
    * Store current script name
  * `$APP_DIR`
    * Store current script path
  * `$APP_HOME`
    * Default location to script save configs and related files
* Functions

  * `xs_app_home {dir1, dir2}`
    * Create `$APP_HOME` directory. Default localtion is `$HOME/.xshell/$APP`
  * `use lib1 lib2 lib3`
    * function to easily load libraries into your script
  * `xrequirements binary1 binary2`
    * function to check if a binary exists on your system. Pass program names separeted by spaces. Throw an error and exit if not found.
    * you can test conditional binarys using this syntax: `xrequirements "bin1|bin2"` (that means bin1 or bin2)

</details>
</br>

#### args

```
This library is used to manage/generate/validate the command line arguments of a script.
```

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
  xarg --id "-v,--version" --code "echo "$XS_CURRENT_VERSION"; exit" --desc "print version and exit"
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

```
Library to by an interface between your scritp and Operation System, providin some basic functions.
```

#### colors

```
This library set variables with ANSI codes allowing you to use colors on your script.
```

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
  $GREY
  # foreground bright colors
  $BLACK_BRIGTH
  $RED_BRIGTH
  $GREEN_BRIGTH
  $YELLOW_BRIGTH
  $BLUE_BRIGTH
  $MAGENTA_BRIGTH
  $CYAN_BRIGTH
  $WHITE_BRIGTH
  $GREY_BRIGTH
  # background colors
  $BGBLACK
  $BGRED
  $BGGREEN
  $BGYELLOW
  $BGBLUE
  $BGMAGENTA
  $BGCYAN
  $BGWHITE
  $BGGREY
  # background bright colors
  $BGBLACK_BRIGTH
  $BGRED_BRIGTH
  $BGGREEN_BRIGTH
  $BGYELLOW_BRIGTH
  $BGBLUE_BRIGTH
  $BGMAGENTA_BRIGTH
  $BGCYAN_BRIGTH
  $BGWHITE_BRIGTH
  $BGGREY_BRIGTH
  # aliases for attributes
  $ATTR_BOLD
  $ATTR_DIM
  $ATTR_ITALIC
  $ATTR_UNDERLINED
  $ATTR_BLINK
  $ATTR_REVERSE
  $ATTR_HIDDEN
  # aliases for foreground colors
  $FG_BLACK
  $FG_RED
  $FG_GREEN
  $FG_YELLOW
  $FG_BLUE
  $FG_MAGENTA
  $FG_CYAN
  $FG_WHITE
  $FG_GREY
  # aliases for foreground bright colors
  $FG_BLACK_BRIGTH
  $FG_RED_BRIGTH
  $FG_GREEN_BRIGTH
  $FG_YELLOW_BRIGTH
  $FG_BLUE_BRIGTH
  $FG_MAGENTA_BRIGTH
  $FG_CYAN_BRIGTH
  $FG_WHITE_BRIGTH
  $FG_GREY_BRIGTH
  # aliases for background colors
  $BG_BLACK
  $BG_RED
  $BG_GREEN
  $BG_YELLOW
  $BG_BLUE
  $BG_MAGENTA
  $BG_CYAN
  $BG_WHITE
  $BG_GREY
  # aliases for background bright colors
  $BG_BLACK_BRIGTH
  $BG_RED_BRIGTH
  $BG_GREEN_BRIGTH
  $BG_YELLOW_BRIGTH
  $BG_BLUE_BRIGTH
  $BG_MAGENTA_BRIGTH
  $BG_CYAN_BRIGTH
  $BG_WHITE_BRIGTH
  $BG_GREY_BRIGTH
  # short aliases for foreground colors
  $FGBLACK
  $FGRED
  $FGGREEN
  $FGYELLOW
  $FGBLUE
  $FGMAGENTA
  $FGCYAN
  $FGWHITE
  $FGGREY
  # short semantic aliases
  $R # reset
  # attributes
  $B # bold
  $M # dimm
  $I # italic
  $U # underline
  $K # blink
  $V # reverse
  $H # hidden
  # Foreground (one-letter)
  $k # $FG_BLACK
  $r # $FG_RED
  $g # $FG_GREEN
  $y # $FG_YELLOW
  $b # $FG_BLUE
  $m # $FG_MAGENTA
  $c # $FG_CYAN
  $w # $FG_WHITE
  $e # $FG_GREY
  # Background (two-letter: 'b'+color)
  $bk # $BG_BLACK
  $br # $BG_RED
  $bg # $BG_GREEN
  $by # $BG_YELLOW
  $bb # $BG_BLUE
  $bm # $BG_MAGENTA
  $bc # $BG_CYAN
  $bw # $BG_WHITE
  $be # $BG_GREY
  ```

</details>
</br>

#### utils

```
A collection of auxiliary functions.
```

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

#### oo

```
Object Orientation (OO) for Bash.
```

<details close="true">

Features:

* Class definition (`class Name { ... }`)
* Attribute declaration with optional default values (`attr name [default]`, or aliases `prop`, `property`)
* Method definition (`def method() { ... }`, or aliases `method`, `define`) with automatic `$this.attr` expansion
* Object instantiation (`c1 = new Name`)
* Property assignment (`c1.attr = val` or `c1.attr=val`)
* Method dispatching with arguments (`c1.method [args...]`)
* Object introspection (`c1.dump`)

```bash
# Import and load
source "$xSHELL_INIT"
use oo

# Define class
class Car {
  property brand "desconhecida"
  prop model "padrao"
  attr speed 0

  method run() {
    echo "car $this.model running (speed: $this.speed km/h)"
  }

  define accelerate() {
    this.speed = "$1"
  }

  def stop() {
    this.speed = 0
  }
}

# Instantiate and use
c1 = new Car
c1.brand = honda
c1.model=civic
c1.accelerate 100
c1.run
c1.stop
```

</details>
</br>

[Go Back](#summary)

---

## TODO List

* [X] xshell: add support for define args for new scripts
* [X] Implent color system (draft)
* [X] lib/args: Implements joint flags (ex: -lsaf)
* [X] Create/integrate some library or system for Objetc Orientation (OO)
* [ ] Adjust some libs and scripts to work on MacOs

[Go Back](#summary)

---

Contributions are welcome! &lt;3

Made with ❤️ and shellscript.
