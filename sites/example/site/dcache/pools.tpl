unique template site/dcache/pools;

##
## Pool config
##

## ulimit_n can also be set per pool 
## (only the last value of every list of pools per poolnode is taken into account!!)
"/software/components/dcache/pool/default_ulimit_n" = "16384";

"/software/components/dcache/pool/default_mover_max" = "500";

## set the maximum promille of allocated space per pool based on real available space
## if not set, the default is 950 (=95%)
"/software/components/dcache/pool/max_true_pool_size_prom" = "990";

## ignore_pgroup are pgroups that are ignored during config. 
## pgroups that are not in this list or configured here otherwise, will be deleted.
variable CMS_VOS = list("cms");
variable NON_CMS_VOS = {
	tbl = VOS;
	tbl2 = CMS_VOS;
	tbl3 = list();
	ok = first(tbl,k,v);
  	while (ok) {
  		ok2 = first(tbl2,k2,v2);
  		while (ok2) {
  			add = true;
   			if(match(v,v2)) {
   				add = false;
   			};
   			if(add) {
   				tbl3[length(tbl)] = v;
   			};
   			ok2 = next(tbl2,k2,v2);		
   		};	
    	ok = next(tbl,k,v);
  	}; 
  	return(tbl3);
 }; 	

"/software/components/dcache/pool/ignore_pgroup" = list("default");
"/software/components/dcache/pool/pools"=nlist(
	## out_buf pgroup: for outside buffer reading and writing
	#"behar",list(nlist("path","/storage/1","pgroup",merge(CMS_VOS,list("out_buf")),"mover_max","1000"),
	#			  nlist("path","/storage/2","pgroup",merge(CMS_VOS,list("out_buf")),"mover_max","1000"),		
	#			  nlist("path","/storage/3","pgroup",merge(CMS_VOS,list("out_buf")),"mover_max","1000")),		
	"dcache-pool",list(nlist("path","/storage/1","pgroup",merge(list("out_buf","behar_test")),"mover_max","1000"),
				  nlist("path","/storage/2","pgroup",merge(list("out_buf","behar_test")),"mover_max","1000"),		
				  ),		
	
);

#"/software/components/dcache/pool/pools"= {
#	tbl = SELF;
#	list = WN_DACHE_POOLS;
#	ok = first(list,k,v);
# 	while (ok) {
#  		m = matches(v,"([^\\.]+)(\\.(.*))?");
#	tbl[m[1]] = list(nlist("path","/scratch/1","size","125","pgroup",list("wn_pool","ResilientPools"),"mover_max","1000"));
#    ok = next(list,k,v);
#  }; 
#  return(tbl);
#};
