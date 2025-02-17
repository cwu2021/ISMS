# https://stackoverflow.com/questions/3928144/how-can-i-execute-an-external-windows-command-and-instantly-return-in-perl
print "The OS is: ",$^O,"\n";
system(regedit);
# https://stackoverflow.com/questions/3608957/what-are-the-common-workarounds-for-multi-line-comments-in-perl
=begin comment
HKCU/Software/Teamviewer/UIVersion
Value 2 = old design, 4 = new design
https://community.teamviewer.com/English/discussion/129649/change-back-to-old-interface?omit_analytics_page_load=true
=end comment
=cut
# block outbound teamviewer_service for LAN-only. however, outbound for client side cannot be blocked.
