#
# Include all host definitions from all clusters
#
structure template site/nagios/hosts/all;

include 'site/nagios/hosts/cluster-A';
include 'site/nagios/hosts/cluster-B';
