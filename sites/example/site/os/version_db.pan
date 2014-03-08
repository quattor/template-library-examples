# Example of per node definition of OS version

unique template site/os/version_db;

variable OS_VERSION = nlist(
  escape("cream.example.org"),		"sl640-x86_64",
  escape("dcache-head.example.org"),	"sl640-i386",
  escape("dcache-pool.example.org"),	"sl640-i386",
  escape("hydra.example.org"),		"sl640-x86_64",
  escape("lfc.example.org"),		"sl640-x86_64",
  escape("mon.example.org"),		"sl640-x86_64",
  escape("ui.example.org"),		"sl640-x86_64",
  escape("wmslb.example.org"),		"sl640-x86_64",
  escape("wn2.example.org"),		"sl640-x86_64",
  escape("xen-guest.example.org"),	"sl640-x86_64",
  escape("xen-host.example.org"),	"sl640-x86_64",

  escape("nagios-server.example.org"),	"sl550-x86_64",
  escape("nagios-master.example.org"),		"sl550-x86_64",
  escape("nagios-slave-A.example.org"),		"sl550-x86_64",
  escape("nagios-slave-B.example.org"),		"sl550-x86_64",
);



