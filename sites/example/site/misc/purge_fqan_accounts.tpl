# Template installing a script to remove all accounts with 'fqan' in
# their name. Used after fixing VOConfigTask in SCDB 2.3.2 to remove
# obsolete accounts not removed by ncm-accounts.
#
# The script is added and executed only on nodes where NODE_VO_ACCOUNTS
# is true. It is intended to be run as GLITE_BASE_CONFIG_SITE (define
# this variable to the script namespace).
#
# Michel Jouvin - 13/9/09

unique template site/misc/purge_fqan_accounts;

variable LAL_PURGE_ACCOUNTS_SCRIPT = '/tmp/purge_accounts';
variable LAL_PURGE_ACCOUNTS_CONTENTS = <<EOF;
#!/bin/sh

cp /etc/passwd /etc/shadow /tmp
grep -v fqan /tmp/passwd | grep -v cmsmu > /etc/passwd
chmod 644 /etc/passwd
grep -v fqan /tmp/shadow | grep -v cmsmu > /etc/shadow
chmod 400 /etc/shadow
rm /tmp/passwd /tmp/shadow
EOF

include { 'components/filecopy/config' };
'/software/components/filecopy/services' = {
  if ( is_defined(NODE_VO_ACCOUNTS) && NODE_VO_ACCOUNTS ) {
    debug('Adding purge_fqan_accounts');
    SELF[escape(LAL_PURGE_ACCOUNTS_SCRIPT)] =  nlist('config', LAL_PURGE_ACCOUNTS_CONTENTS,
                                                     'owner', 'root:root',
                                                     'perms', '0755',
                                                     'restart', LAL_PURGE_ACCOUNTS_SCRIPT, 
                                                    );
  } else {
    debug('VO accounts disabled (NODE_VO_ACCOUNTS='+to_string(NODE_VO_ACCOUNTS)+')');
  };
  SELF;
};

