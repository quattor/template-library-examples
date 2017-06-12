
template site/openstack/config;

#-----------------------------------------------------------------------------
# SITE Definitions
#-----------------------------------------------------------------------------

variable SITE_DOMAIN ?= "example.org";
variable SITE_EMAIL ?= "cloud.support@example.org";

variable REGION_NAME ?= 'regionOne';


#-----------------------------------------------------------------------------
# NOVA Parameters
#-----------------------------------------------------------------------------

variable NOVA_PUBLIC_HOST ?= "controller-node.example.org";
variable NOVA_INTERNAL_HOST ?= "controller-node-internal.example.org";
variable NOVA_INTERNAL_IP ?= "100.1.1.2";
variable NOVA_KEYSTONE_PASSWORD ?= 'changeme';
variable NOVA_MYSQL_ADMINPWD ?= 'changeme';
variable NOVA_DB_PASSWORD ?= 'changeme';
variable VNCSERVER_PROXYCLIENT_ADDRESS ?= NOVA_INTERNAL_IP;
variable METADATA_PROXY_SHARED_SECRET ?= 'c3b7d8ec-c0b3-11e4-be53-0026b9c3db72';


#-----------------------------------------------------------------------------
# RABBITMQ Parameters
#-----------------------------------------------------------------------------

variable RABBIT_USER ?= 'guest';
variable RABBIT_PASSWORD ?= 'guest';


#-----------------------------------------------------------------------------
# KEYSTONE Parameters
#-----------------------------------------------------------------------------

variable KEYSTONE_PROTOCOL ?= 'https';
variable KEYSTONE_INTERNAL_HOST ?= NOVA_INTERNAL_HOST;
variable ADMIN_TOKEN ?= 'f09b7604-c0c0-11e4-9bd2-0026b9c3db72';
variable KEYSTONE_MYSQL_ADMINPWD ?= 'changeme';
variable KEYSTONE_DB_PASSWORD ?= 'changeme';


#-----------------------------------------------------------------------------
# GLANCE Parameters
#-----------------------------------------------------------------------------

variable GLANCE_KEYSTONE_PASSWORD ?= 'changeme';
variable GLANCE_MYSQL_ADMINPWD ?= 'changeme';
variable GLANCE_DB_PASSWORD ?= 'change';


#-----------------------------------------------------------------------------
# NEUTRON Parameters
#-----------------------------------------------------------------------------

variable NEUTRON_KEYSTONE_PASSWORD ?= 'changeme';
variable NEUTRON_MYSQL_ADMINPWD ?= 'changeme';
variable NEUTRON_DB_PASSWORD ?= 'changeme';
variable NETWORK_VLAN_RANGES ?= 'physnet1:101:110';
