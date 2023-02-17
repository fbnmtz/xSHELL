#!/usr/bin/env bash
#
# ############################################################################
# Project: xSHELL (none)
# File...: io
# Created: Thursday, 2021/05/20 - 19:42:14
# Author.: Fabiano Matos, fgm (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Last Modified: Friday, 2023/02/17 - 18:32:43
# Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Version: 0.1.4.159
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Description: 
#  >
# ############################################################################
# HISTORY:
#

_xLIB_IO_=true;

# check requiments of this library
xrequirements xrandr grep tput cut stty printf

# vars to store cursor position (x -> line; y -> column)
whereX=''
whereY=''

# update current cursor position
getXY() { 
  local v=() t=$(stty -g)
  stty -echo
  printf "\033[6n"
  IFS='[;' read -ra v -d R
  stty $t
  CPos=(${v[@]:1})

  whereX=${CPos[0]}
  whereY=${CPos[1]}
}

# alternative functions (not working)
# whereX(){ tput col 2> /dev/null;  }
# whereY(){ tput line 2> /dev/null; }

getScreenSize(){ echo `tput lines`x`tput cols` ; }

# move cursor to X,Y coordinates
gotoXY(){
  if [ -n "$1" ] && [ -n "$2" ]; then
    tput cup "$1" "$2"
  else
    tput cup "$whereX" "$whereY"
 fi
}

# echo wrapper
write(){ echo -e "$@"; }
puts(){ write "$@"; }

# list of screens (monitors)
function get_screens(){ xrandr | grep "Screen" ; }

# get resolution a screen
# @param $1 -> screen name
function current_resolution(){
    # $1 is null? set default screen. Else? use param
    [ -z "$1" ] && screen="Screen 0" || screen="$1"
    xrandr | grep "$screen" | \
        cut -d , -f2 | rev | \
        cut -d ' ' -f1-3 | rev | tr -d ' '
}

# 2020/03/09-13:51:54
# read config in a file
# @param $1: conf name
#   --> search for this pattern: config=value
# @param $2: config file
rconfig(){
    name=$1
    config_file=$2

    # ignore coments -> grep -v '#'
    # get one line matching searcth term  -> grep -m 1 
    value=$(grep -v '#' "$config_file" | grep -m 1 "$name" | cut -d '=' -f 2)
    # return $value
    echo "$value"
}


# 2020/03/04-12:51:18
# redirect outputs to a file (nothing printed in terminal screen)
redirect_output(){

    set -o errexit

    # $1 not null? use as filename. Else? set a default name
    [ -n "$1" ] && LOG_FILE="$1" || readonly LOG_FILE="/tmp/${APP}-output.log"

    # Create the destination log file that we can
    # inspect later if something goes wrong with the
    # initialization.
    touch "$LOG_FILE"

    # Make sure that the file is accessible by the user
    # that we want to give permissions to read later
    # (maybe this script is executed by some other user)
    # sudo chown ubuntu $LOG_FILE

    # Open standard out at `$LOG_FILE` for write.
    # This has the effect 
    exec 1>"$LOG_FILE"

    # Redirect standard error to standard out such that 
    # standard error ends up going to wherever standard
    # out goes (the file).
    exec 2>&1
}