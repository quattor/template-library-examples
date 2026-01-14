structure template site/nagios/hostgroups/cluster-B;

# hostgroup including all Quattor-managed hosts
include 'site/nagios/hostgroups/quattor-nodes';

# "cream-ce/alias" = "Cream-CE";
# "cream-ce/members" = push( 'some-host-in-cluster-B.example.org' );


