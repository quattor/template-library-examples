############################################################
#
# object template se-dpm-server.example.org
#
############################################################

object template se-dpm-server.example.org;

variable DPM_CONFIG_SITE ?= 'site/glite/dpm_config';

# Configure as a DPM master server
include 'machine-types/example/se_dpm';

# Set a specific root pwd for DPM related servers
#"/software/components/accounts/rootpwd" = "$1$gMlULQt/$SEHi2bFOtlEwv/qMj4ZBP0";

# Tune MySQL parameters (recommended)
'/software/components/mysql/servers/' = {
  SELF[FULL_HOSTNAME]['options'] = nlist(
        'innodb_buffer_pool_size','2048M',
        'innodb_additional_mem_pool_size','256M',
  );
  SELF;
};

# 
# software repositories
#
include PKG_REPOSITORY_CONFIG;

 
