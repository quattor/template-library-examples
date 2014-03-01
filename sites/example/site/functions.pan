
declaration template site/functions;

#
# This function copies the network parameters in the global
# variable NETWORK_PARAMS (an nlist) to SELF.  Self must be
# an nlist and is usually at the path 
# /system/network/interfaces.
############################################################
function copy_network_params = {

  if (exists(SELF) && is_defined(SELF)) {
    tbl = SELF;
  } else {
    tbl = nlist();
  };

  # Assume one-to-one correspondence between NIC cards and device eth<n>.
  # Also assume that the same network parameters will be used for each
  # device.  Change this function if these assumptions are not true. 
  i = 0;
  while (i<length(value("/hardware/cards/nic"))) {
    tbl["eth"+to_string(i)] = NETWORK_PARAMS;
    i = i + 1;
  };
  return(tbl);
};

# Returns the number of cores on a hardware structure, given as argument.
function cores_in_hardware = {

    hw = ARGV[0];
    cores = 1;
    
    if (exists (hw["cpu"][0]["cores"]) && is_defined (hw["cpu"][0]["cores"])) {
	cores = hw["cpu"][0]["cores"];
    };

    return (length(hw["cpu"])*cores);
};

# Returns the number of cores on a given hardware template.
function cores_in_hw_template = {
     tpl = ARGV[0];
     hw = create (tpl);
     return (cores_in_hardware (hw));
};
