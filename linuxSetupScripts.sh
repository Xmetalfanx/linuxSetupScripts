#!/bin/bash

#Title :          Xmetal's Linux Post Setup Script
#Description :    This script will setup some common things afer a fresh install of various Linux distros
#Author :         Xmetalfanx / Xmetal

readonly basedir=$(pwd)
export basedir

########################################################################
rootdir=$basedir
functionsdir="$rootdir"/tasks/functions

commonFunctions= . $functionsdir/f_common.cfg
$commonFunctions

universalFunctions= . $functionsdir/includeUniversalFunctions.cfg
$universalFunctions

########################################################################
x=1

#Clears Screen
clear

# Gets info about distro
# This is located in the f_distoCheck.cfg file b
completeDistroCheck

# Displays some guesses/info about the distro pre-menus
mainDisplayDistroInfo


while [ $x=1 ]; do

    echo -e "${bold}Xmetal's Linux Scripts ${normal} \n"

    echo -e   "1. \t Update your System"
    echo -e   "2. \t Install Software"

    echo -e   "3. \t Arch-based"
    echo -e   "4. \t Fedora"
    echo -e   "5. \t OpenSUSE"
    echo -e   "6. \t Ubuntu based"
    echo -e   "7. \t Solus"

    echo -e   "T. \t Tests Menus - (not for regular users)"

    echo -e   "q. \t Exit to Prompt \n\n"
    read -p   "Your Choice?:" mainSelection

    case $mainSelection in

      1) universalUpgrade ;;

        ## Located in /linuxSetup/tasks/functions/universal/menus/f_universal_menus.cfg
      2) universalSoftwareMenu ;;

      3) bash  "$scriptsDir"/archLinuxScripts.sh ;;
      4) bash  "$scriptsDir"/fedoraScripts.sh  ;;
      5) bash  "$scriptsDir"/openSuseScripts.sh  ;;
      6) bash  "$scriptsDir"/ubuntuScripts.sh  ;;
      7) bash  "$scriptsDir"/solusScripts.sh ;;

      [tT]) bash "$rootdir"/tests.sh ;; 

  
      [qQ]) quitScript  ;;

      * ) invalidSection ;;

      esac
done
