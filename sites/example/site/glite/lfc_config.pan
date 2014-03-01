# Site specific configuration for a LFC server

template site/glite/lfc_config;

# DB params
variable LFC_DB_PARAMS ?= nlist(
    "password", "YourPrefClearPwd",
    "adminpwd", "YourPrefClearPwd",
);



