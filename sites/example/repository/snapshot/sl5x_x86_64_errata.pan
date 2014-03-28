structure template repository/snapshot/sl5x_x86_64_errata;


"name" = "sl5x_x86_64_errata";
"owner" = "grid.support@lal.in2p3.fr";
"protocols" = list(
  nlist("name","http",
        "url",YUM_SNAPSHOT_ROOT_URL+"/"+YUM_SNAPSHOT_DATE+"/sl5x-x86_64_errata")
);

