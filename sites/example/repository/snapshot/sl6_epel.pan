structure template repository/snapshot/sl6_epel;


"name" = "sl6_epel";
"owner" = "grid.support@lal.in2p3.fr";
"protocols" = list(
  nlist("name","http",
        "url",YUM_SNAPSHOT_ROOT_URL+"/"+YUM_SNAPSHOT_DATE+"/sl6_epel")
);

"contents" = nlist(
# pkg = perl-common-sense-3.5-1.el6-noarch
escape("perl-common-sense-3.5-1.el6-noarch"),nlist("name","perl-common-sense","version","3.5-1.el6","arch","noarch"),
# pkg = perl-JSON-XS-2.27-2.el6-x86_64
escape("perl-JSON-XS-2.27-2.el6-x86_64"),nlist("name","perl-JSON-XS","version","2.27-2.el6","arch","x86_64"),
# pkg = perl-Proc-ProcessTable-0.48-1.el6-x86_64
escape("perl-Proc-ProcessTable-0.48-1.el6-x86_64"),nlist("name","perl-Proc-ProcessTable","version","0.48-1.el6","arch","x86_64"),
# pkg = perl-Set-Scalar-1.25-2.el6-noarch
escape("perl-Set-Scalar-1.25-2.el6-noarch"),nlist("name","perl-Set-Scalar","version","1.25-2.el6","arch","noarch"),
);
