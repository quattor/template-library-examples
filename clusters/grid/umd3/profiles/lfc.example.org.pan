
object template lfc.example.org;

variable LFC_CENTRAL = true;
variable LFC_CONFIG_SITE = "site/glite/lfc_config";
variable LFC_CENTRAL_VOS = list('lal');
variable LFC_LOCAL_VOS = list('alice');
variable VOS = merge(LFC_CENTRAL_VOS, LFC_LOCAL_VOS);


include 'machine-types/grid/lfc';

#
# software repositories (should be last)
#
include PKG_REPOSITORY_CONFIG;
