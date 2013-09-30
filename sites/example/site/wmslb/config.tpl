template site/wmslb/config;

variable LB_DB_PWD ?= '';
variable LB_MYSQL_ADMINPWD ?= 'YourPrefPwdClearText';
variable LB_TRUSTED_WMS ?= list(

);

# Sandbox size limitation
variable WMS_MAX_INPUT_SANDBOX_SIZE ?= 1000000;
variable WMS_MAX_OUTPUT_SANDBOX_SIZE ?= 10000000;

# Defaults are very conservative but don't put too high threshold
# to allow fall back on another WMS
variable WMS_LOAD_MONITOR_CPU_LOAD1 ?= 10;
variable WMS_LOAD_MONITOR_CPU_LOAD5 ?= 9;
variable WMS_LOAD_MONITOR_CPU_LOAD15 ?= 7;

# Define this variable if LB is on a separate machine
variable WMS_LB_SERVER_HOST ?= 'lb.example.com';
