unique template site/dcache/node_config;

include 'components/dcache/config';

##
## General dcache config info
##

## for the adventurous people, make sure to also change PNFS_ROOT; )
#"/software/components/dcache/config/dc_dir" = "/opt/d-cache";

"/software/components/dcache/config/node_config_def" = list("etc/node_config.template");

variable NODE_CF ?= dict(
    "node_type", DCACHE_NODE_TYPE,
    "server_id", DCACHE_SERVER_ID,
    "admin_node", SE_DCACHE,
    "gsidcap", DOOR_GSIDCAP,
    "gridftp", DOOR_GRIDFTP,
    "srm", DOOR_SRM,
    "dcap", DOOR_DCAP,
    "xrootd", DOOR_XROOTD,
);

variable NOT_AN_ADMIN_NODE ?= dict(
    "lmDomain", "no",
    "httpDomain", "no",
    "pnfsManager", "no",
    "adminDoor", "no",
    "poolManager", "no",
    "utilityDomain", "no",
    "dirDomain", "no",
    "gPlazmaService", "no",
    "infoProvider", "no",
);



"/software/components/dcache/config/node_config" = {
    if(DCACHE_NODE_TYPE == "admin") {
        return(merge(NODE_CF, dict(
            "infoProvider", "yes",
            "gPlazmaService", "yes",
        )));
    } else {
        list = NODE_CF;
        list2 = NOT_AN_ADMIN_NODE;
        ok = first(list2, k, v);
        while(ok) {
            list[k] = v;
            ok = next(list2, k, v);
        };
        return(list);
    };
};
