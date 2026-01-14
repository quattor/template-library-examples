structure template repository/el7x_x86_64;

"name" = "el7x_x86_64";
"owner" = "grid.support@lal.in2p3.fr";
"protocols" = list(
    dict(
        "name", "http",
        "url", YUM_SNAPSHOT_ROOT_URL + "/" + YUM_SNAPSHOT_DATE + "/" + YUM_OS_DISTRIBUTION_NAME + "-x86_64",
    ),
);
