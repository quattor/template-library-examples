structure template repository/el7_epel;

"name" = "el7_epel";
"owner" = "grid.support@lal.in2p3.fr";
"protocols" = list(
    dict(
        "name", "http",
        "url", YUM_SNAPSHOT_ROOT_URL + "/" + YUM_EPEL_SNAPSHOT_DATE + "/el7_epel",
    ),
);
