#
# name = wlcg_x86_64 
# owner = grid.support@lal.in2p3.fr
# url = http://uattor.web.lal.in2p3.fr/yum/snapshots/wlcgr-x86_64
#

structure template repository/snapshot/wlcg_x86_64;

"name" = "wlcg_x86_64";
"owner" = "grid.support@lal.in2p3.fr";
"protocols" = list(
  nlist("name","http",
        "url","http://"+YUM_SNAPSHOT_URL+"/yum/snapshots/"+YUM_SNAPSHOT_DATE+"/wlcg-x86_64")
);

