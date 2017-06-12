# Illustrates how to refine layouts, based on a RAL configuration...
# (thus the name of the template and some variables...)

unique template site/filesystems/ral-wn;

include 'pan/units';

# Delete a few file systems created by default
variable DISK_GLITE_HOME_SIZE ?= 0;
variable DISK_GLITE_OPT_SIZE ?= 0;
variable DISK_GLITE_SCRATCH_SIZE ?= 0;
variable DISK_GLITE_SWAREAS_SIZE ?= 0;
variable DISK_GLITE_USR_SIZE ?= 0;

# RAL specific partitions on WN
variable DISK_RAL_AFSCACHE_SIZE ?= 2 * GB;
variable DISK_RAL_AFSCACHE_MOUNTPOINT ?= '/afscache';
variable DISK_RAL_HOMEPOOL_SIZE ?= 2 * GB;
variable DISK_RAL_HOMEPOOL_MOUNTPOINT ?= '/home/pool';
variable DISK_RAL_PBSPOOL_SIZE ?= 2 * GB;
variable DISK_RAL_PBSPOOL_MOUNTPOINT ?= '/pbspool';
variable DISK_RAL_POOL_SIZE ?= 2 * GB;
variable DISK_RAL_POOL_MOUNTPOINT ?= '/pool';

# Define a pool of unit number to use for RAL specific units
# DISK_RAL_PART_OFFSET should be large enough to avoid any conflict with
# standard DISK_GLITE_PARTS. It will be added to any partition declared here.
variable DISK_RAL_PART_OFFSET ?= 20;
variable DISK_RAL_PARTS ?= list(
    'afscache',
    'homepool',
    'pbspool',
    'pool',
);


# Include base layout (modified by DISK_GLITE_xxx variables)
include 'site/filesystems/extended';


# Add RAL-specific file systems
# Define default layout customizations for gLite nodes
variable DISK_VOLUME_PARAMS = filesystem_layout_mod(dict(
    'afscache', dict(
        'size', DISK_RAL_AFSCACHE_SIZE,
        'mountpoint', DISK_RAL_AFSCACHE_MOUNTPOINT,
        'type', 'partition',
        'device', format(
            '%s%s%s',
            DISK_BOOT_DEV,
            DISK_BOOT_PART_PREFIX,
            DISK_RAL_PART_OFFSET + index('afscache', DISK_RAL_PARTS) + 1,
        ),
    ),
    'homepool', dict(
        'size', DISK_RAL_AFSCACHE_SIZE,
        'mountpoint', DISK_RAL_AFSCACHE_MOUNTPOINT,
        'type', 'partition',
        'device', format(
            '%s%s%s',
            DISK_BOOT_DEV,
            DISK_BOOT_PART_PREFIX,
            DISK_RAL_PART_OFFSET + index('homepool', DISK_RAL_PARTS) + 1,
        ),
    ),
    'pbspool', dict(
        'size', DISK_RAL_AFSCACHE_SIZE,
        'mountpoint', DISK_RAL_AFSCACHE_MOUNTPOINT,
        'type', 'partition',
        'device', format(
            '%s%s%s',
            DISK_BOOT_DEV,
            DISK_BOOT_PART_PREFIX,
            DISK_RAL_PART_OFFSET + index('pbspool', DISK_RAL_PARTS) + 1,
        ),
    ),
    'pool', dict(
        'size', DISK_RAL_AFSCACHE_SIZE,
        'mountpoint', DISK_RAL_AFSCACHE_MOUNTPOINT,
        'type', 'partition',
        'device', format(
            '%s%s%s',
            DISK_BOOT_DEV,
            DISK_BOOT_PART_PREFIX,
            DISK_RAL_PART_OFFSET + index('pool', DISK_RAL_PARTS) + 1,
        ),
    ),
));
