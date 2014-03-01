structure template config/example_nodes_properties;

"example" ?= nlist(


escape("node06.org.fr"), nlist("type","MON", "monitoring","yes", "os", "sl460-x86_64", "ip","255.255.255.21" , "hardware","virtual_machine_6"),
escape("node16.org.fr"), nlist("type","CE-MPI", "monitoring","yes", "os","sl450-x86_64", "ip","255.255.255.43" , "hardware","virtual_machine_1"),
escape("node21.org.fr"), nlist("type","VOBOX", "monitoring","yes", "os", "sl460-x86_64", "ip","255.255.255.48" , "hardware","virtual_machine_5"),
escape("node25.org.fr"), nlist("type","OTHER", "monitoring","yes", "os","sl450-x86_64", "ip","255.255.255.84" , "hardware","virtual_machine_2"),
escape("node52.org.fr"), nlist("type","AII", "monitoring","yes", "os","sl460-x86_64", "ip","255.255.255.182" , "hardware","virtual_machine_4"),
escape("node59.org.fr"), nlist("type","NAGIOS", "monitoring","yes", "os","sl460-x86_64", "ip","255.255.255.189" , "hardware","virtual_machine_3"),
###
#escape("node15.org.fr"), nlist("type","LEMON", "monitoring","no", "os", "sl460-i386", "ip","255.255.255.42" , "hardware","virtual_machine_9"),
escape("node01.org.fr"), nlist("type","VOBOX", "monitoring","yes", "os","sl460-x86_64", "ip","255.255.255.16" , "hardware","virtual_machine_10"),
escape("node14.org.fr"), nlist("type","LFC", "monitoring","yes", "os","sl460-x86_64", "ip","255.255.255.41" , "hardware","virtual_machine_11"),
escape("gate01.org.fr"), nlist("type","OTHER", "monitoring","yes", "os","sl460-x86_64", "ip","255.255.255.1" , "hardware","virtual_machine_12"),
escape("node07.org.fr"), nlist("type","CE", "monitoring","yes", "os", "sl440-i386", "ip","255.255.255.22" , "hardware","pro_hardware_machine_141_10_ibm_e326m_CE_node07"),
escape("node27.org.fr"), nlist("type","WMS", "monitoring","yes", "os", "sl460-i386", "ip","255.255.255.101" , "hardware","pro_hardware_machine_141_10_ibm_e326m_WMS_node27"),
escape("node04.org.fr"), nlist("type","WMS", "monitoring","yes", "os", "sl460-i386", "ip","255.255.255.19" , "hardware","pro_hardware_machine_141_10_ibm_e326m_41"),

);
