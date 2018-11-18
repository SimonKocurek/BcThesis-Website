#!/bin/bash
cd "$(dirname "$0")"

start_backend() {
    for pid in $(ps aux | grep node | tr -s ' ' | cut -d ' ' -f 2)
    do
        kill -9 $pid
    done

    echo "Starting backend..."
    ./backend/start.sh &
}

build_frontend() {
    echo "Building frontend..."
    ./frontend/build.sh
    rm -r backend/target
    mv frontend/target backend
}

folder_content() {
    for file in $(find -L $1 -maxdepth 1 -type f)
    do
        cat $file
    done
}

listen_to_file_changes() {
    echo "Listening to frontend changes..."
    chsum1=""

    while [[ true ]]
    do
        chsum2=$(folder_content "frontend" | md5sum)
        if [[ $chsum1 != $chsum2 ]]
        then
            build_frontend
            chsum1=$chsum2
        fi
        sleep 2
    done
}

start_backend
build_frontend

if [ "$1" = "-d" ]
then
    explorer http://localhost:5402
    listen_to_file_changes
fi
