unique template site/dcache/link;


## links
## default preference value
"/software/components/dcache/link/def_pref" = "10";
## list of links that will be ignored during configuration
"/software/components/dcache/link/ignore_link" = list();
## 
"/software/components/dcache/link/links"= nlist(
	## out_buf_write: all outside to write to the storage through this buffer
	"out",nlist("ugroup",list("all_net","any_store"),"pgroup",list("out_buf"),"read","10","write","10","cache","10"),
	"in",nlist("ugroup",list("in_net","any_store"),"pgroup",list("priv"),"read","20","write","20","cache","20"),
	"dteam",nlist("ugroup",list("dteam_store"),"pgroup",list("out_buf"),"read","10","write","10","cache","10"),
	"ops",nlist("ugroup",list("ops_store"),"pgroup",list("out_buf"),"read","10","write","10","cache","10"),
	"cms",nlist("ugroup",list("cms_store"),"pgroup",list("out_buf"),"read","10","write","10","cache","10"),
	"test",nlist("ugroup",list("test_store"),"pgroup",list("behar_test"),"read","10","write","10","cache","10"),
);	
	

