# Template to help deploying consistent modifications on all SE nodes.

unique template machine-types/example/se_dpm;

# DPM site configuration
variable SEDPM_CONFIG_SITE = "site/glite/dpm_config";

# Specific gLite update to use for DPM
#variable GLITE_UPDATE_VERSION ?= '45-1';

# Include base machine type
include 'machine-types/grid/se_dpm';

