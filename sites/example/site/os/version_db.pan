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
    SELF['el9'] = 'al9';
    SELF['el8'] = 'al8';
    SELF['el7'] = 'centos7';

    # Explicit value per host name
    SELF['ui.example.org'] = 'centos7';

    SELF;
};


variable OS_VERSION = dict(
    # Grid cluster
    '{apel.example.org}', 'el7x-x86_64',
    '{argus.example.org}', 'el7x-x86_64',
    '{bdii.example.org}', 'el7x-x86_64',
    '{px.example.org}', 'el7x-x86_64',
    '{se-dpm-disk2.example.org}', 'el7x-x86_64',
    '{se-dpm-disk.example.org}', 'el7x-x86_64',
    '{se-dpm-server.example.org}', 'el7x-x86_64',
    '{topbdii.example.org}', 'el7x-x86_64',
    '{ui.example.org}', 'el7x-x86_64',
    '{wn2.example.org}', 'el7x-x86_64',
    '{wn3.example.org}', 'el7x-x86_64',
    '{wn.example.org}', 'el7x-x86_64',

    # Misc cluster
    '{nagios-server.example.org}', 'el7x-x86_64',
    '{nagios-master.example.org}', 'el7x-x86_64',
    '{nagios-slave-A.example.org}', 'el7x-x86_64',
    '{nagios-slave-B.example.org}', 'el7x-x86_64',
);



