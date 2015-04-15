structure template repository/opennebula;

include 'repository/basic';

"name" = "opennebula";
"protocols/0/url" = url_for_repo(format("opennebula-stable-el%s-x86_64", RPM_BASE_FLAVOUR_VERSIONID));

"excludepkgs" = append("nagios-plugins");
