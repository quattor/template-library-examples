# Template containing MAUI specific part of site configuration.
 
template site/glite/maui;

# Define MAUI default node partition. Only this partition will be accessible
# to normal jobs.
# If not defined, defaults to MAUI default 'DEFAULT'
# Note : avoid unnecessary definition as MAUI is limited to 4 partitions by default,
# including the 2 default partitions 'DEFAULT' and 'ALL'...
# If more partitions are needed, adjust MMAX_PAR parameter.
variable MAUI_WN_PART_DEF = "SL4";

# Define nodes that belong to a specific partition (other than the default one)
variable MAUI_WN_PART = nlist(
  "grid15."+SITE_DOMAIN, "SL3",
  "grid16."+SITE_DOMAIN, "SL3",
  "grid17."+SITE_DOMAIN, "SL3",
  "grid18."+SITE_DOMAIN, "SL3",
  "grid19."+SITE_DOMAIN, "SL3",
  "grid20."+SITE_DOMAIN, "SL3",
  "grid21."+SITE_DOMAIN, "SL3",
  "grid22."+SITE_DOMAIN, "SL3",
  "grid24."+SITE_DOMAIN, "SL3",
  "grid25."+SITE_DOMAIN, "SL3",
  "grid26."+SITE_DOMAIN, "SL3",
);


# Define each VO (group) specific characteristics.
# This is mainly used to define fairshare parameters
variable MAUI_GROUP_PARAMS = nlist(
  "DEFAULT",	"FSTARGET=5+",
  "atlas", 	"FSTARGET=35+",
  "biomed", 	"FSTARGET=35+",
  "cms", 	"FSTARGET=20+",
  "dteam", 	"FSTARGET=1+ MAXPROC=2",
  "dzero", 	"FSTARGET=20+",
  "ilc", 	"FSTARGET=10+",
  "ops", 	"FSTARGET=1+ MAXPROC=2",
);


# Define node partitions allowed for every VO (group). This is a comma separated list
# VO not listed are using the DEFAULT entry if present or the default partition MAUI_WN_PART_DEF
variable MAUI_GROUP_PART = nlist(
  "DEFAULT",      "SL3,SL4",
#  "atlas",        "SL4",
#  "biomed",      "SL4",
  "dteam",      "SL4",
  "lhcb",      "SL3",
);


# Limit number of simultenaous jobs for sdj, dteam and ops
# so that they can share the same SRs
# Ensure the total is not greater than the number of job slots
# as jobs are rejected if there is no free slot.
variable MAUI_CLASS_PARAMS ?= nlist(
  'sdj',       'MAXPROC=18',
);

