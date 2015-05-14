############################################################
#
# object template se-dpm-disk.example.org
#
############################################################

object template se-dpm-disk2.example.org;

variable DPM_CONFIG_SITE ?= 'site/glite/dpm_config';

# Configure as a DPM disk server
include 'machine-types/example/se_dpm';

# 
# software repositories
#
include PKG_REPOSITORY_CONFIG;

 
