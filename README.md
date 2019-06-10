# rpmcontent
2 scripts. 1st compare content of 2 rpm packages, 2nd installed software to rpm package.

== Scrpit compares content of 2 rpm packages.==
Script cmprpm.sh

1) one can either look into comparison.txt which is diff output or
2) into files presentinboth.txt (showing file present in both packages) and not presentinboth.txt (showing files not present in any of the package). Lines left justified presents files present only in first package, lines starting with indentation present only files present in 2nd package)
3) assumption is packages to be compared are in 2 different subdirectories of current directory
4) script should be invoked with two parameters which are the subdirectories where the packages are located.

== Compare installed software to package content ==
Script cmprpmsf.sh

1) Script 2 comapres the content of rpm with already installes software.  
2)As for script above parameters are 2 directories, however
It is assumed:
directory_nr1 is the directory of current instalation
directory_nr2 is the directory where package is dowloaded  
3) Results are organized the same way as in script above
