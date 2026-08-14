#!/usr/bin/env bash
#
# ############################################################################
# Project: xSHELL (none)
# File...: examples/xshell_env.sh
# Created: Saturday, 2026/08/08 - 11:33:09
# Author.: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Last Modified: Friday, 2026/08/14 - 13:51:53
# Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Version: 0.0.2.20
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
export PATH="${PATH}:${xSHELL_PATH}:${xSHELL_BIN}:${xSHELL_SCRIPTS}:${xSHELL_EXAMPLES}:${HOME}/bin"
# shellcheck disable=SC1091
xs_init(){ source "${xSHELL_PATH}/init" ; }
