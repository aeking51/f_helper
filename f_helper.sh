clear



permission_adder () {

	echo "Enter Folder or File name with extension : "

	read file

	echo "  "

	echo "Current file Permissions :"

	ls -l $file

	echo "  "

	echo "Which class permision you like to change ? [ owner / group / others / all ]"

	read class

	if [ $class == "owner" ]

	then

		echo "Which permision like to add for owner ? [ read - r / write - w / execute - x ]"

		read p

		chmod u+$p $file

	elif [ $class == "group" ]

	then

		echo "Which permision like to add for group ? [ read - r / write - w / execute - x ]"

		read p

		chmod g+$p $file

	elif [ $class == "others" ]

	then

		echo "Which permision like to add for others ? [ read - r / write - w / execute - x ]"

		read p

		chmod o+$p $file

	elif [ $class == "all" ]

	then

		echo "Which permision like to add for all ? [ read - r / write - w / execute - x ]"

		read p

		chmod a+$p $file

	else

		echo "Wrong Input, PLEASE WRITE THE APPROPRIATE LETTER !"

	fi

	echo "   "

	echo "Updated file Permissions :"

	ls -l $file	

}



permission_remover () {

	echo "Enter Folder or File name with extension : "

	read file

	echo "  "

	echo "Current file Permissions :"

	ls -l $file

	echo "  " 

	echo "Which class permision you like to change ? [ owner / group / others / all ]"

	read class

	if [ $class == "owner" ]

	then

		echo "Which permision like to remove for owner ? [ read - r / write - w / execute - x ]"

		read p

		chmod u-$p $file

	elif [ $class == "group" ]

	then

		echo "Which permision like to remove for group ? [ read - r / write - w / execute - x ]"

		read p

		chmod g-$p $file

	elif [ $class == "others" ]

	then

		echo "Which permision like to remove for others ? [ read - r / write - w / execute - x ]"

		read p

		chmod o-$p $file

	elif [ $class == "all" ]

	then

		echo "Which permision like to remove for all ? [ read - r / write - w / execute - x ]"

		read p

		chmod a-$p $file

	else

		echo "Wrong Input, PLEASE WRITE THE APPROPRIATE LETTER !"

	fi

	echo "  "

	echo "Updated file Permissions :"

	ls -l $file	

}



echo -e "\e[1;36m##################################################################\e[0m"

echo "#                                                                #"

echo -e "#   \e[1;31m                   <<<< F HELPER >>>>                       \e[0m #"

echo "#                                                                #"

echo -e "\e[1;36m##################################################################\e[0m"

current_date_time=$(date)

echo -e "\e[1;33mCurrent date and time: $current_date_time\e[0m"

echo -e "\e[1;30m# \e[1;32mHELLO $USER , CHOOSE YOUR OPTION\e[0m"

echo "1) Show System Status"

echo "2) Show all Files Including Hidden Files"

echo "3) Show all Directories"

echo "4) Current Directory Path "

echo "5) Create a File "

echo "6) View a File"

echo "7) Edit a File"

echo "8) Merge Two text files"

echo "9) Delete File or Folder "

echo "10) Create Zip file"

echo "11) Unzip file"

echo "12) Create Tar file"

echo "13) View Tar File Contents without Extracting"

echo "14) Extract Tar"

echo "15) Permissions Adder"

echo "16) Permissions Remover"

echo "17) Network Status"

echo "18) OS Details"

echo "aa) About"

echo "00) Exit"

echo -n -e "\e[1;37mEnter your menu choice : \e[0m"

while :

do



# reading choice

read choice



# case statement is used to compare one value with the multiple cases.

case $choice in

	1)	echo -e "\e[1;37mHint: To Exit, CTRL+C \e[0m"

		top;;

	2)	echo " "

		echo -e "\e[1;37mPermission No. User Group    Size Created Created Name \e[0m"

		echo -e "\e[1;37m           of                       Date    Time       \e[0m"

		echo -e "\e[1;37m           Files                                       \e[0m"

		echo -e "\e[1;37m--------------------------------------------------------------------\e[0m "

		ls -la;;

	3)	echo " "

		echo -e "\e[1;37mAll Directories\e[0m"

		ls -d */;;

	4)	echo " "   

		current_dir=$(pwd)

		echo "Current working directory: $current_dir";;

	5)	echo " "

		echo "Enter the name of the file with extension: "

		read fi_a

		touch $fi_a;;

	6)	echo " "

		echo "Enter the name of the file with extension: "

		read fi_b

		echo " "

		cat $fi_b;;

	7)	echo " "

		echo "Enter the name of the file with extension: "

		read fi_c

		nano $fi_c;;

	8)	echo " "

		echo "Enter the name of the first file to merge : "

		read fi_m1

		echo "Enter the name of the second file to merge : "

		read fi_m2

		echo "Enter the name to be written merged file : "

		read merge_fi

		cat  $fi_m1 $fi_m2 > $merge_fi;;

	9)	echo " "

		echo "Enter the name of the file or folder: "

		read fi_d

		rm -r $fi_d;;

	10)	echo " "

		echo "Enter the name of the file or folder : "

		read ff1

		echo "Enter the name of the second file or folder if any: "

		read ff2

		echo "Enter the name of the third file or folder if any: "

		read ff3

		echo "Enter the name to be written zipped file : "

		read zip_name

		echo "Does you need encryption with password on zip [yes/no] : "

		read enc

		echo "Enter Compression Level [0 to 9] : "

		read comp

		if [ $enc == "yes" ]

		then

			zip -e -$comp $zip_name $ff1 $ff2 $ff3

		else 

			zip -$comp $zip_name $ff1 $ff2 $ff3

		fi;;

	11)	echo " "

		echo "Enter the name of the zip file with extension : "

		read zip

		unzip $zip;;

	12)	echo " "

		echo "Enter the name of the Tar file with extension : "

		read tarname12

		

		echo "[ 1) To convert all files to tar in current directory]"

		echo "[ 2) To convert all files to tar in a specified folder path like /home/downloads]"

		echo "[ 3) To convert a group of common extension files in current directory like .c to convert all c files to tar]"

		echo "[ 4) To convert a file to tar]"

		echo "Enter the file options : "

		read t_locn

		if [ $t_locn == 1 ]

		then

			tar -cvf $tarname *

		elif [ $t_locn == 2 ]

		then 

			echo "Specify a folder target path : "

			read path

			tar -cvf $tarname $path

		elif [ $t_locn == 3 ]

		then

			echo "Specify a file extension : "

			read ext

			tar -cvf $tarname *$ext

		elif [ $t_locn == 4 ]

		then

			echo "Specify a file name with extension : "

			read filename

			tar -cvf $tarname $filename

		else

			echo "Invalid"

		fi;;

	13)	echo " "

		echo "Enter the name of the tar file with extension: "

		read view_tar

		tar -tf $view_tar;;

	14)	echo " "

		echo "Enter the name of the tar file with extension: "

		read extar

		tar -xvf $extar;;

	15)	permission_adder ;;

	16)	permission_remover ;;

	17)	echo -e "\e[1;37mHint: To Exit, CTRL+C \e[0m"	

		echo "System's Network Interface"

		ifconfig

		netstat;;

	18)	echo "-------------  OS Details  ----------------"	

		hostnamectl;;

	aa)	echo " "

		echo " "

		echo -e "      \e[1;31m                   <<<< F HELPER >>>>                       \e[0m     "

		echo " Objective : this tool is created for the users that dont have any knowledge of "

		echo "             linux command line or terminal.you can operate the basic neccessary "

		echo "             need with terminal in this tool"

		echo " Used Tools / Prquesties :  ls, top, pwd, touch, cat, nano editor, rm, zip & unzip, tar, chmod, ifconfig, netstat, hostnamectl"

		echo " This project is created by polytechnic students as a part of Open Ended Project"

		echo " ";;

	00)	echo "Quitting ..."

		echo " "

		echo -e "||||||||||     Thanks for Using \e[1;31mF HELPER\e[0m  ||||||||||||"

		exit;;

	*)	echo "Invalid option,Enter a Valid Choice !";;

  

esac

	echo " "

	echo -e "\e[1;33m##################################################################\e[0m"

	echo -e "\e[1;30m# \e[1;32mHELLO $USER , CHOOSE YOUR OPTION\e[0m"

	echo "1) Show System Status"

	echo "2) Show all Files Including Hidden Files"

	echo "3) Show all Directories with Path "

	echo "4) Current Directory Path "

	echo "5) Create a File "

	echo "6) View a File "

	echo "7) Edit a File"

	echo "8) Merge Two text files"

	echo "9) Delete File or Folder "

	echo "10) Create Zip file"

	echo "11) Unzip File"

	echo "12) Create Tar file"

	echo "13) View Tar File Contents without Extracting"

	echo "14) Extract Tar"

	echo "15) Permissions Adder"

	echo "16) Permissions Remover"

	echo "17) Network Status"

	echo "18) OS Details"

	echo "aa) About"

	echo "00) Exit"

	echo -n  -e "\e[1;37mEnter your menu choice : \e[0m"

done

