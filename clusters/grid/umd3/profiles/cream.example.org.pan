object template cream.example.org;

include 'pan/units';
variable DISK_GLITE_SCRATCH_SIZE ?= -1;
variable DISK_GLITE_SCRATCH_LOGVOL = 'sandboxes';
# Be sure to reflect mount point in CREAM_SANDBOX_DIRS in gLite parameters
variable DISK_GLITE_SCRATCH_MOUNTPOINT = '/sandboxes';
variable DISK_GLITE_VAR_SIZE ?= 20*GB;

variable CREAM_MYSQL_ADMINPWD ?= 'MyClrTextPwd';
variable CREAM_DB_PASSWORD ?=  'MyClrTextPwd';

include 'machine-types/grid/ce';

#
# software repositories (should be last)
#
include PKG_REPOSITORY_CONFIG;
