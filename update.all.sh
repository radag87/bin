#!/bin/sh

update()
{
    if [ -e $1/.svn ]
    then
        echo "Updating $1..."
        cmd="svn update $1"
        if [[ -n $SVNUSER ]];then
            cmd="$cmd --username $SVNUSER"
        fi
        if [[ -n $SVNPASS ]];then
            cmd="$cmd --password $SVNPASS"
        fi
        cmd="$cmd --no-auth-cache"
        cmd="$cmd --non-interactive"
        cmd="$cmd --trust-server-cert"
        echo $cmd
        $cmd
        rc=$?
    else
        rc=0
    fi
    if [[ $rc -ne 0 ]];then
        echo "Error updating $1"
        exit 1
    fi
}

update ~/Documents/NMG_One
update ~/Documents/ILINK
update ~/Documents/APPMAND
update ~/Documents/CMOS
exit 0
