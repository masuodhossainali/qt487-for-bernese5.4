# qt487-for-bernese5.4
This repository helps you install qt4.8.7 on  a recent release of Ubuntu in an isolated folder. Installation of qt4 is essential for 
the users of the Bernese software on linux since Bernese 5. Compilation of Qt4.8.7 on new releases of Ubuntu (Ubuntu 24.04 LTS) is a
challenging process because it requires old versions of many dependent software including openSSL. To successfuly install qt4(.8.7) 
on Ubuntu 24.04 LTS, a dockerized solution is suggested here. This solution creates a provate folder to qt4(.8.7) and keeps it safe
from possible system upgrades.
You  need a licenced copy of the Bernese software on your machine
The installation steps includes:
1- build the the docker image using the Docker file in this repository. Please yse the build.sh script  for this purpose. 

2-Use the following command in order to isolate the directory /opt/qt.4.8.7 and protect it from system upgrads

3-Add the following environmental variable to .bashrc

4-Install the Bernese software using setup.sh file provided to the uers of this software by the Bernese team. The directory for the
qt software is now the guarded folder /opt/qt.4.8.7

5- Open terminal and run the menu system.





