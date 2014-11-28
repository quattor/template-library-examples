structure template repository/snapshot/sl6_addons;


"name" = "sl6_addons";
"owner" = "grid.support@lal.in2p3.fr";
"protocols" = list(
  nlist("name","http",
        "url",YUM_SNAPSHOT_ROOT_URL+"/"+YUM_SNAPSHOT_DATE+"/sl6_addons")
);

"contents" = nlist(
escape("perl-JSON-XS-2.30-1.el6.rf-x86_64"),nlist("name","perl-JSON-XS","version","2.30-1.el6.rf","arch","x86_64"),
);
