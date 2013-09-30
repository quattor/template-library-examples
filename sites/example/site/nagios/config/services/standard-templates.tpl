#
# List of services that are monitored on all Quattor-managed hosts
#
template site/nagios/config/services/standard-templates;

# all services to check
variable NAGIOS_SERVICE_TEMPLATES ?= list();
variable NAGIOS_SERVICE_TEMPLATES = push(
    "load",
    # "swap",
    # "ncd-result",
    # "quattor-daemons",
    # "memory-used",
    # "kernel_version",
    # "time-offset",
);

