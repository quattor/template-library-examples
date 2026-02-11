structure template monitoring/nagios/services/load;

include NAGIOS_DEFAULT_SERVICE_TEMPLATE;

'service_description' = 'Host load local';
'check_command' = list(
    'check_nrpe_load',
    '4, 3, 2.5',
    '5, 4.3, 3.6',
);
'hostgroup_name' = list(
    'quattor-nodes',
);

# show performance metrics
'action_url' = PNP4NAGIOS_SERVICE_ACTION_URL;
