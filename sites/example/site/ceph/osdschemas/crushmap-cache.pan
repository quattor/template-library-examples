unique template site/ceph/osdschemas/crushmap-cache;

prefix '/software/components/ceph/clusters/ceph/crushmap';

variable BASE_CHOICES ?= list(
    nlist(
        'chtype', 'chooseleaf firstn',
        'bktype', 'host',
    ),
);

'types' = list('osd','host','root');
'tunables' = nlist(
    'choose_local_tries', 0,
    'choose_local_fallback_tries', 0,
    'choose_total_tries', 50,
    'chooseleaf_descend_once', 1
);

'rules/1/name' = 'cache';
'rules/1/type' = 'replicated';
'rules/1/steps/0/take' = 'default-ssd';
'rules/1/steps/0/choices' = BASE_CHOICES;

'rules/0/name' = 'replicated_ruleset';
'rules/0/type' = 'replicated';
'rules/0/steps/0/take' = 'default-sas';
'rules/0/steps/0/choices' = BASE_CHOICES;

'buckets/0/name' = 'default';
'buckets/0/type' = 'root';
'buckets/0/defaultalg' = 'straw';
'buckets/0/labels' = list('sas', 'ssd');
'buckets/0/buckets' = {
    t= list();
    foreach (idx; host; CEPH_HOSTS) {
        append(t, nlist(
            'name', host,
            'type', 'host',
            ),
        );
    };
    t;
};

