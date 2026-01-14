#
# Include all hostgroups definitions from all clusters
#
structure template site/nagios/hostgroups/all;

include 'site/nagios/hostgroups/cluster-A';
include 'site/nagios/hostgroups/cluster-B';

