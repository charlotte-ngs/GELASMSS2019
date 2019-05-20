#!/bin/bash
### 
### 
### 
###   Purpose:   Copy Old Exam Material
###   started:   2019-05-19 (pvr)
###
### ########################################### ###

### # define constants
PROJDIR=/Users/peter/Data/Projects/GitHub/charlotte-ngs/GELASMSS2019_gh-root/master/GELASMSS2019
SRCDIR=../../../GELASMFS2018/master/GELASMFS2018/exam


### # cd to PROJDIR
cd $PROJDIR
pwd

### # target for solution
TRGSOLDIR=sol/w14

### # loop to copy files in solution material 
if [ ! -d "$TRGSOLDIR" ];then echo "Create $TRGSOLDIR ...";mkdir -p $TRGSOLDIR;fi
ls -1 $SRCDIR/*sol.Rmd | while read f;do echo "Copy $f to $TRGSOLDIR ...";cp $f $TRGSOLDIR;done

### # copy directories to solution target
for d in odg png tex;do echo "Copy $d to $TRGSOLDIR ...";cp -r $SRCDIR/$d $TRGSOLDIR;done


### # target for exercises
TRGEXDIR=ex/w14
if [ ! -d "$TRGEXDIR" ];then echo "Create $TRGEXDIR ...";mkdir -p $TRGEXDIR;fi
ls -1 $SRCDIR/*tsk.Rmd | while read f;do echo "Copy $f to $TRGEXDIR ...";cp $f $TRGEXDIR;done

### # copy directories to solution target
for d in odg png tex;do echo "Copy $d to $TRGEXDIR ...";cp -r $SRCDIR/$d $TRGEXDIR;done


