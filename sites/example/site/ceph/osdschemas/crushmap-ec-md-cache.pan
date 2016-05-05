unique template site/ceph/osdschemas/crushmap-ec-md-cache;

prefix '/software/components/ceph/clusters/ceph/crushmap';

variable BASE_CHOICES ?= list(
    nlist(
        'chtype', 'chooseleaf firstn',
        'bktype', 'host',
    ),
);
variable EC_CHOICES ?= list(
    nlist(
        'chtype', 'chooseleaf indep',
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

'rules/2/name' = 'ecdata';
'rules/2/type' = 'erasure';
'rules/2/min_size' = 3;
'rules/2/max_size' = 20;
'rules/2/steps/0/set_chooseleaf_tries' = 5;
'rules/2/steps/0/set_choose_tries' = 100;
'rules/2/steps/0/take' = 'default-ec';
'rules/2/steps/0/choices' = EC_CHOICES;

'rules/1/name' = 'metadata';
'rules/1/type' = 'replicated';
'rules/1/steps/0/take' = 'default-md';
'rules/1/steps/0/choices' = BASE_CHOICES;

'rules/0/name' = 'cache';
'rules/0/type' = 'replicated';
'rules/0/steps/0/take' = 'default-cache';
'rules/0/steps/0/choices' = BASE_CHOICES;

'buckets/0/name' = 'default';
'buckets/0/type' = 'root';
'buckets/0/labels' = list('md','ec','cache');
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

