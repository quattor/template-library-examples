structure template repository/CernVM-FS;

"name" = "cvmfs";
"owner" = "grid.support@lal.in2p3.fr";
"protocols" = list(
    dict(
        "name", "http",
        "url", YUM_SNAPSHOT_ROOT_URL + "/" + YUM_CVMFS_SNAPSHOT_DATE + "/cvmfs",
    ),
);
