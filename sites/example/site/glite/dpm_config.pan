#
# Template to define a DPM configuration
#

template site/glite/dpm_config;

# DPM vrsion to use by default
variable DPM_VERSION ?= '1.8.10';

# Just for convenience, this variable is not used by standard templates
variable DPM_HEAD_NODE ?= 'se-dpm-server.example.org';

# A 40 character hexadecimal string
variable DMLITE_TOKEN_PASSWORD ?= '1234567890123456789012345678901234567890';

variable DPM_DB_PARAMS ?= dict(
    "password", "YourPrefClearPwd",
    "adminuser", "root",
    "adminpwd", "YourPrefClearPwd",
);

variable DPM_XROOTD_SHARED_KEY = 'DXjgDTkK55fnyFr8gW1RcYv0pV7vkcWmZyHr9f4aoc8=';
variable DPM_XROOT_PARAMS ?= dict(
    "exportedVOs", list("atlas", "lhcb", "vo.lal.in2p3.fr"),
    "accessRules", list(dict(
        'path', '/',
        'authenticated', list('delete', 'write', 'write-once'),
        'unauthenticated', list('read'),
    )),
    "MonALISAHost", "aliendb2.cern.ch",
);

# Xrootd federation paramaters
variable XROOTD_FEDERATION_PARAMS = dict(
    'atlas', dict('fedredir', 'atlas-xrd-fr.cern.ch'),
    'cms', dict('fedredir', 'xrootd.ba.infn.it'),
);
#variable XROOTD_FEDERATION_LIST = list('atlas','cms');
variable XROOTD_FEDERATION_LIST = 'atlas';

#variable DPM_ACCESS_PROTOCOLS = list('gsiftp','rfio','https','xroot');
variable DPM_ACCESS_PROTOCOLS = list('gsiftp', 'rfio', 'xroot');

variable DPM_HOSTS = dict(
    "dpm", list(DPM_HEAD_NODE),
    "dpns", list(DPM_HEAD_NODE),
    "copyd", list(DPM_HEAD_NODE),
    "srmv1", list(DPM_HEAD_NODE),
    "srmv22", list(DPM_HEAD_NODE),
    "disk", list(
        DPM_HEAD_NODE,
        'se-dpm-disk.example.org',
        'se-dpm-disk2.example.org',
    ),
);

variable DPM_SERVICE_PARAMS = dict(
    "dpm", dict(
        "allowCoreDump", true,
        "fastThreads", 30,
        "requestMaxAge", '90d',
    ),
);



