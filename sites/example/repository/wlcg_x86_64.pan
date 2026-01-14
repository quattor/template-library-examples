structure template repository/wlcg_x86_64;

"name" = "wlcg_x86_64";
"owner" = "grid.support@lal.in2p3.fr";
"protocols" = list(
    dict(
        "name", "http",
        "url", YUM_SNAPSHOT_ROOT_URL + "/" + YUM_SNAPSHOT_DATE + "/wlcg-x86_64",
    ),
);
