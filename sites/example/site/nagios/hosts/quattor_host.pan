#
# Host type quattor_host is derived from a generic_host, but adds the host to
# host group quattor-nodes
#
structure template site/nagios/hosts/quattor_host;

include 'monitoring/nagios/generic_host';
"hostgroups" = list( 'quattor-nodes' );
