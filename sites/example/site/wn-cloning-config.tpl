template site/wn-cloning-config;

# Include cluster-specific configuration of profile cloning, if
# available.
variable PROFILE_CLONING_CLUSTER_CONFIG ?= 'site/wn-cloning-cluster-config';
variable PROFILE_CLONING_CLUSTER_CONFIG_INCLUDE ?= if_exists(PROFILE_CLONING_CLUSTER_CONFIG);
variable PROFILE_CLONING_CLUSTER_CONFIG_INCLUDE ?= debug('Cluster-specific configuration ('+PROFILE_CLONING_CLUSTER_CONFIG+') for profile cloning not found');
include { PROFILE_CLONING_CLUSTER_CONFIG_INCLUDE };

variable PROFILE_CLONING_ENABLED ?= false;
variable PROFILE_CLONING_ELIGIBLE_NODES ?= 'wn.*\.example\.org';


# Eligible nodes where profile cloning must be disabled
variable PROFILE_CLONING_DISABLED ?= nlist(
);

