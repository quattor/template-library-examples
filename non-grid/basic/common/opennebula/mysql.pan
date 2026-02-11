unique template common/opennebula/mysql;

include 'components/chkconfig/config';
include 'components/mysql/config';

prefix "/software/packages";
"{mysql-server}" = dict();

prefix  "/software/components/mysql";
"serviceName" = {
    if (RPM_BASE_FLAVOUR_VERSIONID == 7) {
        "mariadb";
    } else {
        "mysqld";
    };
};
prefix "/software/components/mysql/servers/one";
"host" = FULL_HOSTNAME; # localhost is added by component
"adminpwd" = OPENNEBULA_MYSQL_ADMIN;
"adminuser" = "root";

prefix "/software/components/mysql/databases/opennebula";
"server" = "one";
"users/oneadmin/password" = OPENNEBULA_MYSQL_ONEADMIN;
"users/oneadmin/rights" = list("ALL PRIVILEGES");
"createDb" = false; # if false, run script
"initScript/file" = "/dev/null";

prefix "/software/components/chkconfig/service";
"mysqld" = dict("on", "", "startstop", true);
