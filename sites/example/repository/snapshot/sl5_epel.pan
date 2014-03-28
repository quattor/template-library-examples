structure template repository/snapshot/sl5_epel;


"name" = "sl5_epel";
"owner" = "grid.support@lal.in2p3.fr";
"protocols" = list(
  nlist("name","http",
        "url",YUM_SNAPSHOT_ROOT_URL+"/"+YUM_SNAPSHOT_DATE+"/sl5_epel")
);

"contents" = nlist(
# pkg = perl-common-sense-3.5-1.el5-noarch
escape("perl-common-sense-3.5-1.el5-noarch"),nlist("name","perl-common-sense","version","3.5-1.el5","arch","noarch"),
# pkg = perl-Proc-ProcessTable-0.48-1.el5-x86_64
escape("perl-Proc-ProcessTable-0.48-1.el5-x86_64"),nlist("name","perl-Proc-ProcessTable","version","0.48-1.el5","arch","x86_64"),
# pkg = perl-Set-Scalar-1.25-1.el5-noarch
escape("perl-Set-Scalar-1.25-1.el5-noarch"),nlist("name","perl-Set-Scalar","version","1.25-1.el5","arch","noarch"),
);
