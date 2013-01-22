Setup Instructions
==================

The `electionleaflets` folder has to be hosted on an Apache HTTP server. A
sample Apache configuration file is supplied in
`electionleaflets/config/dev.electionleaflets.org.au`.

The `includes`, `includes/PEAR` and `config` folders must be added to the
PHP `include_path` variable which is set in the example Apache configuration
file or can be set in an Apache .htaccess file
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

Make a copy of config/general.php.example as config/general.php then edit the
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

Setting up an election
======================

To run Election Leaflets you need to collect and upload some data about the
election, things like its name and what parties are running candidates.

Requirements
------------

You'll need to collect the following data before you begin:

* Election name and date
* A list of parties running candidates
* A list of categories important to this election
* A list of constituency names
* Mappings between postcodes and constituency names (e.g. `2042, Sydney`)

Set up
------

There is an admin interface available at `/admin/` of every Election Leaflets
install. To access it you need to set a username password in the `general.php`
configuration file. From there it should be pretty self-explanatory.

It's important to note that elections created via this interface are not
immediately visible. In the `election` table you will need to set the
`enabled` field to '1' for it to go live - think of this as a final sanity
check.

DANGER
------

You have the ability to edit elections. If there are already leaflets uploaded
for an election this is probably Not A Good Idea as you can remove parties and
categories that may already have data uploaded.

With great power...

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
