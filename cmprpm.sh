 #!/bin/bash
 #assumption is packages to be compared are in 2 different subdirectories of current directory
 #$1  directory of package #1
 if (($#<"2"));
 then
 echo "
 Execution:
         $0 directory_nr1 directory_nr2
 
 
 WARNING:
 It is assumed the packages are located in 2 provided directories of currenr directory
 "
 exit
 fi
 
 cd $1
 gunzip *.gz
 tar xvf *.tar
 cd ..
 cd `find $1 -name "*.rpm" |xargs dirname`
 #cd RPMS/noarch
 #rpm -qp -vv --list *.rpm |grep -v ^d |awk '{print $8, $4, $5, $6, $7}'|awk -F "/" '{print $NF}' |sort >../../../package1.txt
 rpm -qp -vv --list *.rpm |grep -v ^d |awk '{print $NF, $(NF-4), $(NF-3), $(NF-2), $(NF-1)}'|awk -F "/" '{print $NF}' |sort >../../../package1.txt
 cd ../../..
 
 #$2 directory of packge#2
 cd $2
 gunzip *.gz
 tar xvf *.tar
 cd ..
 cd `find $2 -name "*.rpm" |xargs dirname`
 #cd RPMS/noarch
 #rpm -qp -vv --list *.rpm |grep -v ^d |awk '{print $8, $4, $5, $6, $7 }' |awk -F "/" '{print $NF}' |sort >../../../package2.txt
 rpm -qp -vv --list *.rpm |grep -v ^d |awk '{print $NF, $(NF-4), $(NF-3), $(NF-2), $(NF-1)}' |awk -F "/" '{print $NF}' |sort >../../../package2.txt
 cd ../../..
 
 echo "******Comapring $1 directory package(left) & $2 directory package(right)******"
 echo "Left $1 directory package & right $2 directory package">comparison.txt
 #Presentinbothprints files presents in both packages. notpresentinboth.txt prints packages not present in any file
 diff package1.txt package2.txt >>comparison.txt
 join -a 1 package1.txt package2.txt >allfromdir1.txt
 join -a 2 package1.txt package2.txt >allfromdir2.txt
 comm -12 allfromdir1.txt allfromdir2.txt >presentinboth.txt
 comm -3 allfromdir1.txt allfromdir2.txt >notpresentinboth.txt

