#!/usr/bin/env bash
#
# ############################################################################
# Project: xSHELL (none)
# File...: examples/xshell_env.sh
# Created: Saturday, 2026/08/08 - 11:33:09
# Author.: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Last Modified: Thursday, 2026/08/20 - 06:53:13
# Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Version: 0.0.5.58
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Description: 
#  >
# ############################################################################
# HISTORY:
#

# environment variables for xSHELL
# this should be add in  ~/.profile and /etc/profile

export xSHELL_PATH="/opt/xSHELL" #change me for your current install dir
export xSHELL_INIT="${xSHELL_PATH}/init"
export xSHELL_BIN="${xSHELL_PATH}/bin"
export xSHELL_SCRIPTS="${xSHELL_PATH}/scripts"
export xSHELL_EXAMPLES="${xSHELL_PATH}/examples"

export BASH_ENV="${xSHELL_PATH}/examples/xshell_env.sh"

export PATH="${PATH}:${xSHELL_PATH}:${xSHELL_BIN}:${xSHELL_SCRIPTS}:${xSHELL_EXAMPLES}:${HOME}/bin"

# shellcheck disable=SC1091
xs_init(){ source "${xSHELL_PATH}/init"; }

# xSHELL is installed?
if [ -n "$xSHELL_PATH" ] && [ -f "${xSHELL_PATH}/examples/xshell_env.sh" ]; then

    # config BASH_ENV on current user
    if ! grep -q 'export BASH_ENV="$HOME/.xshell_env.sh"' ~/.profile; then
        cp "${xSHELL_PATH}/examples/xshell_env.sh" ~/.xshell_env.sh
        echo 'export BASH_ENV="$HOME/.xshell_env.sh"' >> ~/.profile
    fi
    
    # config BASH_ENV on etc
    if [ "$(id -u)" -eq 0 ]; then
        if ! grep -q 'export BASH_ENV=/etc/profile.d/xshell_env.sh' /etc/profile; then
            cp "${xSHELL_PATH}/examples/xshell_env.sh" /etc/profile.d/xshell_env.sh
            echo 'export BASH_ENV=/etc/profile.d/xshell_env.sh' >> /etc/profile
        fi
    fi

fi
