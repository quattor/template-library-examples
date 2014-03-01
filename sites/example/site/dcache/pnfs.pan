unique template site/dcache/pnfs;

## currently, this is the only possible value
## variable PNFS_ROOT = "/pnfs";
## in case you really want to change it, make sure to modify it in 
## pnfs/pnfs_config, pnfs/exports, config/node_config, config/dCacheSetup

## 
## pnfs config
##

## specify the files to use to set the not-defined values.
## first files will have higher priority
## absolute path or relative from /opt/pnfs or as defined in /software/components/dcache/pnfs_config/pnfs_install_dir
## the default values are parsed before the new ones, so current files can be used

"/software/components/dcache/pnfs/pnfs_config_def" = list("etc/pnfs_config.template");
"/software/components/dcache/pnfs/pnfs_config" = nlist(
#	"pnfs_root",PNFS_ROOT
	"pnfs_log",DCACHE_LOG_DIR,
);

"/software/components/dcache/pnfs/pnfs_setup_def" = list("pnfsSetup");
"/software/components/dcache/pnfs/pnfs_setup" = nlist(
	"shmservers","20"
);

## for exports: ip either is host-address or subnet (+netmask)
"/software/components/dcache/pnfs/exports" = list(
	nlist("ip","193.190.246.0",
		"netmask","255.255.255.0",
		"rule",list(nlist("mount","/pnfs","path","/0/root/fs/usr/","perm","30","opt","nooptions")
			)),
	nlist("ip","192.168.10.0",
		"netmask","255.255.255.0",
		"rule",list(nlist("mount","/pnfsdoors","path","/0/root/fs/usr/","perm","0","opt","nooptions")
		)),	
	nlist("ip","193.190.246.232",
		"rule",list(nlist("mount","/pnfsdoors","path","/0/root/fs/usr/","perm","0","opt","nooptions")
		)),		
	nlist("ip","193.190.246.222",
		"rule",list(nlist("mount","/pnfsdoors","path","/0/root/fs/usr/","perm","0","opt","nooptions")
		)),		
	nlist("ip","193.190.246.281",
		"rule",list(nlist("mount","/pnfsdoors","path","/0/root/fs/usr/","perm","0","opt","nooptions")
		)),		
	nlist("ip","193.190.246.202",
		"rule",list(nlist("mount","/pnfsdoors","path","/0/root/fs/usr/","perm","0","opt","nooptions")
		)),		
	nlist("ip","193.190.246.92",
		"rule",list(nlist("mount","/pnfsdoors","path","/0/root/fs/usr/","perm","0","opt","nooptions")
		)),		
	nlist("ip","193.190.246.203",
		"rule",list(nlist("mount","/pnfsdoors","path","/0/root/fs/usr/","perm","0","opt","nooptions")
		)),		
	nlist("ip","192.168.10.6",
		"rule",list(nlist("mount","/pnfs","path","/0/root/fs/usr/","perm","30","opt","nooptions")
		)),	
	nlist("ip","192.168.10.16",
		"rule",list(nlist("mount","/pnfs","path","/0/root/fs/usr/","perm","30","opt","nooptions")
		)),	
	nlist("ip","192.168.10.18",
		"rule",list(nlist("mount","/pnfs","path","/0/root/fs/usr/","perm","30","opt","nooptions")
		)),	
	nlist("ip","192.168.10.19",
		"rule",list(nlist("mount","/pnfs","path","/0/root/fs/usr/","perm","30","opt","nooptions")
		)),	
	nlist("ip","192.168.0.0",
		"netmask","255.255.0.0",
		"rule",list(nlist("mount","/pnfs","path","/0/root/fs/usr/","perm","30","opt","nooptions")
			)),
	nlist("ip","127.0.0.1",
		"rule",list(nlist("mount","/fs","path","/0/root/fs","perm","0","opt","nooptions"),
					nlist("mount","/admin","path","/0/root/fs/admin","perm","0","opt","nooptions")))
);					

## databases for pnfs
## path: either relative (from /PNFS_ROOT/DCACHE_SERVER_ID/) or absolute.
## for all vo: vo + vo/generated
## the generated part is overkill atm
#variable VOS_TMP = list("betest","becms","beapps","cms","dteam");

"/software/components/dcache/pnfs/databases" = {
  list = VOS;
  if (exists(SELF) && is_list(SELF)) {
    tbl = SELF;
  } else {
    tbl = list();
  }; 
  ok = first(list,k,v);
  while (ok) {
	tbl[length(tbl)] = nlist("name",v,"path",v,"user",VO_INFO[v]['prefix']+"001","group",v,"perm","0755");
	tbl[length(tbl)] = nlist("name",v+"-gen","path",v+"/generated","user",VO_INFO[v]['prefix']+"001","group",v,"perm","0755");
	ok = next(list,k,v);
  }; 
  return(tbl);
};
"/software/components/dcache/pnfs/databases" = push(
	nlist("name","cms-phedex","path","cms/ph","user","cms001","group","cms","perm","0755")
);
