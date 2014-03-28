template repository/snapshot/snapshot_variables;

variable YUM_SNAPSHOT_ROOT_URL ?= 'http://quattorsrv.lal.in2p3.fr/yum/snapshots';
variable YUM_SNAPSHOT_DATE ?= error('YUM snapshot date (YUM_SNAPSHOT_DATE) undefined');
