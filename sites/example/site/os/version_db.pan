# Example of per node definition of OS version

unique template site/os/version_db;

# Define YUM distribution/repository to use. The variable is a dict whose entries
# can be either machine names or OS major versions (e.g. 'el7') that are used as
# default when there is no node specific entries.
# This variable can also be defined in a machine profile or at the cluster
# level to override the distribution used for a specific machine or cluster, 
# for example using (OBJECT refers to the current machine):
#      variable YUM_OS_DISTRIBUTION ?= dict(OBJECT, 'centos7');
# Be sure not define entries for the corresponding machines in the
# site-wide definition of the variable (in this template).

variable YUM_OS_DISTRIBUTION = {
  # Default per OS version
  SELF['el7'] = 'centos71';

  # Explicit value per host name
  SELF['ui.example.org'] = 'centos7';

  SELF;
};


variable OS_VERSION = dict(
  escape("cream.example.org"),		"sl640-x86_64",
  escape("dcache-head.example.org"),	"sl640-i386",
  escape("dcache-pool.example.org"),	"sl640-i386",
  escape("hydra.example.org"),		"sl640-x86_64",
  escape("lfc.example.org"),		"sl640-x86_64",
  escape("mon.example.org"),		"sl640-x86_64",
  escape("ui.example.org"),		"el7x-x86_64",
  escape("wmslb.example.org"),		"sl640-x86_64",
  escape("wn2.example.org"),		"sl640-x86_64",
  escape("xen-guest.example.org"),	"sl640-x86_64",
  escape("xen-host.example.org"),	"sl640-x86_64",

  escape("nagios-server.example.org"),	"sl550-x86_64",
  escape("nagios-master.example.org"),		"sl550-x86_64",
  escape("nagios-slave-A.example.org"),		"sl550-x86_64",
  escape("nagios-slave-B.example.org"),		"sl550-x86_64",
);



