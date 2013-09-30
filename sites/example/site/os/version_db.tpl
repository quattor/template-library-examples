# Example of per node definition of OS version

unique template site/os/version_db;

# Include OS errata defaults for each OS version
include { 'site/os/errata-defaults' };

variable OS_VERSION = nlist(
  escape("cream.example.org"),		"sl550-x86_64",
  escape("dcache-head.example.org"),	"sl550-i386",
  escape("dcache-pool.example.org"),	"sl550-i386",
  escape("hydra.example.org"),		"sl550-x86_64",
  escape("lfc.example.org"),		"sl550-x86_64",
  escape("mon.example.org"),		"sl550-x86_64",
  escape("ui.example.org"),		"sl550-x86_64",
  escape("wmslb.example.org"),		"sl550-x86_64",
  escape("wn2.example.org"),		"sl550-x86_64",
  escape("xen-host.example.org"),	"sl550-x86_64",
  escape("xen-guest.example.org"),	"sl550-x86_64",
  escape("nagios-server.example.org"),	"sl550-x86_64",

  escape("nagios-master.example.org"),		"sl550-x86_64",
  escape("nagios-slave-A.example.org"),		"sl550-x86_64",
  escape("nagios-slave-B.example.org"),		"sl550-x86_64",
);


# Define nodes that use a non-standard errata version
variable NODE_OS_ERRATA_TEMPLATE ?= nlist(
  #escape('xen-host.example.org'),        'rpms/errata',
);

