############################################################
#
# This template allows definition of site-specific parameters
# for AII. It is executed AFTER the base OS configuration,
# allowing to refer to most parts of the configuration.
#
############################################################

unique template site/aii-config;

include 'pan/functions';

# Name of tftp server used by PXE installation
variable AII_KS_SRV ?= "quattorsrv.example.org";
# Name of os repository server used by PXE installation
variable AII_OSINSTALL_SRV ?= "quattorsrv.example.org";

# Host part of URL of cgi used to switch to local disk boot.
# Defaults to AII_OSINSTALL_SRV.
variable AII_ACK_SRV ?= "quattorsrv.example.org";

# Top part of the URL where to dowload OS distribution from
# OS version + /base will be added by default (/base can be change by
# defining AII_OSINSTALL_SUBURL variable
variable AII_OSINSTALL_ROOT ?= '/packages/os';
#variable AII_OSINSTALL_SUBURL ?= '/base';


