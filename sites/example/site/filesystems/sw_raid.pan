# Define default filesystem layout for gLite nodes using an extended
# partition and logical partitions + SW raid.
# The example uses a raid1 device for everything except scratch which is
# configured as raid0. This can be tuned to your need, there is not a required
# configuration!

template site/filesystems/sw_raid;

include 'quattor/functions/filesystem';

variable DISK_SUP_DEV = {
    if (exists("/hardware/harddisks/sdb")) {
        return("sdb");
    } else if (exists("/hardware/harddisks/hdb")) {
        return("hdb");
    } else if (exists("/hardware/harddisks/xvdb")) {
        return("xvdb");
    } else {
        error("Second disk required for SW raid but not found");
    };
};

#variable DISK_SUP_PARTS ?= list('lvm');
variable DISK_SUP_PARTS ?= list('');

# Default raid level to use
variable DISK_GLITE_DEFAULT_RAID_LEVEL ?= 1;

# Scratch volume is a generic volume whose mount point can be changed according to site needs
variable DISK_GLITE_SCRATCH_SIZE ?= 0;
variable DISK_GLITE_SCRATCH_LOGVOL ?= 'scratch';
variable DISK_GLITE_SCRATCH_MOUNTPOINT ?= '/scratch';
variable DISK_GLITE_SCRATCH_RAID_LEVEL ?= 0;
#variable DISK_GLITE_SCRATCH_SIZE ?= if ( is_defined(DISK_SUP_DEV) ) {
#    -1;
#} else {
#    0;
#};

# Allow to redefine homevol mount point
variable DISK_GLITE_HOME_SIZE ?= 0 * GB;
variable DISK_GLITE_HOME_MOUNTPOINT ?= '/home';

variable DISK_GLITE_BOOT_SIZE ?= 256 * MB;
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

# An ordered list of partition. Index will be used to build device name (index + 1).
# Value is an arbitrary string but 4 first entries must not be used here (used by standard
# configuration template).
variable DISK_GLITE_PARTS = list(
    'boot',
    'root',
    'swap',
    'extended',
    'usr',
    'var',
    'tmp',
    'opt',
    'home',
    'scratch',
    'swareas',
);

# Define default layout customizations for gLite nodes
variable DISK_VOLUME_PARAMS = filesystem_layout_mod(dict(
    # Explicit definition of partitions to be used with raid1.
    # Also define a partition on the second disk (even though it is not used) for every
    # partition on the first disk which is not part of an md device to ensure the layout
    # is the same on both disks.
    'raid_scratch_1', dict(
        'size', DISK_GLITE_SCRATCH_SIZE,
        'type', 'partition',
        'device', DISK_BOOT_DEV + DISK_BOOT_PART_PREFIX + to_string(index('scratch', DISK_GLITE_PARTS) + 1),
    ),
    'raid_swap_2', dict(
        'size', DISK_SWAP_SIZE,
        'type', 'partition',
        'device', DISK_SUP_DEV + DISK_BOOT_PART_PREFIX + to_string(index('swap', DISK_GLITE_PARTS) + 1),
    ),
    'raid_scratch_2', dict(
        'size', DISK_GLITE_SCRATCH_SIZE,
        'type', 'partition',
        'device', DISK_SUP_DEV + DISK_BOOT_PART_PREFIX + to_string(index('scratch', DISK_GLITE_PARTS) + 1),
    ),

    # Define MD devices. Size is defined there, except for raid0.
    'md' + to_string(index('boot', DISK_GLITE_PARTS) + 1), dict(
        'type', 'md',
        'raid_level', DISK_GLITE_DEFAULT_RAID_LEVEL,
        'size', DISK_GLITE_BOOT_SIZE,
        'devices', list(
            DISK_BOOT_DEV + DISK_BOOT_PART_PREFIX + to_string(index('boot', DISK_GLITE_PARTS) + 1),
            DISK_SUP_DEV + DISK_BOOT_PART_PREFIX + to_string(index('boot', DISK_GLITE_PARTS) + 1),
        ),
    ),
    'md' + to_string(index('home', DISK_GLITE_PARTS) + 1), dict(
        'type', 'md',
        'raid_level', DISK_GLITE_DEFAULT_RAID_LEVEL,
        'size', DISK_GLITE_HOME_SIZE,
        'devices', list(
            DISK_BOOT_DEV + DISK_BOOT_PART_PREFIX + to_string(index('home', DISK_GLITE_PARTS) + 1),
            DISK_SUP_DEV + DISK_BOOT_PART_PREFIX + to_string(index('home', DISK_GLITE_PARTS) + 1),
        ),
    ),
    'md' + to_string(index('opt', DISK_GLITE_PARTS) + 1), dict(
        'type', 'md',
        'raid_level', DISK_GLITE_DEFAULT_RAID_LEVEL,
        'size', DISK_GLITE_OPT_SIZE,
        'devices', list(
            DISK_BOOT_DEV + DISK_BOOT_PART_PREFIX + to_string(index('opt', DISK_GLITE_PARTS) + 1),
            DISK_SUP_DEV + DISK_BOOT_PART_PREFIX + to_string(index('opt', DISK_GLITE_PARTS) + 1),
        ),
    ),
    'md' + to_string(index('root', DISK_GLITE_PARTS) + 1), dict(
        'type', 'md',
        'raid_level', DISK_GLITE_DEFAULT_RAID_LEVEL,
        'size', DISK_GLITE_ROOT_SIZE,
        'devices', list(
            DISK_BOOT_DEV + DISK_BOOT_PART_PREFIX + to_string(index('root', DISK_GLITE_PARTS) + 1),
            DISK_SUP_DEV + DISK_BOOT_PART_PREFIX + to_string(index('root', DISK_GLITE_PARTS) + 1),
        ),
    ),
    'md' + to_string(index('swareas', DISK_GLITE_PARTS) + 1), dict(
        'type', 'md',
        'raid_level', DISK_GLITE_DEFAULT_RAID_LEVEL,
        'size', DISK_GLITE_SWAREAS_SIZE,
        'devices', list(
            DISK_BOOT_DEV + DISK_BOOT_PART_PREFIX + to_string(index('swareas', DISK_GLITE_PARTS) + 1),
            DISK_SUP_DEV + DISK_BOOT_PART_PREFIX + to_string(index('swareas', DISK_GLITE_PARTS) + 1),
        ),
    ),
    'md' + to_string(index('scratch', DISK_GLITE_PARTS) + 1), dict(
        'type', 'md',
        'raid_level', DISK_GLITE_SCRATCH_RAID_LEVEL,
        'size', DISK_GLITE_SCRATCH_SIZE,
        'devices', list(
            'raid_scratch_1',
            'raid_scratch_2',
        ),
    ),
    'md' + to_string(index('tmp', DISK_GLITE_PARTS) + 1), dict(
        'type', 'md',
        'raid_level', DISK_GLITE_DEFAULT_RAID_LEVEL,
        'size', DISK_GLITE_TMP_SIZE,
        'devices', list(
            DISK_BOOT_DEV + DISK_BOOT_PART_PREFIX + to_string(index('tmp', DISK_GLITE_PARTS) + 1),
            DISK_SUP_DEV + DISK_BOOT_PART_PREFIX + to_string(index('tmp', DISK_GLITE_PARTS) + 1),
        ),
    ),
    'md' + to_string(index('usr', DISK_GLITE_PARTS) + 1), dict(
        'type', 'md',
        'raid_level', DISK_GLITE_DEFAULT_RAID_LEVEL,
        'size', DISK_GLITE_USR_SIZE,
        'devices', list(
            DISK_BOOT_DEV + DISK_BOOT_PART_PREFIX + to_string(index('usr', DISK_GLITE_PARTS) + 1),
            DISK_SUP_DEV + DISK_BOOT_PART_PREFIX + to_string(index('usr', DISK_GLITE_PARTS) + 1),
        ),
    ),
    'md' + to_string(index('var', DISK_GLITE_PARTS) + 1), dict(
        'type', 'md',
        'raid_level', DISK_GLITE_DEFAULT_RAID_LEVEL,
        'size', DISK_GLITE_VAR_SIZE,
        'devices', list(
            DISK_BOOT_DEV + DISK_BOOT_PART_PREFIX + to_string(index('var', DISK_GLITE_PARTS) + 1),
            DISK_SUP_DEV + DISK_BOOT_PART_PREFIX + to_string(index('var', DISK_GLITE_PARTS) + 1),
        ),
    ),

    # Define file systems to use.
    # Redefine size for boot to ensure this is consistent between both disks.
    # For many file systems, default is defined in standard/filesystem/config.
    # Even though if it is useless in itself define size for swareas as it is 0 by default.
    'boot', dict(
        'size', DISK_GLITE_BOOT_SIZE,
        'type', 'raid',
        'device', 'md' + to_string(index('boot', DISK_GLITE_PARTS) + 1),
    ),
    'home', dict(
        'mountpoint', DISK_GLITE_HOME_MOUNTPOINT,
        'type', 'raid',
        'device', 'md' + to_string(index('home', DISK_GLITE_PARTS) + 1),
    ),
    'opt', dict(
        'type', 'raid',
        'device', 'md' + to_string(index('opt', DISK_GLITE_PARTS) + 1),
    ),
    'root', dict(
        'type', 'raid',
        'device', 'md' + to_string(index('root', DISK_GLITE_PARTS) + 1),
    ),
    'scratch', dict(
        'type', 'raid',
        'mountpoint', DISK_GLITE_SCRATCH_MOUNTPOINT,
        'device', 'md' + to_string(index('scratch', DISK_GLITE_PARTS) + 1),
    ),
    'swareas', dict(
        'type', 'raid',
        'size', DISK_GLITE_SWAREAS_SIZE,
        'device', 'md' + to_string(index('swareas', DISK_GLITE_PARTS) + 1),
    ),
    'tmp', dict(
        'type', 'raid',
        'device', 'md' + to_string(index('tmp', DISK_GLITE_PARTS) + 1),
    ),
    'usr', dict(
        'type', 'raid',
        'device', 'md' + to_string(index('usr', DISK_GLITE_PARTS) + 1),
    ),
    'var', dict(
        'type', 'raid',
        'device', 'md' + to_string(index('var', DISK_GLITE_PARTS) + 1),
    ),
    'vg.01', dict(
        'size', 0,
    ),
));

# Redefine swap size if explicitly defined with variable NODE_SWAP_SIZE
variable DISK_VOLUME_PARAMS = {
    if (is_defined(NODE_SWAP_SIZE)) {
        filesystem_layout_mod(dict(
            'swap', dict(
                'size', NODE_SWAP_SIZE,
            ),
        ));
    } else {
        SELF;
    };
};
