unique template site/dcache/batch;

include 'components/dcache/config';

## config file to modify batch files
variable DCACHE_GRIDFTP_PARALLEL_STREAMS = "10";
variable DCACHE_BUFFERSIZE = "2097152";
variable DCACHE_TCP_BUFFERSIZE = "2097152";

## variable can be used to select the usage of private interface
variable SET_PRIVATE_IF_CONV ?= false;

## configure the gsiftpdoor adaptor for the gridftp doors
"/software/components/dcache/batch/create" = {
    result = list();
    if (DOOR_GRIDFTP == 'yes') {
        if (SET_PRIVATE_IF_CONV) {
            result[length(result)] = dict(
                'batchname', 'gridftpdoor',
                'cell', 'dmg.cells.services.login.LoginManager',
                'name', 'GFTP-${thisHostname}',
                'context', dict(
                    'gsiftpAdapterInternalInterface', DB_IP[escape(FULL_HOSTNAME)],
                ),
                'opt', dict(
                    'listen', '${gsiftpAdapterInternalInterface}',
                ),
            );
        };
        result[length(result)] = dict(
            'batchname', 'gridftpdoor',
            'cell', 'dmg.cells.services.login.LoginManager',
            'name', 'GFTP-${thisHostname}',
            'context', dict(
                'gsiftpIoQueue', '""',
                'gsiftpMaxStreamsPerClient', DCACHE_GRIDFTP_PARALLEL_STREAMS,
            )
        );
    };

    if (DOOR_SRM == 'yes') {
        result[length(result)] = dict(
            'batchname', 'srm',
            'cell', 'diskCacheV111.util.ThreadManager',
            'name', 'ThreadManager',
            'context', dict(
                'remoteGsiftpIoQueue', '""',
                'remoteGsiftpMaxTransfers', '100',
                'parallelStreams', DCACHE_GRIDFTP_PARALLEL_STREAMS,
                'srmBufferSize', DCACHE_BUFFERSIZE,
                'srmTcpBufferSize', DCACHE_TCP_BUFFERSIZE,
            ),
        );
    };

    if (DCACHE_NODE_TYPE == 'pool') {
        result[length(result)] = dict(
            'batchname', 'pool',
            'cell', 'diskCacheV111.pools.MultiProtocolPool2',
            'name', '${0}',
            'context', dict(
                'poolIoQueue', '"default, gsiftp, dcap"'
            ),
        );
    };

    return(result);
};
