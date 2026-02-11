#
# site/nagios/common    Site-specific configuration for all Nagios servers (active+passive)
#
template site/nagios/common;

variable NAGIOS_MASTER ?= "nagios-master.example.org";

# Default location of UI with proxy
##variable NCG_NRPE_UI ?= 'nrpe-ui.example.org';

# configurable time out for NRPE checks
variable NRPE_CHECK_TIMEOUT ?= 20;
variable NRPE_CHECK_COMMAND ?= format('$USER1$/check_nrpe -u -t %s', NRPE_CHECK_TIMEOUT);

variable NAGIOS_QUATTOR_HOST ?= "site/nagios/hosts/quattor_host";

# Template with home-made commands
variable NAGIOS_COMMANDS_TEMPLATE ?= "site/nagios/site-commands";

# standard services to execute
variable NAGIOS_STANDARD_TEMPLATES ?= 'site/nagios/config/services/standard-templates';
include NAGIOS_STANDARD_TEMPLATES;

# Options for the main configuration file
variable NAGIOS_GENERAL_OPTIONS ?= dict();
variable NAGIOS_GENERAL_OPTIONS = {
    x = SELF;
    x["accept_passive_service_checks"] = true;
    x["check_external_commands"] = true;
    x["date_format"] = "iso8601";
    x["enable_flap_detection"] = false;
    x["retention_update_interval"] = 5;
    x["service_check_timeout"] = 60;
    x["use_syslog"] = false;
    x["log_passive_checks"] = false;
    x;
};

variable NAGIOS_WEB_CONFIG ?= 'site/nagios/config/webinterface';
variable NAGIOS_APACHE_CONFIG ?= 'site/nagios/config/apache';

# messing with some Nagios/NRPE rpms makes a mess out of the
# permissions on /var/log/nagios/rw
include 'components/dirperm/config';
"/software/components/dirperm/paths" = push(dict(
    "path", "/var/log/nagios/rw/",
    "owner", "nagios:nagiocmd",
    "perm", "2755",
    "type", "d",
));


# work around security problem for Nagios < 3.1.1
"/software/components/dirperm/paths" = push(dict(
    "path", "/usr/lib64/nagios/cgi/statuswml.cgi",
    "owner", "root:root",
    "perm", "0000",
    "type", "f",
));


# pnp4nagios config
# define host and service action URLs for PNP4NAGIOS
# must be before creating hosts
variable PNP4NAGIOS_BASE_URL ?= null;
variable PNP4NAGIOS_HOST_ACTION_URL = if (is_defined(PNP4NAGIOS_BASE_URL)) {
    PNP4NAGIOS_BASE_URL + '?host=$HOSTNAME$';
} else {
    null;
};
variable PNP4NAGIOS_SERVICE_ACTION_URL = if (is_defined(PNP4NAGIOS_BASE_URL)) {
    PNP4NAGIOS_BASE_URL + '?host=$HOSTNAME$&srv=$SERVICEDESC$';
} else {
    null;
};


# list of certificate DNs that are allowed to access the https site
variable NAGIOS_ADMIN_DN_LIST ?= list(
    "/O=org/O=example/CN=Administrator X",
    "/O=org/O=example/CN=Administrator Y",
);
