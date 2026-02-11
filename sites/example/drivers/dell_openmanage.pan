unique template drivers/dell_openmanage;

include 'components/filecopy/config';

"/software/packages" = {
    kernel = "";
    if (KERNEL_VARIANT != "") kernel = "kernel-" + KERNEL_VARIANT + "-devel"
    else kernel = "kernel-devel";
    pkg_repl(kernel, KERNEL_VERSION_NUM, PKG_ARCH_KERNEL);
};

#install RPMs
#
# OS Packages necessaires
#
#"/software/packages" = pkg_repl("libxml2", "2.6.26-2.1.2.7", "i386");
#"/software/packages" = pkg_repl("zlib", "1.2.3-3", "i386");
#"/software/packages" = pkg_repl("compat-libstdc33", "3.2.3-61", "i386");
#"/software/packages" = pkg_repl("pam", "0.99.6.2-3.27.el5", "i386");
#"/software/packages" = pkg_repl("audit-libs", "1.6.5-9.el5", "i386");
#"/software/packages" = pkg_repl("cracklib", "2.8.9-3.3", "i386");
#"/software/packages" = pkg_repl("libselinux", "1.33.4-5.el5", "i386");
#"/software/packages" = pkg_repl("libsepol", "1.15.2-1.el5", "i386");
#"/software/packages" = pkg_repl("ncurses", "5.5-24.20060715", "i386");

#
# Dell OpenManage Version
#

"/software/packages" = pkg_add("srvadmin-omilcore", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-syscheck", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-deng", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-racser", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-omauth", "5.5.0-364.rhel4", "i386");
"/software/packages" = pkg_add("srvadmin-omacore", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-jre", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-odf", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-racadm4", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-racsvc", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-ipmi", "5.5.0-364.rhel4", "i386");
"/software/packages" = pkg_add("srvadmin-hapi", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-rac5-components", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-isvc", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-rac3-components", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-rac4-components", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-cm", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-iws", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-old", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-omhip", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-racadm5", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-racdrsc3", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-racdrsc4", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-racdrsc5", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-racser-devel", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-racvnc", "5.5.0-364", "i386");
"/software/packages" = pkg_add("srvadmin-storage", "5.5.0-364", "i386");

#installation de dkms
"/software/packages" = pkg_add("dkms", "2.0.19-1", "noarch");


#openipmi installation:
"/software/packages" = pkg_add("openipmi", "33.13.RHEL4-1dkms", "noarch");

#driver installation
"/software/packages" = pkg_add("megaraid_sas", "v00.00.03.21-4", "noarch");


#Install and run setup script
variable CONFIG_FILE = "/usr/bin/setup_dell_openmanage.sh";
variable RESTART_COMMAND = CONFIG_FILE;
variable MACHINE_KERNEL_VERSION = {
    if (KERNEL_VARIANT != "") return(KERNEL_VERSION_NUM + KERNEL_VARIANT)
    else return(KERNEL_VERSION_NUM);
};

#copy the file and run it
"/software/components/filecopy/services" = npush(escape(CONFIG_FILE), dict(
    "config", substitute(file_contents('drivers/dell_openmanage_sas_driver.sh'), dict(
        'kernel', MACHINE_KERNEL_VERSION,
    )),
    "owner", "root",
    "perms", "0755",
    "restart", RESTART_COMMAND,
));


#variable DEBUG=error("kernel : " + KERNEL_VERSION_NUM + " -- variante : " + KERNEL_VARIANT);
