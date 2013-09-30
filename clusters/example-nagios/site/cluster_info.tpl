
template site/cluster_info;

#
# basic site information
#
"/system/cluster/name" = "Nagios";
"/system/cluster/type" = "Monitoring";
"/system/state" = "production";
"/system/siterelease" = "SL 5";
"/system/rootmail" = "grid.support@example.org";

# Default gLite update for the cluster. Keep undefined, except if really needed
#variable GLITE_UPDATE_VERSION ?= '23';


#
# OS version definition
#
variable NODE_OS_VERSION_DB = "site/os/version_db";
variable NODE_OS_VERSION_DEFAULT = "sl550-x86_64";


# Default repository configuration template for the cluster
variable PKG_REPOSITORY_CONFIG ?= 'repository/config';


#
# set root password on machines
#
include { 'components/accounts/config' };
"/software/components/accounts/rootpwd" ?= "$1$57qRuCXe$NPngMkg4BrLBf5hfJzJh21";
"/software/components/accounts/shadowpwd" = true;
