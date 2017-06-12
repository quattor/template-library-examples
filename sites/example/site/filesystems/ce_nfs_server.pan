# This template defines configuration specific to TORQUE CE at GRIF
# Called by standard pro_ce_torque.tpl template

template site/filesystems/ce_nfs_server;

variable DISK_GLITE_HOME_SIZE ?= 60 * GB;
variable DISK_GLITE_SWAREAS_SIZE ?= 60 * GB;
variable DISK_GLITE_VAR_SIZE = -1;

include 'site/filesystems/glite';

