unique template site/dcache/sitename;

## set this in the variable
## variable SEDCACHE_CONFIG_SITE = "dcache/sitename";

## name of the admin node
variable SE_DCACHE = "dcache-head.example.org";

## /pnfs/DCACHE_SERVER_ID
variable DCACHE_SERVER_ID = "example";

## namespace to look for DCACHE_SITE_NS + [dcache/pnfs, dcache/unit, dcache/pools, dcache/link and dcache/node_config]
## by changing this variable you can have multiple dcache setups per site
variable DCACHE_SITE_NS = "site/dcache";

## java version used by dcache
## default can be found in glite/se_dcache/dcache/rpms
variable DCACHE_JDK_VERSION = '1.5.0_10';
