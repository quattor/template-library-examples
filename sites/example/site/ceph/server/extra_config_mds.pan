unique template site/ceph/server/extra_config_mds;

include { 'components/cron/config' };
"/software/components/cron/entries" = { 
  push(nlist(
    "name","radosdf",
    "user","root",
    "frequency", "7,22,37,52 * * * *",
    "command", "(date --iso-8601=seconds --utc; /usr/bin/rados df; /usr/bin/ceph df; /bin/ps -F -C ceph-mds) >> /var/log/radosdf.log 2>&1",
    )); 
};

