
object template argus.example.org;

# DN of the Argus server.
variable PAP_HOST_DN = "/C=US/ST=CA/O=IANA/CN=argus.example.org";

# Password for the Argus services
variable PAP_SHUTDOWN_COMMAND = 'papshutdown_0123456789';
variable PEP_ADMIN_PASSWORD = 'pepdadmin_0123456789';
variable PDP_ADMIN_PASSWORD = 'pdpadmin_0123456789';

#
# Configure an Argus
#
include 'machine-types/grid/argus';

#
# software repositories (should be last)
#
include PKG_REPOSITORY_CONFIG;



