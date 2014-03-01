# Define default filesystem layout for gLite nodes using an extended
# partition and logical partitions.

template site/filesystems/extended;

include { 'quattor/functions/filesystem' };

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
variable DISK_GLITE_SCRATCH_MOUNTPOINT ?= '/scratch';;
#variable DISK_GLITE_SCRATCH_SIZE ?= if ( is_defined(DISK_SUP_DEV) ) {
#                               -1;
#                             } else {
#                               0;
#                             };

# Allow to redefine homevol mount point
variable DISK_GLITE_BOOT_SIZE ?= 256*MB;
variable DISK_GLITE_HOME_SIZE ?= 0*GB;
variable DISK_GLITE_HOME_MOUNTPOINT ?= '/home';

variable DISK_GLITE_OPT_SIZE ?= 2*GB;
variable DISK_GLITE_ROOT_SIZE ?= 1*GB;
variable DISK_GLITE_SWAREAS_SIZE ?= 0*GB;
variable DISK_GLITE_TMP_SIZE ?= 1*GB;
variable DISK_GLITE_USR_SIZE ?= 5*GB;
variable DISK_GLITE_VAR_SIZE ?= if ( DISK_GLITE_SCRATCH_SIZE == 0 ) {
                                 -1;
                               } else {
                                 10*GB;
                               };

# An ordered list of partition. Index will be used to build device name (index+1).
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
variable DISK_VOLUME_PARAMS = filesystem_layout_mod(nlist(
  'boot',          nlist('size', DISK_GLITE_BOOT_SIZE),
  'home',          nlist('size', DISK_GLITE_HOME_SIZE,
                         'mountpoint', DISK_GLITE_HOME_MOUNTPOINT,
                         'type', 'partition',
                         'device', DISK_BOOT_DEV+DISK_BOOT_PART_PREFIX+to_string(index('home',DISK_GLITE_PARTS)+1)),
  'opt',           nlist('size', DISK_GLITE_OPT_SIZE,
                         'type', 'partition',
                         'device', DISK_BOOT_DEV+DISK_BOOT_PART_PREFIX+to_string(index('opt',DISK_GLITE_PARTS)+1)),
  'root',          nlist('size', DISK_GLITE_ROOT_SIZE),
  'scratch',       nlist('size', DISK_GLITE_SCRATCH_SIZE,
                         'mountpoint', DISK_GLITE_SCRATCH_MOUNTPOINT,
                         'type', 'partition',
                         'device', DISK_BOOT_DEV+DISK_BOOT_PART_PREFIX+to_string(index('scratch',DISK_GLITE_PARTS)+1)),
  'swareas',        nlist('size', DISK_GLITE_SWAREAS_SIZE,
                         'type', 'partition',
                         'device', DISK_BOOT_DEV+DISK_BOOT_PART_PREFIX+to_string(index('swareas',DISK_GLITE_PARTS)+1)),
  'tmp',           nlist('size', DISK_GLITE_TMP_SIZE,
                         'type', 'partition',
                         'device', DISK_BOOT_DEV+DISK_BOOT_PART_PREFIX+to_string(index('tmp',DISK_GLITE_PARTS)+1)),
  'usr',           nlist('size', DISK_GLITE_USR_SIZE,
                         'type', 'partition',
                         'device', DISK_BOOT_DEV+DISK_BOOT_PART_PREFIX+to_string(index('usr',DISK_GLITE_PARTS)+1)),
  'var',           nlist('size', DISK_GLITE_VAR_SIZE,
                         'type', 'partition',
                         'device', DISK_BOOT_DEV+DISK_BOOT_PART_PREFIX+to_string(index('var',DISK_GLITE_PARTS)+1)),

  'vg.01',         nlist('size', 0),

));


# Redefine swap size if explicitly defined with variable NODE_SWAP_SIZE
variable DISK_VOLUME_PARAMS = {
  if ( is_defined(NODE_SWAP_SIZE) ) {
    filesystem_layout_mod(nlist('swap', nlist('size', NODE_SWAP_SIZE)));
  } else {
    SELF;
  };
};
