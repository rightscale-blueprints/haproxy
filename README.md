HAProxy RightScale (Chef) Blueprint
===================================

#Description

A RightScale Blueprint for HAProxy.

#Requirements

* Chef 0.10.10 < 0.11.0 (earlier versions may work with some cookbooks/recipes)
* A Linux host

#Usage

See the Quick Start below to get started.

##Cookbooks

The following core cookbooks are included:

* haproxy

Additional/depends cookbooks:

* build-essential
* cpu

See the `Cheffile.lock` for details on their upstream sources.

##Chef Attributes

See the `examples/chef-solo` folder for examples on attribute usage using a `node.json`.
Here is a summary of the main Chef node attributes (analog to RightScale Inputs) that are configurable:

TBA

#Quick Start

##RightScale

TBA

##VirtualBox with Vagrant

###Install VirtualBox

Follow the VirtualBox documentation to install VirtualBox if not already installed.

###Install Vagrant

	sudo gem install vagrant --no-rdoc --no-ri

###Clone the haproxy Blueprint

	mkdir -p ~/src/github/rightscale-blueprints
	cd ~/src/github/rightscale-blueprints
	git clone git://github.com/rightscale-blueprints/haproxy.git
	cd haproxy/vagrant

###Run with Vagrant

Already up'd a haproxy box?

	#vagrant status                   # check vm status
	#vagrant reload                   # reload the vm
	#vagrant suspend                  # suspend the vm
	#vagrant halt                     # power down the vm
	#vagrant destroy                  # destroy the vm
	#vagrant box remove haproxy  # remove the box

Add a new box from local or remote (Ubuntu 12.04)

	vagrant box add haproxy http://files.vagrantup.com/precise64.box
	#vagrant box add haproxy ~/Binaries/vagrant/boxes/precise64.box

Need debug?

	VAGRANT_LOG=debug

Run the virtual machine

	# vagrant up!
	vagrant up
	
This uses the `Vagrantfile` in the `vagrant/` folder (and the `examples/chef-solo/node.json` for the Chef Solo provisioning).

##Chef Solo

Using the Vagrant/VirtualBox process above is recommended for desktop/workstations users and will provide an operational Linux server out-of-box.
The instructions below demonstrate usage with Chef Solo standalone. Commands are relative the root of the Git checkout.

	sudo chef-solo -c examples/chef-solo/solo.rb
	
By default this uses the `examples/chef-solo/node.json`. You can easily switch the JSON attributes used with another example:

	sudo chef-solo -c examples/chef-solo/solo.rb -j examples/chef-solo/node.json.minimal
	
Its also possible to run with the cookbooks source as remote. This is handy because no Git checkout is needed:

	sudo chef-solo -r https://github.com/rightscale-blueprints/haproxy/tarball/master
	
And with a specific tag such as `Rev1`:

	sudo chef-solo -r https://github.com/rightscale-blueprints/haproxy/tarball/rev1

For more information on using Chef Solo, see http://wiki.opscode.com/display/chef/Chef+Solo

#Using Librarian

##Install Librarian

	sudo gem install librarian --no-rdoc --no-ri

##Updating cookbooks

Set this environment variable to strip .git from each cookbook checkout:

	export LIBRARIAN_CHEF_INSTALL__STRIP_DOT_GIT=1

To update a cookbook (example, haproxy):
	
	librarian-chef update haproxy

To refresh all the cookbooks in `cookbooks/` per the `Cheffile`, run the following:

	librarian-chef install
	
#Errata

##Manifest

	cookbooks/          Librarian stored (cached) upstream cookbooks from `Cheffile`.
	examples/           Examples folder for Chef, Chef Solo.
  Cheffile            The librarian-chef sources file
  Cheffile.lock       The lock file from librarian-chef cookbook fetches
  README.md           This file
  update-metadata.sh  A shell script, `update-metadata.sh` is provided to re-generate particular cookbooks `metadata.json` (such as upstream cookbooks that do not include a `metadata.json`)
  Vagrantfile         Vagrant configuration file for provision a vagrant box

#TODO

MANIFEST file.

License and Author
==================

Author:: Chris Fordham (<chris@xhost.com.au>)

Copyright 2013, Chris Fordham

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.