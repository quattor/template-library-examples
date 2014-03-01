structure template site/nagios/hosts/cluster-B;

# "some-host-in-B.example.org" = create (NAGIOS_QUATTOR_HOST);
# "some-host-in-B.example.org/alias" = "some monitored host in cluster B";

# let Nagios server B monitor A
# just an example to make the templates compile
"nagios-slave-A.example.org" = create (NAGIOS_QUATTOR_HOST);
"nagios-slave-A.example.org/alias" = "slave A";
"nagios-slave-A.example.org/hostgroups" = list( "quattor-nodes" );

# "another-host-in-B.example.org" = create (NAGIOS_QUATTOR_HOST);
# "another-host-in-B.example.org/alias" = "another monitored host in cluster B";
