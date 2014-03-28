structure template repository/snapshot/sl5_addons;


"name" = "sl5_addons";
"owner" = "grid.support@lal.in2p3.fr";
"protocols" = list(
  nlist("name","http",
        "url",YUM_SNAPSHOT_ROOT_URL+"/"+YUM_SNAPSHOT_DATE+"/sl5_addons")
);

"contents" = nlist(
# pkg = perl-JSON-XS-2.30-1.el5.rf-i386
escape("perl-JSON-XS-2.30-1.el5.rf-i386"),nlist("name","perl-JSON-XS","version","2.30-1.el5.rf","arch","i386"),
# pkg = perl-JSON-XS-2.30-1.el5.rf-x86_64
escape("perl-JSON-XS-2.30-1.el5.rf-x86_64"),nlist("name","perl-JSON-XS","version","2.30-1.el5.rf","arch","x86_64"),
);
