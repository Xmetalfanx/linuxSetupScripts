function universalSoftwareFunction
{

	x=1

	clear

	while [[ $x=1 ]]; do

			echo -e   "Please Select Task \n"

			echo -e   "\v1. \t Adds Common Software (Ones I always Add) "
			echo -e   "\v2. \t [Sub-Menu] Web Browsers  "


			echo -e  "\v m. \tReturn to Main Menu"
			echo -e	"q. \tExit to Prompt \n\n"

			read -p "Your Choice?: " ubuntuSelection

			case $ubuntuSelection in

			  1) 
				 x=1	;;

			  2) browserMenu
				 x=1 ;;


			[aA]) 
				x=1
				;;

			
			[mM]) clear 
				  exit
				  ;;

			[qQ]) quitScript ;;

			* ) invalidSection ;;

			esac

	done


}

