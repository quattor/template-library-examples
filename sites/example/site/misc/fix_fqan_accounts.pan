# Template installing a script to remove all accounts with a UID change
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

unique template site/misc/fix_fqan_accounts;

variable GLITE_BASE_CONFIG_SITE_SAVED ?= null;

variable LAL_FIX_ACCOUNTS_SCRIPT = '/tmp/purge_accounts';
variable LAL_FIX_ACCOUNTS_CONTENTS = <<EOF;
#!/bin/sh

users_kept='[a-z]+hs:'
users='augp|augs'
vos='atl|bio|cms|ctai|dze|fus|pla|lpnhe|esr|glarvu'
passwd_bck=/etc/passwd.150110

if [ ! -f ${passwd_bck} ]
then
  cp /etc/passwd ${passwd_bck}
fi

if [ -n "${users}" ]
then
  grep -E "^($users_kept)" /etc/passwd >/tmp/accounts.removed
  grep -Ev "^($users|$users_kept)" /etc/passwd >/tmp/passwd
else
  cp /etc/passwd /tmp/passwd
fi

if [ -n "${vos}" ]
then
  grep -Ev "^($vos)[a-z]{2,}:" /tmp/passwd >/etc/passwd
fi

if [ -f /tmp/accounts.removed -a ! -f /etc/init.d/globus-gatekeeper ]
then
  cat /tmp/accounts.removed >> /etc/passwd
  rm /tmp/accounts.removed
fi
rm /tmp/passwd
EOF

include { 'components/filecopy/config' };
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
