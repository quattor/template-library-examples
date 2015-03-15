############################################################
#
# object template wn.example.org
#
# RESPONSIBLE: Charles Loomis
#
############################################################

object template wn.example.org;

include { 'machine-types/example/wn' };

#
# software repositories (should be last)
#
include { PKG_REPOSITORY_CONFIG };



