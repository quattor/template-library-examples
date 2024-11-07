structure template vo/site/cms;

# Disable some roles not used at T2s
"voms_mappings" ?= list(
    dict(
        'description', 'production',
        'fqan', '/cms/Role=t1production',
        'enabled', false,
        'suffix', 'p',
        'suffix2', 'p',
    ),
);
