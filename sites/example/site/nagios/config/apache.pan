#
# Example configuration for Apache, which permits authentication to the https site
# based on grid certificates
#
# Below is just a filecopy of the literal httpd configuration
#
template site/nagios/config/apache;

# Apache user definition; may be placed in another file to enable re-use
include 'components/accounts/config';
include 'components/filecopy/config';

"/software/components/accounts/groups/apache" = dict(
    "gid", 48,
);

"/software/components/accounts/users/apache" = dict(
    "uid", 48,
    "groups", list("apache"),
    "comment", "Apache",
    "shell", "/sbin/nologin",
    "homeDir", "/var/www"
);

# /etc/httpd/conf/httpd.conf
"/software/components/filecopy/services{/etc/httpd/conf/httpd.conf}" = dict(
    "config", file_contents('site/nagios/config/apache/httpd.conf'),
    "restart", "service httpd restart",
);

# /etc/httpd/conf.d/ssl.conf
"/software/components/filecopy/services{/etc/httpd/conf.d/ssl.conf}" = dict(
    "config", file_contents('site/nagios/config/apache/ssl.conf'),
    "restart", "service httpd restart",
);

# /etc/httpd/conf.d/nagios.conf
"/software/components/filecopy/services{/etc/httpd/conf.d/nagios.conf}" = dict(
    "config", file_contents('site/nagios/config/apache/nagios.conf'),
    "restart", "service httpd restart",
);
