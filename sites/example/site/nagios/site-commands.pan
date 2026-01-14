#
# Definitions for site-specific Nagios commands
# This should help to keep the generic template monitoring/nagios/commands clean
# (i.e., should not contain commands that are site specific!)
#
structure template site/nagios/site-commands;

# include the generic commands; they may be overridden below
include 'monitoring/nagios/commands';

# use a configurable time-out for NRPE checks using NRPE_CHECK_COMMAND
# panlint disable=LP006
"check_nrpe" = NRPE_CHECK_COMMAND + " -H $HOSTADDRESS$ -c $ARG1$ -a $ARG2$ $ARG3$ $ARG4$ $ARG5$ $ARG6$ $ARG7$ $ARG8$ $ARG9$ $ARG10$ $ARG11$";
"check_nrpe_load" = NRPE_CHECK_COMMAND + " -H $HOSTADDRESS$ -c check_load -a $ARG1$ $ARG2$";
"check_nrpe_users" = NRPE_CHECK_COMMAND + " -H $HOSTADDRESS$ -c check_users -a $ARG1$ $ARG2$";
"check_nrpe_all_procs" = NRPE_CHECK_COMMAND + " -H $HOSTADDRESS$ -c check_all_procs -a $ARG1$ $ARG2$";
"check_nrpe_certdates" = NRPE_CHECK_COMMAND + " -H $HOSTADDRESS$ -c check_certdates -a $ARG1$ $ARG2$";
# panlint disable=LP006
"check_nrpe_procs_zombie" = NRPE_CHECK_COMMAND + " -H $HOSTADDRESS$ -c check_procs_zombie -a $ARG1$ $ARG2$ $ARG3$ $ARG4$ $ARG5$ $ARG6$ $ARG7$ $ARG8$ $ARG9$";
# panlint disable=LP006
"check_nrpe_pbs" = NRPE_CHECK_COMMAND + " -H $HOSTADDRESS$ -c check_pbs -a $ARG1$ $ARG2$ $ARG3$ $ARG4$ $ARG5$ $ARG6$ $ARG7$ $ARG8$ $ARG9$";
"check_nrpe_procs_swap" = NRPE_CHECK_COMMAND + " -H $HOSTADDRESS$ -c check_procs -a $ARG1$ $ARG2$ W";
"check_nrpe_swap" = NRPE_CHECK_COMMAND + " -H $HOSTADDRESS$ -c check_swap -a $ARG1$ $ARG2$ ";
"check_nrpe_disk" = NRPE_CHECK_COMMAND + " -H $HOSTADDRESS$ -c check_disk -a $ARG1$ $ARG2$ $ARG3$";
# panlint disable=LP006
"check_nrpe_iferrors" = NRPE_CHECK_COMMAND + " -H $HOSTADDRESS$ -c check_iferrors -a $ARG1$ $ARG2$ $ARG3$ '$SERVICEOUTPUT$'";

"process-host-perfdata-file" = "/bin/mv /var/nagios/host-perfdata /var/spool/pnp4nagios/host-perfdata.$TIMET$";
"process-service-perfdata-file" = "/bin/mv /var/nagios/service-perfdata /var/spool/pnp4nagios/service-perfdata.$TIMET$";

"check_dummy" = "$USER1/check_dummy $ARG1$ $ARG2$";

# for distributed monitoring
# panlint disable=LP006
"submit_check_result" = "$USER6$/submit_check_result '$HOSTNAME$' '$SERVICEDESC$' '$SERVICESTATE$' '$SERVICEOUTPUT$ | $SERVICEPERFDATA$'";

# get rid of perfdata configuration that leaves unneeded files at the server
"process-host-perfdata" = ":";
"process-service-perfdata" = ":";


#
# more site-specific commands can be added....
#
