@maintainer{
  name = Jerome Pansanel
  email = jerome.pansanel@iphc.cnrs.fr
}

@{
  Example template that shows the configuration of an OpenStack Cloud
  Controller
}

object template cloud-controller.example.org;

include 'machine-types/openstack/cloud_controller';

#
# software repositories (should be last)
#
include PKG_REPOSITORY_CONFIG;
