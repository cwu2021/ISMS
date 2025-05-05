print $cmd = `net share`;
=pod
use Advance Sharing instead of Share button when trying to share a Windows folder with right click.
 - C:\Users may be all shared by the Share button!
 - always run net share to ensure current share status.
 - network discovery is not necessary for simple share.
