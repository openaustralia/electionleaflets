Setup Instructions
==================

The `electionleaflets` folder has to be hosted on an Apache HTTP server.

The `includes`, `includes/PEAR` and `config` folders must be added to the
PHP `include_path` variable which can be set in an Apache .htaccess file
eg. https://groups.google.com/d/topic/openaustralia-dev/fg1dENEjm18/discussion

The timezone must also be set as a PHP variable eg.
`php_value date.timezone "America/Chicago"` in a `.htaccess` file.

PHP
---

Requires cURL, php5-imap, php5-gd, php-mbstring

Database
--------

Create a MySQL database using the script in `schema/electionleaflets.sql` and
`schema/australian_postcodes.sql`

    echo "CREATE DATABASE electionleaflets" | mysql
    cat schema/electionleaflets.sql | mysql electionleaflets
    cat schema/australian_postcodes.sql | mysql electionleaflets

Config file
-----------

Make a copy of config/general.svn.php as config/general.php then edit the
variables for you local setup.

You must point it to the MySQL database you just created and set `ROOT_DIR`,
`VHOST_DIR`, `WWW_SERVER`, `ADMIN_SERVER`, and `DOMAIN` appropriately.

Folder structure
----------------

Run these commands to create the following folders:

    mkdir -p data/smarty_compile
    mkdir -p data/cache
    mkdir -p data/temp
    mkdir -p data/images
    mkdir -p data/images/small
    mkdir -p data/images/original
    mkdir -p data/images/large
    mkdir -p data/images/medium
    mkdir -p data/images/thumbnail

Also ensure they are writable by the webserver.

On a SELinux based distro (Fedora, RHEL, CentOS etc.) you will also have to
give these folders the correct security context

    chcon -Rv -t httpd_sys_content_t data

Testing
-------

TODO.


Help
====

If you need any help, contact the
[OpenAustralia Community list](https://groups.google.com/group/openaustralia-dev).

map (django application)
========================

The map is actually a separate django application. To get this working you will
need the following installed:

    python-django
    python-mysqldb
    libgeos-c1
    python-gdal
    proj
    libapache2-mod-python
    python-imaging
