############################################################
#
# object template bdii.example.org
#
# RESPONSIBLE: Charles Loomis
#
############################################################

object template bdii.example.org;

variable BDII_TYPE = 'site';
#variable GLITE_SITE_PARAMS = "pro_lcg2_config_site_bdii";

include { 'machine-types/bdii' };


#
# software repositories (should be last)
#
include { PKG_REPOSITORY_CONFIG };


