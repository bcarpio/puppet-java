# Java #

Manage the Java runtime for use with other application software.

As you know Oracle has changed the 'Operating System Distributor License' which means many Linux distributions can no longer distribute java as a package.

This puppet mdoule was created in an effort to allow system administrators to deploy java to /opt or /usr/local. Its all paramaterized so have fun. 

# Configuration #

* Edit the ~/manifests/params.pp file and change the $java_base and $java_version to suit your needs. 
* When you download a new version of java place it into the ~/files/ directory. NOTE: You must also rename the .tar.gz file to simply jdk<version>.tar.gz

# Author #

* Brian Carpio
* http://www.thetek.net
* http://www.linkedin.com/in/briancarpio
