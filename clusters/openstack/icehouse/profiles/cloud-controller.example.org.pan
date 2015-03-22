###############################################################################
#
# object template cloud-controller.example.org.pan
#
# RESPONSIBLE: Jerome Pansanel
#
###############################################################################


object template cloud-controller.example.org;

include { 'machine-types/openstack/cloud_controller' };

#
# software repositories (should be last)
#
include { PKG_REPOSITORY_CONFIG };
