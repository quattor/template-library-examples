template site/nagios/nsca;

variable NSCA_PORT ?= 5667;
variable NSCA_ENCRYPTION_METHOD ?= 1;
variable NSCA_DECRYPTION_METHOD = NSCA_ENCRYPTION_METHOD;

# You may want to define in another template
# include 'site/secrets/nsca';
variable NSCA_PASSWORD ?= "this_is_not_a_good_password_so_change_me";



