unique template site/one/frontend;


include 'site/one/common';
include 'site/one/variables';

include 'common/opennebula/one_auth';
include 'common/opennebula/mysql';
include 'components/opennebula/config';
include 'site/one/resources';

prefix "/software/components/opennebula/oned";
"db" = dict(
    "backend", "mysql",
    "server", "localhost",
    "port", 0,
    "user", "oneadmin",
    "passwd", OPENNEBULA_MYSQL_ONEADMIN,
    "db_name", "opennebula",
);
"default_device_prefix" = "vd";
"onegate_endpoint" = format("http://%s:5030", FULL_HOSTNAME);

#  vnet common templates
prefix '/software/components/opennebula/vnets/0/';
"name" = DEFAULT_DOMAIN;
"bridge" = "bridge1";
"gateway" = DEFAULT_GATEWAY;
"network_mask" = DEFAULT_NETMASK;
"dns" = NAMESERVERS[0];

variable OPENNEBULA_HYP_PREFIX ?= "hyp";
#  datastore template
prefix "/software/components/opennebula";
"hosts" = {
    # add all hostnames starting with hyp
    t=list();
    foreach (k;v;DB_IP) {
        if(match(k, format('^%s\d+', OPENNEBULA_HYP_PREFIX))) {
            append(t,k);
        };
    };
    t;
};

# ONE local common users
prefix "/software/components/opennebula/users/0";
"user" = "user01";
"password" = "user_fancy_pass";
"ssh_public_key" = "";

prefix "/software/components/opennebula/users/1";
"user" = "user02";
"password" = "another_user_fancy_pass";

# RPC endpoint
prefix "/software/components/opennebula/rpc";
"user" = "oneadmin";
"password" = OPENNEBULA_ONEADMIN;
"host" = "localhost";
"port" = 2633;

"/software/components/dirperm/paths" = append(dict(
    "path", "/etc/one",
    "owner", "oneadmin:oneadmin",
    "type", "d",
    "perm", "0755",
));

include 'common/download/service';
prefix "/software/components/download/files";
"{/var/lib/one/.ssh/id_dsa}" = create("common/download/auth", 
    "href", "secure/privkey/id_dsa", 
    "group", "oneadmin",
    "owner", "oneadmin",
    "perm", "0600",
);

"{/var/lib/one/.ssh/id_dsa.pub}" = create("common/download/auth",
    "href", "secure/privkey/id_dsa.pub",
    "group", "oneadmin",
    "owner", "oneadmin",
    "perm", "0644",
);

prefix "/software/components/chkconfig/service";
"opennebula" = dict("on", "","startstop", true);
"opennebula-econe" = dict("on", "","startstop", true);
"opennebula-gate" = dict("on", "","startstop", true);
"opennebula-novnc" = dict("on", "","startstop", true);
"opennebula-occi" = dict("on", "","startstop", true);
"opennebula-sunstone" = dict("on", "","startstop", true);

prefix "/software/packages";
"{opennebula-server}"=dict();
"{opennebula-sunstone}"=dict();
"{opennebula-gate}"=dict();
"{opennebula-flow}"=dict();

include 'site/one/rubygems';

# SSH oneadmin config
include 'metaconfig/ssh/schema';

bind "/software/components/metaconfig/services/{/var/lib/one/.ssh/config}/contents" = ssh_config_file;

prefix "/software/components/metaconfig/services/{/var/lib/one/.ssh/config}";
"module" = "ssh/client";
"owner" = "oneadmin";
"group"= "oneadmin";

prefix "/software/components/metaconfig/services/{/var/lib/one/.ssh/config}/contents";

"Host" =  append(
            dict(
                "hostnames", list("*"),
                "ControlMaster", "auto",
                "ControlPath", "~/.ssh/%r@%h:%p",
                )
       );
