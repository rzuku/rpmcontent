#!/bin/bash
 if (($#<"2"));
 then
 echo "
 Execution:
          $0 directory_nr1 directory_nr2
 
 
 WARNING:
 It is assumed:
     directory_nr1 is the directory of current instalation
     directory_nr2 is the directory where package is dowloaded
 "
 exit
 fi
 
 #$1 current directory of installation
 cd $1
 find `pwd`/ -name '*' -exec ls -la {} \; |grep -v ^d |grep \/ | awk '{ print $9, $5, $6, $7, $8 }' |awk -F "/" '{print $NF}'  |sort>$HOME/installed.txt
 
 #$2 directory where rpm not installed exists
 cd $2
 gunzip *.gz
 tar xvf *.tar
 #rpm -qp -vv --list RPMS/noarch/*.rpm |grep -v ^d |awk '{print $8, $4, $5, $6, $7}' |awk -F "/" '{print $NF}' |sort >$HOME/package.txt
 rpm -qp -vv --list RPMS/noarch/*.rpm |grep -v ^d |awk '{print $NF, $(NF-4), $(NF-3), $(NF-2), $(NF-1)}' |awk -F "/" '{print $NF}' |sort  >$HOME/package.txt
 
 cd
 
 echo "Comapring installed.txt(left) & package.txt(right)"
 diff installed.txt package.txt >comparison.txt
 
 join -a 1 installed.txt package.txt >allfromdir1.txt
 join -a 2 installed.txt package.txt >allfromdir2.txt
 comm -12 allfromdir1.txt allfromdir2.txt >presentinboth.txt
 comm -3 allfromdir1.txt allfromdir2.txt >notpresentinboth.txt
