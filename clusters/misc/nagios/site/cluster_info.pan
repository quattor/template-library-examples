
template site/cluster_info;

#
# basic site information
#
"/system/cluster/name" = "Nagios";
"/system/cluster/type" = "Monitoring";
"/system/state" = "production";
"/system/siterelease" = "SL6";
"/system/rootmail" = "grid.support@example.org";

# Use OS templates for generic major version
variable OS_FLAVOUR_ENABLED ?= true;

# YUM Repository snapshots
variable YUM_SNAPSHOT_DATE ?= '20140304';
variable AII_OSINSTALL_ROOT = format('/yum/snapshots/', YUM_SNAPSHOT_DATE);

# Set to true if you want to deploy machines in these clusster with an
# AII server running Quattor 13.1.x.
# It is recommended to define this variable to true only during the installation
# phase and to reset it to false afterwards.
# You can also override the default value defined here in a specific profile.
variable AII_V2_INSTALL ?= false;

#
# OS version definition
#
variable NODE_OS_VERSION_DB = "site/os/version_db";
variable NODE_OS_VERSION_DEFAULT = "sl640-x86_64";


# Default repository configuration template for the cluster
variable PKG_REPOSITORY_CONFIG ?= 'repository/config';


#
# set root password on machines
#
include 'components/accounts/config';
"/software/components/accounts/rootpwd" ?= "$1$57qRuCXe$NPngMkg4BrLBf5hfJzJh21";
"/software/components/accounts/shadowpwd" = true;
