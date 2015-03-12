[![Stories in Ready](https://badge.waffle.io/ChrisBAshton/major-project.png?label=ready&title=Ready)](https://waffle.io/ChrisBAshton/major-project)
[![Build Status](https://travis-ci.org/ChrisBAshton/major-project.svg?branch=master)](https://travis-ci.org/ChrisBAshton/major-project) [![Code Climate](https://codeclimate.com/github/ChrisBAshton/major-project/badges/gpa.svg)](https://codeclimate.com/github/ChrisBAshton/major-project) [![Dependency Status](https://gemnasium.com/ChrisBAshton/major-project.svg)](https://gemnasium.com/ChrisBAshton/major-project)

# Online Dispute Resolution for Maritime Collisions
This repository contains the codebase for my Major Project (i.e. dissertation) at Aberystwyth University, and is currently a work in progress.

## Overview

When it comes to resolving disputes, many people are increasingly turning to online dispute resolution (ODS) platforms as an alternative to taking the case to court, settling disputes more quickly, conveniently, and at a lower cost.

These platforms already exist; they allow lawyers to open disputes on behalf of their clients, upload documents and type content in a structured manner, and hopefully reach an amicable resolution. However, there is no business logic that helps influence the outcome of a dispute. Resolution is a manual process performed by the lawyers.

Online Dispute Resolution for Maritime Collisions will attempt to introduce that business logic in an abstract way so that a module containing maritime law business logic can be plugged into the system. It will ask relevant, structured questions, interpret the answers by both parties and play out a ”court simulation” indicating the outcome of the case should the dispute be taken to court. It may also retrieve similar historic cases which can be fed into the simulation.

Please see my [Outline Project Specification](http://ashton.codes/blog/outline-project-specification/) for more details. For (almost) daily updates, read my [Dissertation Diary](http://ashton.codes/blog/category/dissertation/).

## Pre-requisites

* PHP (version >= 5.4)
* Composer (version >= 1.0)
* SQLite3 (version >= 3.7)
* RubyGems (version >= 2.2.2)

## Installation

Note: all of the commands in the rest of this README are relative to the root of the repository. Therefore, when you've downloaded the repo, make sure you `cd major-project` to go into the top level of the repository before running any of the following commands.

I've made a handy one-line installer script which installs all dependencies and creates and populates the database. You should run that script OR the manual installation - not both.

### One-step installation

`php deploy/install.php`

You can also run `php deploy/install.php --refresh` at any time to clean and re-populate the database.

### Manual installation

* install dependencies with Composer (`composer install`)
* create production database: `sqlite3 data/production.db < data/db.sql`
* at this stage you can tweak `data/fixtures/seed.php` to populate the production database, or you can leave the database blank and fill in manually later.
* `gem install bundler`
* `bundle install`

## Seeing is believing

* run `./deploy/server.sh` to start the server
* go to http://127.0.0.1:8000/ in your browser
* you should now be able to register an account and log in using the forms provided

## Running tests

Run the unit tests:

`./vendor/phpunit/phpunit/phpunit test/unit_tests/`

Run the Cucumber tests:

`cucumber features`

...or just leave it to [Travis](https://travis-ci.org/ChrisBAshton/major-project.svg?branch=master)!

## Architecture

* /data/ - contains fixture data for tests. This is also where the test and production SQLite3 databases reside (once they've been made).
* /features/ - contains my Cucumber features and Ruby step definitions.
* /modules/ - contains modules describing dispute types. Not much to see here yet, but this will one day encompass the 'Maritime Collision' dispute type.
* /test/ - contains my PHP unit tests.
* /vendor/ - automatically generated directory of dependencies, created by Composer.
* /webapp/ - contains the core ODR platform. Uses the MVCR compound design pattern.
    - /controller/ - contains the business logic for the system.
    - /model/ - contains my classes and utility functions.
    - /view/ - contains the user interface.
    - index.php - defines the environment and pulls in all dependencies.
    - routes.php - describes the routing between HTTP requests and controllers.

## License
This project is free and released as open source software covered by the terms of the [GNU Public License](http://www.gnu.org/licenses/gpl-3.0.html) (GPL v3). You may not use the software, documentation, and samples except in compliance with the license.
