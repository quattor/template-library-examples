unique template machine-types/example/wn;

variable FILESYSTEM_LAYOUT_CONFIG_SITE ?= 'site/filesystems/wn';
variable GLEXEC_ARGUS_PEPD_ENDPOINTS ?= list('https://polgrid30.in2p3.fr:8154/authz');

include 'machine-types/grid/wn';

##################
# Include Pakiti #
##################
#include 'features/pakiti/config';

#################################
# Include tmpdir cleanup script #
#################################
variable WN_CLEANUP_TMPDIR_TEMPLATE ?= if_exists('glite/wn/cleanup-tmpdir');
variable WN_CLEANUP_TMPDIR_TEMPLATE ?= if_exists('personality/wn/cleanup-tmpdir');
include WN_CLEANUP_TMPDIR_TEMPLATE;


