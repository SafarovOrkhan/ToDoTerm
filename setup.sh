

echo "write absolute path to move this application (IMPORTANT: please include \"/\" at the end of path)"
echo -n "Location : "
read location

currentpath=$0
currentpathofmain=$(dirname "$(realpath -e "$0")")

sed -i "3i\sourcepath=${location}" "$currentpathofmain/taskadd-command.sh"

sed -i "3i\sourcepath=${location}" "$currentpathofmain/taskview-command.sh"

echo -n "User Owner Application: "
read userowner

echo -n "Group Owner Application: "
read groupowner


#Aliases

echo -n "Do you want to create Aliases ?  (y/n): "
read answer

if [ $answer == "y" ];
then
        echo "#Aliases for ToDoTerm Application" >> /etc/profile
        echo "alias taskview=\"${location}ToDoTerm/taskview-command.sh\"" >> /etc/profile
        echo "alias taskadd=\"${location}ToDoTerm/taskadd-command.sh\"" >> /etc/profile
        source /etc/profile
else
        echo "because of \"No\" answer you will have to use original Script names inside ToDoTerm Directory"
fi

chown -R $userowner:$groupowner $currentpathofmain
chmod -R 550 $currentpathofmain
chmod -R 770 $currentpathofmain/Database
chmod 660 $currentpathofmain/tmpfile
mv $currentpathofmain $location
echo "Installed !"
echo " "
echo "command --help    to check detailed info"
echo " "
