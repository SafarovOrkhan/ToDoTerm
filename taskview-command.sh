#!/bin/bash
#sourcepath


todayday=$(date +%d)
todaymo=$(date +%m)
todayye=$(date +%y)

tomday=$(date +%d -d "1 day")
tommo=$(date +%m -d "1 day")
tomye=$(date +%y -d "1 day")
echo "  "
if [ $1 == "today" ];
then
        echo "--------------- "${todayye}"/"${todaymo}"/"${todayday}" ---------------"
        cat -n ${sourcepath}ToDoTerm/Database/"${todayye}"/"${todaymo}"/"${todayday}"
elif [ $1 == "tomorrow" ];
then
        echo "--------------- "${tomye}"/"${tommo}"/"${tomday}" ---------------"
        cat -n ${sourcepath}ToDoTerm/Database/"${tomye}"/"${tommo}"/"${tomday}"
elif [ $1 == "--help" ]
then
        cat ${sourcepath}ToDoTerm/taskview-help
        exit 0
else
        echo "--------------- $1 ---------------"
        cat -n ${sourcepath}ToDoTerm/Database/$1
fi
echo "----------------------------------------"
echo "done   [lineNumber]  -- toggle check on desired task"
echo "undone [lineNumber]  -- toggle uncheck on desired task"
echo "remove [lineNumber]  -- remove desired task"
echo "exit   [lineNumber]  -- exit from Task-View"
echo -n "choose an option : "
read command argument

if [ $command == "done" ];
then
        if [ $1 == "today" ];
        then
                sed -e ${argument}s/"[_]"/x/g ${sourcepath}ToDoTerm/Database/"${todayye}"/"${todaymo}"/"${todayday}" > ${sourcepath}ToDoTerm/tmpfile
                cat ${sourcepath}ToDoTerm/tmpfile > ${sourcepath}ToDoTerm/Database/"${todayye}"/"${todaymo}"/"${todayday}"
                echo "task No: $argument \"Completed\""
        elif [ $1 == "tomorrow" ]
        then
                sed -e ${argument}s/"[_]"/x/g ${sourcepath}ToDoTerm/Database/"${tomye}"/"${tommo}"/"${tomday}" > ${sourcepath}ToDoTerm/tmpfile
                cat ${sourcepath}ToDoTerm/tmpfile > ${sourcepath}ToDoTerm/Database/"${tomye}"/"${tommo}"/"${tomday}"
                echo "task No: $argument \"Completed\""

        else
                sed -e ${argument}s/"[_]"/x/g ${sourcepath}ToDoTerm/Database/$1 > ${sourcepath}ToDoTerm/tmpfile
                cat ${sourcepath}ToDoTerm/tmpfile > ${sourcepath}ToDoTerm/Database/$1
                echo "task No: $argument \"Completed\""
        fi
elif [ $command == "undone" ];
then
        if [ $1 == "today" ];
        then
                sed -e ${argument}s/[x]/_/g ${sourcepath}ToDoTerm/Database/"${todayye}"/"${todaymo}"/"${todayday}" > ${sourcepath}ToDoTerm/tmpfile
                cat ${sourcepath}ToDoTerm/tmpfile > ${sourcepath}ToDoTerm/Database/"${todayye}"/"${todaymo}"/"${todayday}"
                echo "task No: $argument \"Active\""
        elif [ $1 == "tomorrow" ]
        then
                sed -e ${argument}s/[x]/_/g ${sourcepath}ToDoTerm/Database/"${tomye}"/"${tommo}"/"${tomday}" > ${sourcepath}ToDoTerm/tmpfile
                cat ${sourcepath}ToDoTerm/tmpfile > ${sourcepath}ToDoTerm/Database/"${tomye}"/"${tommo}"/"${tomday}"
                echo "task No: $argument \"Active\""
        else
                sed -e ${argument}s/[x]/_/g ${sourcepath}ToDoTerm/Database/$1 > ${sourcepath}ToDoTerm/tmpfile
                cat ${sourcepath}ToDoTerm/tmpfile > ${sourcepath}ToDoTerm/Database/$1
                echo "task No: $argument \"Active\""
        fi
elif [ $command == "remove" ];
then
        if [ $1 == "today" ];
        then
                sed -e ${argument}d ${sourcepath}ToDoTerm/Database/"${todayye}"/"${todaymo}"/"${todayday}" > ${sourcepath}ToDoTerm/tmpfile
                cat ${sourcepath}ToDoTerm/tmpfile > ${sourcepath}ToDoTerm/Database/"${todayye}"/"${todaymo}"/"${todayday}"
                echo "task No: $argument removed"
        elif [ $1 == "tomorrow" ]
        then
                sed -e ${argument}d ${sourcepath}ToDoTerm/Database/"${tomye}"/"${tommo}"/"${tomday}" > ${sourcepath}ToDoTerm/tmpfile
                cat ${sourcepath}ToDoTerm/tmpfile > ${sourcepath}ToDoTerm/Database/"${tomye}"/"${tommo}"/"${tomday}"
                echo "task No: $argument removed"
        else

                sed -e ${argument}d ${sourcepath}ToDoTerm/Database/$1 > ${sourcepath}ToDoTerm/tmpfile
                cat ${sourcepath}ToDoTerm/tmpfile > ${sourcepath}ToDoTerm/Database/$1
                echo "task No: $argument is removed"
        fi
elif [ $command == "exit" ];
then
        echo "exiting from Task-View panel"
        sleep 2
else
        echo "wrong command exiting..."
        sleep 2
fi

echo "   "
