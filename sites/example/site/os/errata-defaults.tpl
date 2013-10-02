# Define standard errata to use for each OS version

unique template site/os/errata-defaults;

variable PKG_OS_ERRATA_FIX_TEMPLATE_SUFFIX ?= '-fix';

variable OS_ERRATA_TEMPLATE ?= nlist(
  'sl440-i386',   'rpms/errata/20090904',
  'sl440-x86_64', 'rpms/errata/20090904',
  'sl450-x86_64', 'rpms/errata/20090826',
  'sl460-i386',   'rpms/errata/20090826',
  'sl460-x86_64', 'rpms/errata/20090826',
  'sl470-i386',   'rpms/errata/20090909',
  'sl470-x86_64', 'rpms/errata/20090909',
  'sl510-x86_64', 'rpms/errata',
  'sl520-x86_64', 'rpms/errata/20090826',
  'sl530-x86_64', 'rpms/errata/20090826',
  'sl550-x86_64', 'rpms/errata/20130329',
);

