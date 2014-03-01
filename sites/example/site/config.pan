
template site/config;

include { 'quattor/functions/filesystem' };

#
# The host for the quattor server.
#
variable QUATTOR_PROFILE_URL = "http://quattor.web.lal.in2p3.fr/profiles";

#
# Enable OS errata deployment by default
#
variable PKG_DEPLOY_OS_ERRATA ?= true;


#
# Networking IP addresses
#
"/system/network/hostname" = HOSTNAME;
"/system/network/domainname" = DOMAIN;
"/system/network/nameserver" = NAMESERVERS;
"/system/network/interfaces" = copy_network_params(NETWORK_PARAMS);

# ntpd
# ---------------------------------------------------------------------------- 
include { 'components/ntpd/config' };
"/software/components/ntpd/servers" = list("orsay1.lal.in2p3.fr");

# chkconfig
# ---------------------------------------------------------------------------- 
include { 'components/chkconfig/config' };
"/software/components/chkconfig/service/ntpd/on" = "";
#"/software/components/chkconfig/service/yum/off" = "";

# logrotate
# ---------------------------------------------------------------------------- 
include { 'components/altlogrotate/config' };

"/software/components/altlogrotate/entries/global" = 
  nlist("global", true, 
        "frequency", "weekly",
        "rotate", 4,
        "create", true,
        "compress", true,
        "include", "/etc/logrotate.d");

"/software/components/altlogrotate/entries/wtmp" = 
  nlist("global", true,
        "pattern", "/var/log/wtmp",
        "frequency", "monthly",
        "rotate", 1,
        "create", true,
        "createparams", 
          nlist("mode", "0664", 
                "owner", "root", 
                "group", "utmp"));
