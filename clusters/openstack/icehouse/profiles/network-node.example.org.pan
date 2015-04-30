@maintainer{
  name = Jerome Pansanel
  email = jerome.pansanel@iphc.cnrs.fr
}

@{
  Example template that shows the configuration of an OpenStack Network 
  node
}

object template network-node.example.org;

variable MGMT_INTERFACE ?= 'eth0';
variable PUBLIC_INTERFACE ?= 'eth1';
variable DATA_INTERFACE ?= 'eth2';
variable PUBLIC_BRIDGE ?= 'br-ex';
variable DATA_BRIDGE ?= 'br-' + DATA_INTERFACE;
variable BRIDGE_MAPPINGS ?= 'physnet1:' + DATA_BRIDGE;

include 'machine-types/openstack/network_node';

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

  SELF[PUBLIC_BRIDGE] = dict(
    'device',DATA_BRIDGE,
    'type','OVSBridge',
    'bootproto','static',
    'ip','192.168.10.32',
    'netmask','255.255.255.0',
    'onboot','yes',
  );

  SELF[PUBLIC_INTERFACE] = dict(
    'device',PUBLIC_INTERFACE,
    'type','OVSPort',
    'bootproto','none',
    'ovs_bridge',PUBLIC_BRIDGE,
    'onboot','yes',
  );

  SELF[DATA_BRIDGE] = dict(
    'device',DATA_BRIDGE,
    'type', 'OVSBridge',
    'bootproto','static',
    'ip','10.0.0.1',
    'netmask','255.255.255.0',
    'onboot','yes',
  );

  SELF;
};

#
# software repositories (should be last)
#
include PKG_REPOSITORY_CONFIG;
