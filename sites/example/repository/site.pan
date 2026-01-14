structure template repository/site;

"name" = "site";
"owner" = "grid.support@lal.in2p3.fr";
"protocols" = list(
    dict(
        "name", "http",
        "url", YUM_SNAPSHOT_ROOT_URL + "/" + YUM_SNAPSHOT_DATE + "/site",
    ),
);
