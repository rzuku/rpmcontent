# rpmcontent
2 scripts. 1st compare content of 2 rpm packages, 2nd installed software to rpm package.

== Scrpit compares content of 2 rpm packages.==  
Script cmprpm.sh

1) Assumption is packages to be compared are in 2 different subdirectories of current directory
2) Script should be invoked with two parameters which are the subdirectories mentioned above
3) the packages are in gzip format,  
Results are described below.


== Compare installed software to package content ==  
Script cmprpmsf.sh

1) Script 2 compares the content of rpm with already installed software.  
As for script above parameters are 2 directories, however
It is assumed:
directory_nr1 is the directory of current instalation
directory_nr2 is the directory where package is dowloaded  
3) Results are organized the same way as in script above and are described below



== Results of the scripts ==  
1) The results are presented in 3 files: comparison.txt, presentinboth.txt, notpresentinboth.txt  
File comparison.txt is just the result of diff command executed on both packages content  
File presentinboth.txt shows files present in both packages  
File notpresentinboth.txt shows files not present in any of the package. Lines left justified presents files present only in 1st package (or installation in terms of cmprpmssf.sh), lines starting with indentation present files only present in 2nd package.
