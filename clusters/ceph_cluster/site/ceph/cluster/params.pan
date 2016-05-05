unique template site/ceph/cluster/params;

final variable CEPH_DEPLOY_PUBKEYS = list(
);

variable CEPH_NODES = list('ceph01.example.org', 'ceph02.example.org', 'ceph03.example.org');
variable CEPH_CLUSTER_TEMPLATE = 'building';

variable MDS_FQDNS = list('ceph01.example.org', 'ceph02.example.org');
variable DEPLOY_FQDNS = list(CEPH_NODES[0]);

variable CEPH_FSID = '230b20a6-f0ea-4d4e-bdc5-b751005ef6d8';
variable CEPH_NETWORK = '10.20.30.0/24';
variable CEPH_CLUSTER_NETWORK = CEPH_NETWORK;

