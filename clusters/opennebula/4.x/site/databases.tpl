template site/databases;

# Defines the mapping between the full hostname and the IP
# address.
final variable DB_IP = nlist(
    escape("one"),"10.141.2.11",
    escape("hyp01"), "10.141.2.21",
    escape("vm"), "10.141.2.31",
);

# Defines the mapping between the full hostname and the
# physical machine.
# A different hardware template must be used for each machine
final variable DB_MACHINE = nlist(
    escape("one"),"hardware/machine/ibm/x3550/x_KDWGDMW",
    escape("hyp01"),"hardware/machine/ibm/hs21xm/blade_99H0888",
    escape("vm"), "hardware/machine/one/example",
);
