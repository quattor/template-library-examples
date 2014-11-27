structure template repository/snapshot/sl6_epel_testing;


"name" = "sl6_epel_testing";
"owner" = "grid.support@lal.in2p3.fr";
"protocols" = list(
  nlist("name","http",
        "url",YUM_SNAPSHOT_ROOT_URL+"/"+YUM_SNAPSHOT_DATE+"/sl6_epel_testing")
);

