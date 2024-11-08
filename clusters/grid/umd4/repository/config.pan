# NOTE: This template should be the LAST thing included in a
# machine profile.  If you include packages after this template
# then they will not be "resolved" and SPMA will not function
# correctly.

unique template repository/config;

include'pan/functions';

include 'repository/snapshot/snapshot_variables';

# Repositories related to base OS and quattor client (should be first)
include 'repository/config/os';

# Quattor repositories
include 'repository/config/quattor';

# Local Repositories
variable YUM_SITE_SNAPSHOT_NS ?= YUM_SNAPSHOT_NS;
variable SITE_REPOSITORY_LIST ?= list();
variable SITE_REPOSITORY_CONFIG ?= dict();
variable DEBUG = debug(
    'OS_REPOSITORY_LIST = ' + to_string(OS_REPOSITORY_LIST) + "\n" +
    'SITE_REPOSITORY_LIST = ' + to_string(SITE_REPOSITORY_LIST) + "\n" +
    'SITE_REPOSITORY_CONFIG = ' + to_string(SITE_REPOSITORY_CONFIG) + "\n"
);
include 'quattor/functions/repository';
'/software/repositories' = add_repositories(SITE_REPOSITORY_LIST);
'/software/repositories' = repository_config(SITE_REPOSITORY_CONFIG);

# Repositories related to grid middleware
# Only if it can be found in the loadpath (else this is a machine not
# running the grid middleware)
include if_exists('repository/config/grid');

# Repositories related to Nagios
include if (is_defined(REPOSITORY_CONFIG_NAGIOS)) if_exists(REPOSITORY_CONFIG_NAGIOS);

# Register repository changes with yum based spma
include 'components/spma/config';
'/software/components/spma/register_change' = append('/software/repositories');

# Cleanup repository information
include 'components/spma/repository_cleanup';
