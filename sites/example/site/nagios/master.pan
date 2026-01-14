#
# Example configuration for the master Nagios server that monitors all clusters
#
# Contributed by: Ronald Starink    < ronalds AT nikhef DOT nl >
#
template site/nagios/master;

# this is a Nagios slave server
include 'monitoring/nagios/master';

# include common server config for the site
include 'site/nagios/common';

# enable receiving NSCA check results
include 'site/nagios/nsca';
variable NSCA_DAEMON_TEMPLATE ?= 'monitoring/nagios/nsca/daemon';


# enable action URLs for services and hosts
variable PNP4NAGIOS_ENABLE = true;
variable PNP4NAGIOS_BASE_URL ?= '/nagios/html/pnp4nagios/index.php';

# Master server runs the webinterface
variable NAGIOS_START_APACHE ?= true;

# Host and hostgroups that are monitored by ALL slave servers
variable NAGIOS_HOSTS_TEMPLATE = 'site/nagios/hosts/all';
variable NAGIOS_HOSTGROUPS_TEMPLATE = 'site/nagios/hostgroups/all';

# Optional configuration for monitored clusters
## include 'site/nagios/config/cluster-A';
## include 'site/nagios/config/cluster-B';

# Optional service template groups,
# defining or adding services to NAGIOS_SERVICE_TEMPLATES
## include 'site/nagios/config/services/serivce-templates';

