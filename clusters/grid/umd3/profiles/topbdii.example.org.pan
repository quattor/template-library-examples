
object template topbdii.example.org;

# Configure as a top level BDII
variable BDII_TYPE = 'top';
include 'machine-types/grid/bdii';


#
# software repositories (should be last)
#
include PKG_REPOSITORY_CONFIG;


