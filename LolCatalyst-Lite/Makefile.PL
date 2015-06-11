#!/usr/bin/env perl
# IMPORTANT: if you delete this file your app will not work as
# expected.  You have been warned.
use inc::Module::Install 1.02;
use Module::Install::Catalyst; # Complain loudly if you don't have
                               # Catalyst::Devel installed or haven't said
                               # 'make dist' to create a standalone tarball.

name 'LolCatalyst-Lite'; # meta data about this application, e.g. its name is declared here
all_from 'lib/LolCatalyst/Lite.pm'; # more metat data: take the module version, author info etc from this file.

requires 'Catalyst::Runtime' => '5.90091';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'Moose';
requires 'namespace::autoclean';
requires 'Config::General'; # This should reflect the config file format you've chosen
                            # See Catalyst::Plugin::ConfigLoader for supported formats
requires 'Catalyst::View::TT';
requires 'Catalyst::View::JSON';
requires 'Acme::LOLCAT';

test_requires 'Test::More' => '0.88';

#catalyst directive tells the system to use Module::Install::Catalyst
#which contains some convenience functions we will use later
catalyst; 

requires 'Catalyst::Plugin::Authentication';
requires 'Catalyst::Plugin::Authorization::Roles';
requires 'Catalyst::Plugin::Session';
requires 'Catalyst::Plugin::Session::State::Cookie';
requires 'Catalyst::Plugin::Session::Store::FastMmap';
requires 'Catalyst::Authentication::Store::DBIx::Class';
requires 'Catalyst::Authentication::Credential::HTTP';
requires 'DBIx::Class::EncodedColumn';

install_script glob('script/*.pl'); # if use is doing 'make install', puts these scripts into users bin PATH
auto_install; # try to install all required modules from CPAN
tests_recursive(); # tests should be recursive
WriteAll; # proceed with writing the Makefile(.PL?) and some other files required for the build process
