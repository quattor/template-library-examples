# gLite site parameters template.
# Use it as a starting point to create a new site.
 
template site/glite/config;

# SITE DEFINITIONS --------------------------------------------------------
# For more information on the format of the following variable, see
# http://goc.grid.sinica.edu.tw/gocwiki/How_to_publish_my_site_information.
# ------------------------------------------------------------------------- 

variable SITE_EMAIL ?= "grid.support@example.org";
variable SITE_NAME ?= "Example";
variable SITE_LOC ?= "Middle, Nowhere";
variable SITE_LAT ?= 0.0;
variable SITE_LONG ?= 0.0;
variable SITE_WEB?="http://example.org/";
# If your site is not a WLCG site, remove WLCG_xxx entries.
# To find your ROC name, you can look at http://straylen.web.cern.ch/straylen/GlueSite/PlotEgeeProdGlueSites.html.
variable SITE_OTHER_INFO ?= nlist("WLCG_TIER", "2",
                                  "WLCG_PARENT", "MyT1",
                                  "EGEE_ROC", "MyROCName",
                                  "GRID", list("EGI","WLCG"),
                                  "EGI_NGI", "MY_NGI",
                                 );
# For a WLCG site, more information is required
#variable SITE_OTHER_INFO ?= nlist("WLCG_NAME", "FR-GRIF",
#                                  "WLCG_TIER", "2",
#                                  "WLCG_PARENT", "IN2P3-CC",
#                                  "EGEE_ROC", "FR",
#                                  "GRID", list("EGI","WLCG"),
#                                  "EGI_NGI", "NGI_FRANCE",
#                                 );



variable SITE_DOMAIN ?= "example.org";

variable INSTALL_DATE ?= "20060101120000Z";


# SUPPORTED VIRTUAL ORGANIZATIONS -----------------------------------------
# ------------------------------------------------------------------------- 

variable VOS ?= list(
  'alice',
  'atlas',
  'biomed',
  'cms',
  'dteam',
  'esr',
  'egeode',
  'hone',
  'ilc',
  'lhcb',
  'ops',
  'planck',
);

variable VOS_SITE_PARAMS = nlist ('DEFAULT', nlist('wms_hosts', 'wmslb.example.com',
                                                  ),
                                 );


# MYPROXY CONFIGURATION ---------------------------------------------------
# ------------------------------------------------------------------------- 

variable PX_HOST   ?= "px."+SITE_DOMAIN;

variable GRID_TRUSTED_BROKERS ?= list(
  "/C=FR/O=CNRS/OU=LAL/CN=grid09.lal.in2p3.fr/Email=grid.support@lal.in2p3.fr",
  "/O=GRID-FR/C=FR/O=CNRS/OU=LAL/CN=grid09.lal.in2p3.fr/Email=grid.support@lal.in2p3.fr",
  "/O=dutchgrid/O=hosts/OU=nikhef.nl/CN=boswachter.nikhef.nl",
  "/O=dutchgrid/O=hosts/OU=nikhef.nl/CN=bosheks.nikhef.nl",
);


# MON BOX PARAMETERS (R-GMA) ----------------------------------------------
# ------------------------------------------------------------------------- 

variable MON_HOST  ?= "mon."+SITE_DOMAIN;

variable MON_MYSQL_PASSWORD ?= "xxx";


# LCG RB ------------------------------------------------------------------
# -------------------------------------------------------------------------

variable RB_HOST   ?= "rb."+SITE_DOMAIN;


# gLite WMS ---------------------------------------------------------------
# -------------------------------------------------------------------------

variable WMSLB_MYSQL_PASSWORD ?= 'yyyy';


# STORAGE ELEMENT PARAMETERS ----------------------------------------------
# ------------------------------------------------------------------------- 

variable SE_HOSTS ?= nlist(
  "se-dpm-server."+SITE_DOMAIN,  nlist('type', 'SE_dpm'),
  "dcache-head."+SITE_DOMAIN,    nlist('type', 'SE_dcache','accessPoint','/pnfs/example'),
);

variable RFIO_ENABLED ?= true;


# COMPUTING ELEMENT PARAMETERS --------------------------------------------
# ------------------------------------------------------------------------- 

variable CE_HOSTS_CREAM ?= list("cream."+SITE_DOMAIN);
variable CE_HOSTS_LCG ?= list("ce."+SITE_DOMAIN);
variable CE_HOSTS ?= merge(CE_HOSTS_LCG,CE_HOSTS_CREAM);

# Location of CREAM sandboxes.
# Must match the location where the sandbox is mounted on the actual CE.
# There is one DEFAULT entry plus one entry per CE with a different
# mount point.
variable CREAM_SANDBOX_DIRS ?= nlist('DEFAULT', '/sandboxes');

# Build a list of mount points for CREAM sandbox based on the CE host name
variable CREAM_SANDBOX_MPOINTS ?= {
  foreach (i;ce;CE_HOSTS_CREAM) {
    SELF[ce] = '/cream_sandbox/'+ce;
  };
  SELF;
};


variable CE_BATCH_NAME ?= "torque2";

variable CE_CPU_MODEL      ?= "Opteron";
variable CE_CPU_VENDOR     ?= "AMD";
variable CE_CPU_SPEED      ?= "2200";
variable CE_SMPSIZE        ?= "2";

variable CE_SI00           ?= "380";
variable CE_SF00           ?= "400";

variable CE_OS             ?= "Scientific Linux";
variable CE_OS_RELEASE     ?= "3.0.5";

variable CE_MINPHYSMEM     ?= "2048";
variable CE_MINVIRTMEM     ?= "3072";

variable GIP_CE_USE_CACHE ?= true;

# CE_CLOSE_SE_LIST allows to specify a per VO close SE.
# Close SE will be used as default SE, if there is no explicit
# default SE definition
variable CE_CLOSE_SE_LIST ?= nlist(
  'DEFAULT',	"se-dpm-server."+SITE_DOMAIN,
);
# variable CE_DEFAULT_SE_LIST = nlist();

variable CE_QUEUES_SITE = {
  SELF['vos'] = nlist();
  SELF['attlist'] = nlist();

  # Add short deadline job queue.   
  SELF['vos']['sdj'] = list("biomed");

  SELF['attlist']['sdj'] = nlist(
    "queue_type", "Execution",
    "resources_max.cput", "00:10:00",
    "resources_max.walltime", "01:00:00",
    "enabled", true,
    "started", true,
  );

  SELF['attlist']['dteam'] = nlist(
    "queue_type", "Execution",
    "resources_max.cput", "02:00:00",
    "resources_max.walltime", "02:30:00",
    "enabled", true,
    "started", true,
  );

  SELF['attlist']['atlas'] = nlist(
    "queue_type", "Execution",
    "max_running", 20,
    "resources_max.cput", "24:00:00",
    "resources_max.walltime", "36:00:00",
    "enabled", true,
    "started", true,
  );

  SELF;
};

variable CE_VO_SHARES = nlist('atlas', 40,
                             );


# OTHER SERVICE LOCATIONS -------------------------------------------------
# ------------------------------------------------------------------------- 


variable LFC_HOSTS   ?= nlist(
 "lfc."+SITE_DOMAIN,     nlist('alias', 'lfcalias.'+SITE_DOMAIN),
);

variable GRIDICE_SERVER_HOST ?= MON_HOST;


# BDII CONFIGURATION ------------------------------------------------------
# ------------------------------------------------------------------------- 

variable TOP_BDII_HOST ?= "topbdii."+SITE_DOMAIN;

variable BDII_PASSWD ?= 'xxx';

variable GRIS_PORT ?= 2135;
variable BDII_PORT ?= 2170;

variable BDII_URLS ?= 
  nlist(
    "CE", "ldap://ce."+SITE_DOMAIN+":"+to_string(BDII_PORT)+"/mds-vo-name=resource,o=grid",
    "CREAM", "ldap://cream."+SITE_DOMAIN+":"+to_string(BDII_PORT)+"/mds-vo-name=resource,o=grid",
    "LFC", "ldap://lfc."+SITE_DOMAIN+":"+to_string(BDII_PORT)+"/mds-vo-name=resource,o=grid",
    "RB", "ldap://"+RB_HOST+":"+to_string(BDII_PORT)+"/mds-vo-name=resource,o=grid",
    "PX", "ldap://"+PX_HOST+":"+to_string(BDII_PORT)+"/mds-vo-name=resource,o=grid",
    "MON", "ldap://"+MON_HOST+":"+to_string(BDII_PORT)+"/mds-vo-name=resource,o=grid",
    "SE1", "ldap://se-dpm-server."+SITE_DOMAIN+":"+to_string(BDII_PORT)+"/mds-vo-name=resource,o=grid",
    "SE2", "ldap://dcache-head."+SITE_DOMAIN+":"+to_string(BDII_PORT)+"/mds-vo-name=resource,o=grid",
  );


# FTS SUPPORT ---------------------------------------------------------------
# ---------------------------------------------------------------------------
variable FTS_SERVER_HOST ?= "cclcgftsprod.in2p3.fr";


# NFS DEFINITIONS -----------------------------------------------------------
# --------------------------------------------------------------------------- 

variable NFS_WN_HOSTS         ?= "grid*."+SITE_DOMAIN;

variable NFS_SERVER ?= 'ce.'+SITE_DOMAIN;

variable NFS_THREADS = nlist(
  NFS_SERVER, 16,
);

# When NFS_AUTOFS is true, autofs is used to mount NFS filesystems
# rather than fstab. It is recommended to use autofs to avoid startup
# synchronization nightmares between NFS servers and clients...
# Default is false for backward compatibility, need to be defined explictly
variable NFS_AUTOFS ?= true;

# Relocate home directories on CE/WNs to NFS mount point
variable VO_HOMES_NFS_ROOT ?= '/vohome';


# Filesystems to export
# This is a nlist with one entry per filesystem and the NFS server as value
# Filesytem mount point must be escaped.
variable WN_SHARED_AREAS = nlist(
  escape("/vohome"), NFS_SERVER,
  escape("/swareas"), NFS_SERVER,
);

# WORKER NODE DEFINITIONS ---------------------------------------------------
# --------------------------------------------------------------------------- 
# Area on the WN for the installation of the experiment software 
# If on your WNs you have predefined shared areas where VO managers can
# pre-install software, then these variables should point to these areas.
# If you do not have shared areas and each job must install the software,
# then these variables should contain a dot ( . )

variable VO_SW_AREAS = nlist(
  'DEFAULT', '/swareas',
);


# Parent of home directories for VO accounts: create a subdirectory per VO
# to avoid to many entries in the same directory

variable VO_HOMES ?= nlist(
  'DEFAULT', '/home/@VONAME@',
);


# Shared Gridmapdir --------------------------------------------------------
# ---------------------------------------------------------------------------

variable GRIDMAPDIR_SHARED_PATH ?= '/gridmapdir_shared';
variable GRIDMAPDIR_SHARED_SERVER ?= 'ce.'+SITE_DOMAIN;


# USER INTERFACE DEFINITIONS ------------------------------------------------
# --------------------------------------------------------------------------- 

variable MYPROXY_DEFAULT_SERVER  ?= "px."+SITE_DOMAIN;

# MPI SUPPORT---------------------------------------------------------------
# --------------------------------------------------------------------------- 

variable ENABLE_MPI ?= true;


# APEL SUPPORT --------------------------------------------------------------
# --------------------------------------------------------------------------- 
variable APEL_ENABLED ?= true;
variable APEL_DB_PWD ?= "xxx";


# WORKER NODE DEFINITIONS  --------------------------------------------------
# --------------------------------------------------------------------------- 

variable WORKER_NODES ?= list(
  "wn."+SITE_DOMAIN,
  "wn2."+SITE_DOMAIN,
);


# TORQUE AND MAUI DEFINITIONS -----------------------------------------------
# ---------------------------------------------------------------------------

# Define number of process slots per CPU.
# Should be 2 to accomodate MAUI SRs
variable WN_CPU_SLOTS = 2;


# Define the number of CPU per machine.
# WN_CPUS_DEF defines default value, WN_CPUS lists exceptions
variable WN_CPUS_DEF = 4;
variable WN_CPUS = nlist(
  "wn."+SITE_DOMAIN, 2,
);


# MAUI DEFINITIONS ----------------------------------------------------------
# ---------------------------------------------------------------------------
# Do it only on CE to avoid unnecessary profile rebuild in case of change

variable MAUI_CONFIG_TEMPLATE = "site/glite/maui";
variable MAUI_CONFIG_INCLUDE = if ( index(FULL_HOSTNAME,CE_HOSTS) >= 0) {
                                 return(MAUI_CONFIG_TEMPLATE);
                               } else {
                                 return(null);
                               };
include { return(MAUI_CONFIG_INCLUDE) };


