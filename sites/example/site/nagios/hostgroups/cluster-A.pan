structure template site/nagios/hostgroups/cluster-A;

# hostgroup including all Quattor-managed hosts
include 'site/nagios/hostgroups/quattor-nodes';

# "lcg-ce/alias" = "lcg-CE";
# "lcg-ce/members" = push( 'some-host-in-cluster-A.example.org' );


