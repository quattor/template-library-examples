
unique template site/config;

include 'quattor/functions/filesystem';

#
# The host for the quattor server.
#
variable QUATTOR_PROFILE_URL = "http://quattor.web.lal.in2p3.fr/profiles";

#
# Enable OS errata deployment by default
# Useful only for SPMA-based deployment: remove when all your machines use YUM-based deployment
#
variable PKG_DEPLOY_OS_ERRATA ?= true;

#
# After configuring OS, configure network if it was not done during the base OS configuration
#
variable OS_BASE_CONFIG_SITE ?= 'site/config/network';


# ntpd
# ----------------------------------------------------------------------------
include 'components/ntpd/config';
"/software/components/ntpd/servers" = list("orsay1.lal.in2p3.fr");

# chkconfig
# ----------------------------------------------------------------------------
include 'components/chkconfig/config';
"/software/components/chkconfig/service/ntpd/on" = "";
#"/software/components/chkconfig/service/yum/off" = "";

# logrotate
# ----------------------------------------------------------------------------
include 'components/altlogrotate/config';

"/software/components/altlogrotate/entries/global" = dict(
    "global", true,
    "frequency", "weekly",
    "rotate", 4,
    "create", true,
    "compress", true,
    "include", "/etc/logrotate.d",
);

"/software/components/altlogrotate/entries/wtmp" = dict(
    "global", true,
    "pattern", "/var/log/wtmp",
    "frequency", "monthly",
    "rotate", 1,
    "create", true,
    "createparams", dict(
        "mode", "0664",
        "owner", "root",
        "group", "utmp",
    ),
);
