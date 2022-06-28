# kernel panic
 /bsd: panic: pmap_remove_ptes: unmanaged page marked PG_PVLIST, <br>
 https://misc.openbsd.narkive.com/1sLNfucz/bsd-panic-pmap-remove-ptes-unmanaged-page-marked-pg-pvlist <br>
 <i>i would suspect ram. i have had one system that had bad ram. when it
panic'd, guess where? almost always in the pmap. particularly if it has
gone from bad to worse.

there were some issues related to uvm/pmap and wired pages fixed recently,
but i don't think this is one of the panics that would result.</i> 
