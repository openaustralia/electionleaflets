** Setup instructions **

The electionleaflets folder has to be hosted on an Apache http server.
The includes, includes/PEAR and config folders must be added to the php include_path variable which can be set in an Apache .htaccess file eg. https://groups.google.com/d/topic/openaustralia-dev/fg1dENEjm18/discussion
The timezone must also be set as a PHP variable eg.
php_value date.timezone "America/Chicago"
in a .htaccess file
* php *
Requires cURL, php5-imap, php5-gd, php-mbstring 

* Database *

Create a MySQL database using the script in schema/electionleaflets.sql and schema/australian_postcodes.sql

eg.
echo "CREATE DATABASE electionleaflets" | mysql 
cat schema/electionleaflets.sql | mysql electionleaflets
cat schema/australian_postcodes.sql | mysql electionleaflets

* Config file *

Make a copy of config/general.svn.php as config/general.php then edit the variables for you local setup. 
You must point it to the MySQL database you just created and set ROOT_DIR/VHOST_DIR/WWW_SERVER/ADMIN_SERVER/DOMAIN appropriately

* Folder structure *

create the following folders and make them writable by the webserver:

data/smarty_compile
data/cache
data/temp
data/images
data/images/small
data/images/original
data/images/large
data/images/medium
data/images/thumbnail

On a SELinux based distro (Fedora, RHEL, CentOS etc.) you will also have to give these folders the correct security context
chcon -Rv -t httpd_sys_content_t data

* Testing *


** Help **
If you need any help, contact the developer mainlin list at http://groups.google.com/group/the-election-leaflet-project

* map (django application) *

The map is actually a separate django application. To get this working you will need the following installed:
python-django
python-mysqldb
libgeos-c1
python-gdal
proj
libapache2-mod-python
python-imaging

