$usb = `adb devices`;
$pkg = `adb shell pm packages`;
$path = `adb shell pm path $pkg`;
$get = `adb pull $path`;
=pod
System -> Developer Options -> Running Services
 - ThinkShield: Device Management, Care
 - Custom apps: launcher, installer
These may enable/disable or force stop after startup.
