unique template site/dcache/unit;


## unit/ugroups
## list of ugroups that will be ignored during configuration
"/software/components/dcache/unit/ignore_ugroup" = list();
"/software/components/dcache/unit/units" = nlist(
	"protocol",list(
		nlist("cond","*/*","ugroup",list("default_protocol"))
	),
	"net",list(
		nlist("cond","192.168.0.0/255.255.0.0","ugroup",list("in_net","all_net")),
	           nlist("cond","192.168.10.0/255.255.255.0","ugroup",list("in_server","in_net","all_net")),
	           nlist("cond","192.168.11.0/255.255.255.0","ugroup",list("in_wn","in_net","all_net")),
	           nlist("cond","192.168.12.0/255.255.255.0","ugroup",list("in_wn","in_net","all_net")),
	           nlist("cond","192.168.13.0/255.255.255.0","ugroup",list("in_wn","in_net","all_net")),
	           nlist("cond","192.168.14.0/255.255.255.0","ugroup",list("in_wn","in_net","all_net")),
	           nlist("cond","192.168.15.0/255.255.255.0","ugroup",list("in_wn","in_net","all_net")),
	           nlist("cond","192.168.16.0/255.255.255.0","ugroup",list("in_wn","in_net","all_net")),
	           nlist("cond","192.168.17.0/255.255.255.0","ugroup",list("in_wn","in_net","all_net")),
			   nlist("cond","0.0.0.0/0.0.0.0","ugroup",list("all_net")),
			   ),
	"store",list(nlist("cond","*@*","ugroup",list("any_store")),
				nlist("cond","myStore:STRING@osm","ugroup",list("default_store","any_store")),
				nlist("cond","dteam:dteam-base@osm","ugroup",list("dteam_store","any_store")),
				nlist("cond","ops:ops-base@osm","ugroup",list("ops_store","any_store")),
				nlist("cond","cms:cms-base@osm","ugroup",list("cms_store","any_store")),
				nlist("cond","test:cms-test@osm","ugroup",list("test_store")),
				),
);
