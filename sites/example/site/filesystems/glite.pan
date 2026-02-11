# Define default filesystem layout for gLite nodes

template site/filesystems/glite;

include 'quattor/functions/filesystem';

variable DISK_SUP_DEV = {
    if (exists("/hardware/harddisks/sdb")) {
        return("sdb");
    } else if (exists("/hardware/harddisks/hdb")) {
        return("hdb");
    } else if (exists("/hardware/harddisks/xvdb")) {
        return("xvdb");
    } else {
        undef;
    };
};

#variable DISK_SUP_PARTS ?= list('lvm');
variable DISK_SUP_PARTS ?= list('');

# Scratch volume is a generic volume whose mount point can be changed according to site needs
variable DISK_GLITE_SCRATCH_SIZE ?= 0;
variable DISK_GLITE_SCRATCH_LOGVOL ?= 'scratch';
variable DISK_GLITE_SCRATCH_MOUNTPOINT ?= '/scratch';
#variable DISK_GLITE_SCRATCH_SIZE ?= if ( is_defined(DISK_SUP_DEV) ) {
#    -1;
#} else {
#    0;
#};

# Allow to redefine homevol mount point
variable DISK_GLITE_HOME_SIZE ?= 0 * GB;
variable DISK_GLITE_HOME_MOUNTPOINT ?= '/home';

variable DISK_GLITE_OPT_SIZE ?= 2 * GB;
variable DISK_GLITE_ROOT_SIZE ?= 1 * GB;
variable DISK_GLITE_SWAREAS_SIZE ?= 0 * GB;
variable DISK_GLITE_TMP_SIZE ?= 1 * GB;
variable DISK_GLITE_USR_SIZE ?= 5 * GB;
variable DISK_GLITE_VAR_SIZE ?= if ( DISK_GLITE_SCRATCH_SIZE == 0 ) {
    -1;
} else {
    10 * GB;
};


# Define default layout customizations for gLite nodes
variable DISK_VOLUME_PARAMS = filesystem_layout_mod(dict(
    'home', dict(
        'size', DISK_GLITE_HOME_SIZE,
        'mountpoint', DISK_GLITE_HOME_MOUNTPOINT,
    ),
    'opt', dict(
        'size', DISK_GLITE_OPT_SIZE,
    ),
    'root', dict(
        'size', DISK_GLITE_ROOT_SIZE,
    ),
    'scratch', dict(
        'size', DISK_GLITE_SCRATCH_SIZE,
        'type', 'lvm',
        'mountpoint', DISK_GLITE_SCRATCH_MOUNTPOINT,
        'volgroup', 'vg.01',
        'device', DISK_GLITE_SCRATCH_LOGVOL,
    ),
    'swareas', dict(
        'size', DISK_GLITE_SWAREAS_SIZE,
    ),
    'tmp', dict(
        'size', DISK_GLITE_TMP_SIZE,
    ),
    'usr', dict(
        'size', DISK_GLITE_USR_SIZE,
    ),
    'var', dict(
        'size', DISK_GLITE_VAR_SIZE,
    ),
));


# Redefine swap size if explicitly defined with variable NODE_SWAP_SIZE
variable DISK_VOLUME_PARAMS = {
    if ( is_defined(NODE_SWAP_SIZE) ) {
        filesystem_layout_mod(dict(
            'swap', dict(
                'size', NODE_SWAP_SIZE,
            ),
        ));
    } else {
        SELF;
    };
};
