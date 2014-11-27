structure template repository/snapshot/ca;


"name" = "ca";
"owner" = "grid.support@lal.in2p3.fr";
"protocols" = list(
  nlist("name","http",
        "url",YUM_SNAPSHOT_ROOT_URL+"/"+YUM_CA_RPM_SNAPSHOT_DATE+"/egi_ca")
);

