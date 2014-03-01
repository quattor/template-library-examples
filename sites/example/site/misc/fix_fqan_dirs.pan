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

variable LAL_FIX_ACCOUNTS_SCRIPT = '/tmp/fix_homedirs';
variable LAL_FIX_ACCOUNTS_CONTENTS = <<EOF;
#!/bin/sh

users=$(diff -u /etc/passwd.181209 /etc/passwd|grep -E '^\+[a-z]'|awk -F: '{print $1}'|sed -e 's/\+//')

for user in ${users}
do
  echo "Resetting perms on $user home dir..."
  eval chown -R ${user} ~${user}
done

exit 0
EOF

include { 'components/filecopy/config' };
'/software/components/filecopy/dependencies/pre' = push('accounts');
'/software/components/filecopy/services' = {
  if ( is_defined(NODE_VO_ACCOUNTS) && NODE_VO_ACCOUNTS ) {
    debug('Adding purge_fqan_accounts');
    SELF[escape(LAL_FIX_ACCOUNTS_SCRIPT)] =  nlist('config', LAL_FIX_ACCOUNTS_CONTENTS,
                                                     'owner', 'root:root',
                                                     'perms', '0755',
                                                     'restart', LAL_FIX_ACCOUNTS_SCRIPT, 
                                                    );
  } else {
    debug('VO accounts disabled (NODE_VO_ACCOUNTS='+to_string(NODE_VO_ACCOUNTS)+')');
  };
  SELF;
};


# Include original GLITE_BASE_CONFIG_SITE if any
include { GLITE_BASE_CONFIG_SITE_SAVED };
