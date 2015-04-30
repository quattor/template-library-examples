@maintainer{
  name = Jerome Pansanel
  email = jerome.pansanel@iphc.cnrs.fr
}

@{
  Example template that shows the configuration of an OpenStack Compute
  node
}

object template compute-node.example.org;

variable MGMT_INTERFACE ?= 'eth0';
variable DATA_INTERFACE ?= 'eth1';
variable DATA_BRIDGE ?= 'br-' + DATA_INTERFACE;
variable BRIDGE_MAPPINGS ?= 'physnet1:' + DATA_BRIDGE;

include 'machine-types/openstack/compute_node';

#----------------------------------------------------------------------------
# Network configuration
#----------------------------------------------------------------------------

include 'components/network/config';

'/system/network/interfaces/' = {
  SELF[MGMT_INTERFACE] = dict(
    'device',MGMT_INTERFACE,
    'bootproto','dhcp',
    'onboot', 'yes',
    'type','Ethernet',
  );

  SELF[DATA_BRIDGE] = dict(
    'device',DATA_BRIDGE,
    'type', 'OVSBridge',
    'bootproto','static',
    'ip','10.0.0.2',
    'netmask','255.255.255.0',
    'onboot','yes',
  );

  SELF[DATA_INTERFACE] = dict(
    'device',DATA_INTERFACE,
    'type','OVSPort',
    'bootproto','none',
    'ovs_bridge',DATA_BRIDGE,
    'onboot','yes',
  );

  SELF;
};

#
# software repositories (should be last)
#
include PKG_REPOSITORY_CONFIG;
