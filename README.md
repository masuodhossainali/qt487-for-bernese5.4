# qt487-for-bernese5.4
This repository helps you install qt4.8.7 on  a recent release of Ubuntu in an isolated folder. Installation of qt4 is essential for 
the users of the Bernese software on linux since Bernese 5. Compilation of Qt4.8.7 on new releases of Ubuntu (Ubuntu 24.04 LTS) is a
challenging process because it requires old versions of many dependent software including openSSL. To successfuly install qt4(.8.7) 
on Ubuntu 24.04 LTS, a dockerized solution is suggested here. This solution creates a private folder to qt4(.8.7) and keeps it safe
from possible system upgrades.
You  need a licenced copy of the Bernese software on your machine
The installation steps includes:


1- build the the docker image using the Docker file in this repository. Please use the build.sh script  for this purpose. 
$bash build.sh


2-Use the following command in order to isolate the directory /opt/qt.4.8.7 and protect it from system upgrads
$sudo chattr +i /opt/qt4.8.7


3-Add the following environmental variable to .bashrc
$export QTDIR=/opt/qt4.8.7

$export PATH=$QTDIR/bin:$PATH

$export LD_LIBRARY_PATH=$QTDIR/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}

$export QT_PLUGIN_PATH=$QTDIR/plugins


4-Install the Bernese software using setup.sh provided to the users of this software by the Bernese team. The directory for the qt software is now the guarded folder /opt/qt.4.8.7


5- Open terminal and run the menu system.
$G

installing the Bernese software normally (not from a container) helps you keep the Bernese data structure and you do not need any shared folder betwwen the container in which the Bernese is running a nd your OS hosting the GNSS data. The container and image do not include a copy of Bernese and therefore no need for the copyright when you hare your docker image with others.






