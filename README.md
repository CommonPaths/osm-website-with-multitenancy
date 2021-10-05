# CommonPaths Private OpenStreetMap WebSite

Derived work includes additional API controller and page for the data reconciliation between private and public Open StreetMap (OSM). Please refer to the separate documentation in the repository for the reconciliation data pipeline.
Follow instructions below (The Rails Port) to install the Private OSM. To initialize the OSM database please follow the specific instructions in the reconciliation data pipeline repository. 
After the private OSM website is installed and running, in order to create and activate default users per tenant in the private OSM, please first sign up new user(s) using the private OSM website. Then edit the “users” table in the database to change the “status” column value from “pending” to “active”. 
Add a row of records in the “user_role” with the “user_id” as “id” that corresponds to the user from the “users” table, “role” as “administrator” and “createdAt” and “updateAt” timestamps and the “granter_id” same as “user_id”.
After a user has been activated and a role has been assigned to it, create oauth customer key as instructed in the configuration linked page below.  Log in to the private OSM EC2 instance and locate “settings.yml” and copy it to “settings.local.yml” and edit the file to insert the oauth customer key to the id_key tag and oaith_ley tag. Save and restart the passenger fusion.



# "The Rails Port"

[![Build Status](https://travis-ci.org/openstreetmap/openstreetmap-website.svg?branch=master)](https://travis-ci.org/openstreetmap/openstreetmap-website)
[![Coverage Status](https://coveralls.io/repos/openstreetmap/openstreetmap-website/badge.svg?branch=master)](https://coveralls.io/r/openstreetmap/openstreetmap-website?branch=master)

This is The Rails Port, the [Ruby on Rails](http://rubyonrails.org/)
application that powers the [OpenStreetMap](https://www.openstreetmap.org) website and API.
The software is also known as "openstreetmap-website".

This repository consists of:

* The web site, including user accounts, diary entries, user-to-user messaging.
* The XML-based editing [API](https://wiki.openstreetmap.org/wiki/API_v0.6).
* The integrated versions of the [Potlatch](https://wiki.openstreetmap.org/wiki/Potlatch_1), [Potlatch 2](https://wiki.openstreetmap.org/wiki/Potlatch_2) and [iD](https://wiki.openstreetmap.org/wiki/ID) editors.
* The Browse pages - a web front-end to the OpenStreetMap data.
* The GPX uploads, browsing and API.

A fully-functional Rails Port installation depends on other services, including map tile
servers and geocoding services, that are provided by other software. The default installation
uses publicly-available services to help with development and testing.

# License

This software is licensed under the [GNU General Public License 2.0](https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt),
a copy of which can be found in the [LICENSE](LICENSE) file.

# Installation

The Rails Port is a Ruby on Rails application that uses PostgreSQL as its database, and has a large
number of dependencies for installation. For full details please see [INSTALL.md](INSTALL.md).

# Development

We're always keen to have more developers! Pull requests are very welcome.

* Bugs are recorded in the [issue tracker](https://github.com/openstreetmap/openstreetmap-website/issues).
* Some bug reports are also found on the [OpenStreetMap trac](https://trac.openstreetmap.org/) system, in the "[website](https://trac.openstreetmap.org/query?status=new&status=assigned&status=reopened&component=website&order=priority)" and "[api](https://trac.openstreetmap.org/query?status=new&status=assigned&status=reopened&component=api&order=priority)" components.
* Translation is managed by [Translatewiki](https://translatewiki.net/wiki/Translating:OpenStreetMap).
* There is a [rails-dev@openstreetmap.org](https://lists.openstreetmap.org/listinfo/rails-dev) mailing list for development discussion.
* IRC - there is the #osm-dev channel on irc.oftc.net.

More details on contributing to the code are in the [CONTRIBUTING.md](CONTRIBUTING.md) file.

# Maintainers

* Tom Hughes [@tomhughes](https://github.com/tomhughes/)
* Andy Allan [@gravitystorm](https://github.com/gravitystorm/)
