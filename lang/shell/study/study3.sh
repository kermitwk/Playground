#!/bin/bash

# system_page - A script to produce an system information HTML file

##### Constants

TITLE="System Information for $HOSTNAME"
RIGHT_NOW=$(date +"%x %r %Z")
TIME_STAMP="Updated on $RIGHT_NOW by $USER"

##### Functions

function divider {
    echo "divider"
}

function system_info {
    echo "system info"
    $(divider)
}


function show_uptime {
    echo "show uptime"
    uptime
    $(divider)
}


function drive_space {
    echo "drive space"
    df
    $(divider)
}


function home_space {
    echo "home space"
    du -s /home | sort -nr
    $(divider)
}

##### Main

cat <<- _EOF_
<html>
    <head>
        <title>$TITLE</title>
    </head>

    <body>
        <h1>$TITLE</h1>
        <p>$TIME_STAMP</p>
        $(system_info)
        $(show_uptime)
        $(drive_space)
        $(home_space)
    </body>
</html>
_EOF_







