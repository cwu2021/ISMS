=pod 
 - tails runs Wayland on gnome 3.
 - from misc@openbsd.org
If you have a specific Meteor Lake
CPU that you own or want, it would be best to mention that as there are
different GPU options as far as I know.

I run -current on a Meteor Lake CPU, specifically Intel Core Ultra 7
155H. The integrated GPU is called an Intel Arc Graphics GPU, differing
from some of the other integrated Intel GPU names.

On this one, the graphics acceleration works with some flaws currently.
I had to disable TearFree in xorg.conf because there was significant
flickering otherwise. And there is also an issue that the GPU doesn't
always initialize on boot, sometimes (about 30-50% of the time)
erroring and leaving me with llvmpipe instead of accelerated graphics.

This is the error that happens:

drm:pid0:ct_send *ERROR* [drm] *ERROR* GT0: GUC: CT: No response for request 0x550a (fence 7)
drm:pid0:intel_guc_ct_send *ERROR* [drm] *ERROR* GT0: GUC: CT: Sending action 0x550a failed (0xffffffffffffffc4e) status=0
drm:pid0:guc_init_engine_stats *ERROR* [drm] *ERROR* GT0: GUC: Failed to enable usage stats: 0xffffffffffffffc4e
drm:pid0:__uc_init_hw *ERROR* [drm] *ERROR* GT0: GuC initialization failed 0xffffffffffffffc4e
drm:pid0:intel_gt_init_hw *ERROR* [drm] *ERROR* GT0: Enabling uc failed (-5)
drm:pid0:intel_gt_resume *ERROR* [drm] *ERROR* GT0: Failed to initialize GPU, declaring it wedged!
drm:pid0:add_taint_for_CI *NOTICE* [drm] CI tainted: 0x1 by 0xffffffff8255abdbS

I've only done a little research and from that it looks like this issue
might resolve with the next Mesa update.