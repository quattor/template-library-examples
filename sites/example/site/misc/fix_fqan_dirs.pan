# Template installing a script to fix the home directory permissions for accounts modified
# by fix-fqan-accounts. To be run after it to fix the pb with a UID change
# following the rewrite of vo/functions.tpl (18/12/09).
#
# The script is added and executed only on nodes where NODE_VO_ACCOUNTS
# is true. It is intended to be run as GLITE_BASE_CONFIG_SITE (define
# this variable to the script namespace). If GLITE_BASE_CONFIG_SITE was
# already defined to something else, save its original value to
# GLITE_BASE_CONFIG_SITE_SAVED before executing this template and it
# will be executed at the end.
#
# Michel Jouvin - 18/12/09

unique template site/misc/fix_fqan_dirs;

variable GLITE_BASE_CONFIG_SITE_SAVED ?= null;

variable LAL_FIX_ACCOUNTS_SCRIPT = '/tmp/fix_fqan_dirs';

include 'components/filecopy/config';
'/software/components/filecopy/dependencies/pre' = push('accounts');
'/software/components/filecopy/services' = {
    if ( is_defined(NODE_VO_ACCOUNTS) && NODE_VO_ACCOUNTS ) {
        debug('Adding purge_fqan_accounts');
        SELF[escape(LAL_FIX_ACCOUNTS_SCRIPT)] = dict(
            'config', file_contents('site/misc/fix_fqan_dirs.sh'),
            'owner', 'root:root',
            'perms', '0755',
            'restart', LAL_FIX_ACCOUNTS_SCRIPT,
        );
    } else {
        debug('VO accounts disabled (NODE_VO_ACCOUNTS=%s', NODE_VO_ACCOUNTS);
    };
    SELF;
};


# Include original GLITE_BASE_CONFIG_SITE if any
include GLITE_BASE_CONFIG_SITE_SAVED;
