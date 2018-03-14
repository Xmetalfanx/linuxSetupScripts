readonly dir=$(eval pwd)
readonly functionsdir=$(eval pwd)/tasks/functions/

. $functionsdir/includeUniversalFunctions.cfg
. $functionsdir/f_common.cfg
. $functionsdir/f_packageDetection.cfg

# Gets info about distro
# This is located in the f_distoCheck.cfg file
completeDistroCheck

###################################################################
function ubuntuPackageSearch
{
  installedValue=$(sudo apt-cache policy mpv | grep Installed | sed 's/^.*Installed://g;s/\s//g')

  if [ $installedValue == '(none)' ]; then
    echo "Package does NOT exists"
  else
    echo "Package exists"
  fi
}

function getGitName
{
  url="https://github.com/linuxmint/mint-y-icons.git"
  packageName=${url/*\//}

  clear
  echo -e "URL Name is: $url"
  echo -e "PackageName is: $packageName"
  echo
}

clear
while [ $x=1 ]; do

    echo -e   "1. \t Test - Fedora test if a pacakge is installed"
    echo -e   "2. \t Test - get Plasma info"
    echo -e   "3. \t Test - Univeral Install usefulApps function"
    echo -e   "4. \t Test - get name of github repo"
    echo -e   "5. \t Test - checkPackage VLC"
    echo -e   "6. \t Test - checkPackage xmetal (known this couldn't ever be true) "
    echo -e   "7. \t Test - checkPackage firefox"
    echo -e   '8. \t Test - Detect GTK 3 version with universal function (vs old inxi way)'

    echo -e   "q. \t Exit to Prompt \n\n"
    read -p   "Your Choice?:" testsSelection

    case $testsSelection in

      1) detectPackageStatus hexchat
          x=1 ;;

      2) getPlasmaInfo
        clear
        echo "KDE Desktop Version: $plasmaDEVersion"
        echo "KDE Framework Version: $plasmaFrameworkVersion"
          x=1 ;;

      3) massInstallUsefulApps
         x=1 ;;

      4) getGitName
        x=1 ;;

      5) checkPackage vlc
        x=1 ;;

      6) checkPackage xmetal
        x=1 ;;

      7) checkPackage firefox
        x=1 ;; 

      8) checkPackage libgtk-3-0
        x=1 ;;

      [qQ]) quitScript  ;;

      * ) invalidSection ;;

      esac
done
