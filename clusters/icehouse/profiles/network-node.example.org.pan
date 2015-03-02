###############################################################################
#
# object template network-node.example.org.pan
#
# RESPONSIBLE: Jerome Pansanel
#
###############################################################################

object template network-node.example.org;

variable BRIDGE_MAPPINGS ?= 'physnet1:br-eth2';

include { 'machine-types/openstack/network_node' };

#----------------------------------------------------------------------------
# Network configuration
#----------------------------------------------------------------------------

variable MGMT_INTERFACE ?= 'eth0';
variable PUBLIC_INTERFACE ?= 'eth1';
variable DATA_INTERFACE ?= 'eth2';
variable PUBLIC_BRIDGE ?= 'br-ex';
variable DATA_BRIDGE ?= 'br-' + DATA_INTERFACE;

include { 'components/network/config' };

'/system/network/default_gateway' = '100.1.1.1';

'/system/network/interfaces/' = {
  SELF[MGMT_INTERFACE] = nlist(
    'device',MGMT_INTERFACE,
    'bootproto','dhcp',
    'onboot', 'yes',
    'type','Ethernet',
  );

  SELF[PUBLIC_BRIDGE] = nlist(
    'device',DATA_BRIDGE,
    'type','OVSBridge',
    'bootproto','static',
    'ip','30.0.0.3',
    'netmask','255.255.255.0',
    'onboot','yes',
  );

  SELF[PUBLIC_INTERFACE] = nlist(
    'device',PUBLIC_INTERFACE,
    'type','OVSPort',
    'bootproto','none',
    'ovs_bridge',PUBLIC_BRIDGE,
    'onboot','yes',
  );

  SELF[DATA_BRIDGE] = nlist (
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
include { PKG_REPOSITORY_CONFIG };



