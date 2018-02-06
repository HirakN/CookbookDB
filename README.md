# db

## Description
This repository is a chef cookbook for setting up a MongoDB instance.

## Prerequistes
You will need to install:
To begin, download the following programs and install them:

[Virtual Box](https://www.virtualbox.org/wiki/Downloads)(5.2.6)

[Vagrant](https://www.vagrantup.com/downloads.html)

[ChefDK](https://downloads.chef.io/chefdk)(2.4.17)

## Usage

First clone the [repository](https://github.com/HirakN/CookbookDB).

To create a preconfigured VM:

```bash
kitchen create
```
This will create the VM that will contain MongoDB.

When you want to remove the VM:

```bash
kitchen destroy
```

Tests can be run to check correct installation of the VM by typing:

```bash
kitchen verify
```

