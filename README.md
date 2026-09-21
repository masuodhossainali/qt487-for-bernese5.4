This repository provides a solution for installing Qt 4.8.7 on recent Ubuntu releases within an isolated environment. Installing Qt 4 is essential for users of the Bernese GNSS software (version 5.x and later) on Linux. However, compiling Qt 4.8.7 on modern distributions like Ubuntu 24.04 LTS is challenging due to dependencies on legacy libraries, such as older versions of OpenSSL.

To successfully install Qt 4.8.7 on Ubuntu 24.04 LTS, this repository suggests a containerized approach. This method creates a protected directory for Qt 4.8.7, safeguarding it from potential system upgrades that might break compatibility.

**Prerequisites:**

You must have a licensed copy of the Bernese software for instalation on your machine.

**Installation Steps**

Build the Docker image using the Dockerfile provided in this repository. Please use the included build.sh script for this purpose:

bash
bash build.sh

**Protect the installation directory:** 

Use the following command to make the /opt/qt4.8.7 directory immutable, protecting it from accidental modification or system upgrades:

bash
sudo chattr +i /opt/qt4.8.7

**Configure environment variables:**

Add the following lines to your ~/.bashrc file to ensure the system can locate the Qt libraries:

bash
export QTDIR=/opt/qt4.8.7
export PATH=$QTDIR/bin:$PATH
export LD_LIBRARY_PATH=$QTDIR/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
export QT_PLUGIN_PATH=$QTDIR/plugins
After editing .bashrc, remember to run source ~/.bashrc or restart your terminal.

**Install the Bernese software:**

Run the setup.sh script provided by the Bernese team. When prompted for the Qt software directory, specify the protected folder: /opt/qt4.8.7.

**Launch the application:**

Open a terminal and run the Bernese menu system:

bash
G
Notes on Architecture and Licensing
Installing the Bernese software directly on the host system (rather than inside the container) preserves the standard Bernese data structure. Consequently, there is no need to configure shared folders between the container and the host OS for GNSS data.

Furthermore, constructed Docker image does not contain a copy of the Bernese software. Therefore, sharing this Docker image with others does not violate Bernese copyright restrictions, as it only contains the open-source Qt dependencies and build tools.




