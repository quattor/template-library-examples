############################################################
#
# template site/global_variables
#
# This template defines some standard global variables such
# as the host name, domain name, etc.  This template should
# be customized for your site.
#
# RESPONSIBLE: Charles Loomis <charles.loomis@cern.ch>
#
############################################################

template site/global_variables;

include {'site/secret/secret'};

include { 'pan/functions' };

final variable CLUSTER_NAME = "example";

final variable DEFAULT_DOMAIN = CLUSTER_NAME+".org";

# Define the nameservers to use for the site.
final variable NAMESERVERS = list("10.141.3.250");

final variable DEFAULT_GATEWAY = "10.141.3.250";
final variable DEFAULT_BROADCAST = "10.141.255.255";
final variable DEFAULT_NETMASK = "255.255.0.0";

## site/config
variable QUATTOR_DEFAULT_DOMAIN = "example.org";
variable QUATTOR_SERVER = "quattor."+QUATTOR_DEFAULT_DOMAIN;

# OFED
variable USE_OFED = true;
final variable OFED_IS_RDMA = true;
variable OFED_RELEASE_VERSION ?= "1.5.x";


variable OPENSM_SERVERS = list("ceph021","ceph022","ceph023","ceph024");
variable OPENSM_ROUTINGENGINE = "ftree";

## use rsyncd
variable RSYNCD_HOSTS_ALLOW = list("10.10.0.14", "10.10.0.6");

## nagios
variable NAGIOS_SERVER = list("10.10.0.6", "10.10.0.14");

## module load monitoring

include {'site/extra_variables'};

variable NODE_OS_VERSION_DB = 'site/version_db';

final variable OPENVPN_SERVER_IP = "10.10.0.0";

final variable DNS_CONFIG_AREA = 'example';

final variable SINDES_SERVER_SHORT = 'example';

variable OS_SNAPSHOT = '';
