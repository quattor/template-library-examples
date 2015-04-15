unique template site/one/variables;

final variable ONEADMIN_PUBKEYS = list(
'ssh-dss AAAAB3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx== oneadmin@one.example.org',
);


# just generate one uuid per cluster
final variable CEPH_LIBVIRT_UUID = "8271aaaa-385d-44d7-yyyy-xxxxxxxxxxxx";

# set passwords
final variable OPENNEBULA_ONEADMIN = ALTARIA_OPENNEBULA_ONEADMIN;
final variable OPENNEBULA_MYSQL_ADMIN = ALTARIA_OPENNEBULA_MYSQL_ADMIN;
final variable OPENNEBULA_MYSQL_ONEADMIN = ALTARIA_OPENNEBULA_MYSQL_ONEADMIN;
