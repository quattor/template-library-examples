#
# site/nagios/OCP_setup:        Configure a Nagios slave server to publish results via OCP
#
template site/nagios/OCP_setup;

include 'components/filecopy/config';

# modify specific options to publish results via OCP_daemon
variable NAGIOS_GENERAL_OPTIONS = {
    x = SELF;

    x["obsess_over_hosts"] = false;
    x["obsess_over_services"] = false;

    # Use performance data to forward check results OCP daemon
    # which wraps around send_nsca
    x["process_performance_data"] = true;
    x["host_perfdata_file"] = "/var/nagios/rw/host-perfdata.fifo";
    x["service_perfdata_file"] = "/var/nagios/rw/service-perfdata.fifo";
    x["host_perfdata_file_template"] = join('\t', list(
        '$HOSTNAME$',
        '$HOSTSTATEID$',
        '$HOSTOUTPUT$|$HOSTPERFDATA$',
    ));
    x["service_perfdata_file_template"] = join('\t', list(
        '$HOSTNAME$',
        '$SERVICEDESC$',
        '$SERVICESTATEID$',
        '$SERVICEOUTPUT$|$SERVICEPERFDATA$',
    ));
    x["host_perfdata_file_mode"] = 'p';
    x["service_perfdata_file_mode"] = 'p';
    x["host_perfdata_file_processing_interval"] = 0;
    x["service_perfdata_file_processing_interval"] = 0;

    x;
};

variable NSCA_SUBMIT_RESULT_TEMPLATE ?= 'monitoring/nagios/nsca/OCP_daemon';

variable OCP_SYSCONFIG ?= format("# /etc/sysconfig/OCP_daemon\nNSCA_HOST=%s\n", NAGIOS_MASTER);
"/software/components/filecopy/services/{/etc/sysconfig/OCP_daemon}" = dict(
    "config", OCP_SYSCONFIG,
    "perms", "0644",
    "owner", "root",
    "backup", false,
);
