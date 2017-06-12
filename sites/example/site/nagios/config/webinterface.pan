#
# Site-specific web configuration
#
template site/nagios/config/webinterface;

#
# Enable add admin access via grid certificates
#
variable NAGIOS_ADMIN_DNS = {
    x = "";
    if (exists(NAGIOS_ADMIN_DN_LIST)) {
        foreach(i; dn; NAGIOS_ADMIN_DN_LIST) {
            x = x + dn + ", ";
        };
        x = replace(', $', '', x);
    };
    x;
};

#
# Grant admins access to specific Nagios services
#
variable NAGIOS_CGI_OPTIONS ?= dict(
    "authorized_for_system_information", NAGIOS_ADMIN_DNS,
    "authorized_for_configuration_information", NAGIOS_ADMIN_DNS,
    "authorized_for_all_service_commands", NAGIOS_ADMIN_DNS,
    "authorized_for_all_host_commands", NAGIOS_ADMIN_DNS,
    "authorized_for_all_services", "*",
    "authorized_for_all_hosts", "*",
);

# configure Apache
variable NAGIOS_APACHE_CONFIG ?= null;
include NAGIOS_APACHE_CONFIG;



# configure list of users allowed to connect via https
variable HTPASSWD_CONF ?= {
    r = "nagiosadmin:nsYHuWXBB5uSo\nguest:Hiah6S2SgI12.\n";
    if ( exists(NAGIOS_ADMIN_DN_LIST) ) {
        foreach (i; dn; NAGIOS_ADMIN_DN_LIST) {
            r = r + dn + ":xxj31ZMTZzkVA\n";
        };
    };
    r;
};

include 'components/filecopy/config';
"/software/components/filecopy/services/{/etc/nagios/htpasswd.users}" = dict(
    "config", HTPASSWD_CONF,
);

# create symlink to workaround lib path in conf.d/nagios.conf
include 'components/symlink/config';
"/software/components/symlink/options/replace/link" = "yes";
"/software/components/symlink/links" = {
    # config file for 64-bit Nagios rpm points to /usr/lib/nagios/cgi
    if ( PKG_ARCH_DEFAULT == "x86_64" ) {
        push(dict(
            "name", "/usr/lib/nagios/cgi",
            "target", "/usr/lib64/nagios/cgi",
            "exists", false,
        ));
    }
    else {
        if (is_defined(SELF)) SELF else null;
    };
};

# optionally configure apache to start at boot
variable NAGIOS_START_APACHE ?= false;
include 'components/chkconfig/config';
"/software/components/chkconfig/service/httpd" ?= {
    x = SELF;
    if ( NAGIOS_START_APACHE ) {
        x['on'] = '';
    } else {
        x['off'] = '';
    };
    x['startstop'] = true;
    x;
};

## TODO: ensure that the host cert/key pair is installed for the Nagios server
