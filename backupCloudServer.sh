#!/bin/bash
#Purpose = Backup of Important Data
#Created on July 03, 2012
#Author = Aaron Zhang
#Version 1.0
#START
TIME=`date +%Y%m%d-%H%m-%s`           # This Command will add date in Backup File Name.
FILENAME=ABC-DEF-$TIME.tar.gz    # Here i define Backup file name format.
SRCDIR=/opt/ABC-DEF        # Location of Important Data Directory (Source of backup).
DESDIR=/tmp                     # Destination of backup file.
tar -cpzf $DESDIR/$FILENAME $SRCDIR

#END
