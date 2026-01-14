# Typically executed as part of OS_BASE_CONFIG_SITE

unique template site/config/network;

# Defined to true by OS templates supporting it
variable OS_BASE_CONFIGURE_NETWORK ?= false;

include 'quattor/functions/filesystem';

#
# Network (IP) configuration
# Code below is used to work around OS base config that don't configure
# the network (old generation OS templates)
#
variable SITE_NETWORK_CONFIG_TEMPLATE = if ( !OS_BASE_CONFIGURE_NETWORK ) {
    # To work around OS base config that don't configure
    # the network (old generation OS templates)
    'os/network/config';
} else {
    null;
};
include SITE_NETWORK_CONFIG_TEMPLATE;
