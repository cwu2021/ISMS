# Oracle Java
## What to do if you see "Unable to launch the application"
Java cache as it is can be cleared.

On Windows you can do it in the Java Control Panel - Start / Control Panel / Java / General tab / Temporary Internet Files - here you have two options. Click on View and then delete cached applications or click on Settings... and then click on Delete Files..., tick all options and press OK.
On MACs you can do it in the Java Control Panel - click on the Apple sign in the left upper corner / System Preferences/ Java/ General tab / Temporary Internet Files - here you have two options. Click on View and then delete cached applications or click on Settings... and then click on Delete Files..., tick all options and press OK.

It can happen that not all the cached files are cleared via the Java dialogue. In that case you have to delete the cache manually:

On Windows delete c:\Users\%username%\AppData\LocalLow\Sun\Java\Deployment folder and it's content
on Mac OS delete "~/Library/Application Support/Oracle/Java/Deployment" folder and it's content.

Optionally remove jnlp app folder.