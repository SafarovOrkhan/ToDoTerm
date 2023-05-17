#!/bin/bash
#sourcepath:


todayday=$(date +%d)
todaymo=$(date +%m)
todayye=$(date +%y)

tomday=$(date +%d -d "1 day")
tommo=$(date +%m -d "1 day")
tomye=$(date +%y -d "1 day")

if [[ $1 == "today" || $1 == "tomorrow" ]];
then
        if [ $1 == "today" ];
        then
                if [ -f ${sourcepath}ToDoTerm/Database/"${todayye}"/"${todaymo}"/"${todayday}" ];
                then
                        echo "[_] - $2" >> ${sourcepath}ToDoTerm/Database/"${todayye}"/"${todaymo}"/"${todayday}"
                        echo "Task added to ${todayye}/${todaymo}/${todayday}"
                else
                        mkdir -p ${sourcepath}ToDoTerm/Database/"${todayye}"/"${todaymo}"/"${todayday}"
                        rm -rf ${sourcepath}ToDoTerm/Database/"${todayye}"/"${todaymo}"/"${todayday}"
                        touch ${sourcepath}ToDoTerm/Database/"${todayye}"/"${todaymo}"/"${todayday}"
                        echo "[_] - $2" >> ${sourcepath}ToDoTerm/Database/"${todayye}"/"${todaymo}"/"${todayday}"
                        echo "Task added to ${todayye}/${todaymo}/${todayday}"
                fi
        elif [ $1 == "tomorrow" ];
        then
                if [ -f ${sourcepath}ToDoTerm/Database/"${tomye}"/"${tommo}"/"${tomday}" ];
                then
                        echo "[_] - $2" >> ${sourcepath}ToDoTerm/Database/"${tomye}"/"${tommo}"/"${tomday}"
                        echo "Task added to ${tomye}/${tommo}/${tomday}"
                else
                        mkdir -p ${sourcepath}ToDoTerm/Database/"${tomye}"/"${tommo}"/"${tomday}"
                        rm -rf ${sourcepath}ToDoTerm/Database/"${tomye}"/"${tommo}"/"${tomday}"
                        touch ${sourcepath}ToDoTerm/Database/"${tomye}"/"${tommo}"/"${tomday}"
                        echo "[_] - $2" >> ${sourcepath}ToDoTerm/Database/"${tomye}"/"${tommo}"/"${tomday}"
                        echo "Task added to ${tomye}/${tommo}/${tomday}"
                fi
        fi
else
        if [ -f ${sourcepath}ToDoTerm/Database/$1 ];
        then
                echo "[_] - $2" >> ${sourcepath}ToDoTerm/Database/$1
                echo "Task added to $1"
        else
                mkdir -p ${sourcepath}ToDoTerm/Database/$1
                rm -rf ${sourcepath}ToDoTerm/Database/$1
                touch ${sourcepath}ToDoTerm/Database/$1
                echo "[_] - $2" >> ${sourcepath}ToDoTerm/Database/$1
                echo "Task added to $1"
        fi
fi
