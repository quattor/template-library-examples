############################################################
#
# object template wmslb.example.org
#
# RESPONSIBLE: Charles Loomis
#
############################################################

object template wmslb.example.org;

# Control if WMS is drained
#variable WMS_DRAINED ?= true;
variable WMS_WM_BDII_FILTER_MAX_VOS ?= 35;

# Define VO list specific to WMS/LB
variable NODE_VO_CONFIG ?= "site/wmslb/vos";

#include { 'iihe_wmslb' };
variable WMSLB_CONFIG_SITE = "site/wmslb/config";

include { 'machine-types/wmslb' };

#
# software repositories (should be last)
#
include { PKG_REPOSITORY_CONFIG };

