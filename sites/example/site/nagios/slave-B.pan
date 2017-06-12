#
# Example configuration for a slave Nagios server that monitors cluster B
#
template site/nagios/slave-B;

# this is a Nagios slave server
include 'monitoring/nagios/slave';

# include common server config
include 'site/nagios/common';

# Use OCP to submit check results to the Nagios master
# which gives a much better performance at the slave
# than direclty using send_nsca
# If this line is commented out, the default send_nsca is used (cf. definition of
# NSCA_SUBMIT_RESULT_TEMPLATE below)
include 'site/nagios/OCP_setup';


# enable submitting checks via NSCA to Nagios master server
include 'site/nagios/nsca';
variable NSCA_SEND_TEMPLATE ?= 'monitoring/nagios/nsca/send';
variable NSCA_SUBMIT_RESULT_TEMPLATE ?= 'monitoring/nagios/nsca/submit_check_result';

# enable receiving NSCA check results
variable NSCA_DAEMON_TEMPLATE ?= 'monitoring/nagios/nsca/daemon';

variable NAGIOS_HOSTS_TEMPLATE = 'site/nagios/hosts/cluster-B';
variable NAGIOS_HOSTGROUPS_TEMPLATE = 'site/nagios/hostgroups/cluster-B';

# Optional specific configuration for cluster B
## include 'site/nagios/config/cluster-B';

# Optional service template groups,
# defining or adding services to NAGIOS_SERVICE_TEMPLATES
## include 'site/nagios/config/services/serivce-templates';

