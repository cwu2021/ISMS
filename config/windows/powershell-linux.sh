#!/bin/bash
# https://learn.microsoft.com/en-us/powershell/scripting/install/install-ubuntu
# https://blog.quickbreach.io/blog/powershell-remoting-from-linux-to-windows/
# Learn Windows PowerShell in a Month of Lunches https://www.books.com.tw/products/0010809471
sudo apt update
sudo apt install wget apt-transport-https software-properties-common
wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
sudo dpkg -i packages-microsoft-prod.deb 
sudo apt update
sudo apt install powershell -y
:<<END
The differences between PowerShell 2.0 and newer versions are significant, mainly revolving around **cross-platform compatibility, security, performance, and new features**. Microsoft decided to end support for version 2.0 primarily because it's a **legacy, insecure, and outdated component** that no longer meets modern IT standards.

***

### Key Differences Between PowerShell 2.0 and New Versions

* **Cross-Platform:** The most significant difference is that modern PowerShell (versions 6.0 and later, often called "PowerShell Core") is **cross-platform**. It's built on .NET Core (now just .NET) and can run on Windows, macOS, and various Linux distributions. PowerShell 2.0 is a Windows-only component. 🌐
* **Security:** This is the main reason for its deprecation. PowerShell 2.0 has **known security vulnerabilities** and lacks modern security features, making it a potential tool for attackers to run malicious code. Newer versions have a much-reduced attack surface and incorporate security enhancements.
* **Performance:** Newer versions of PowerShell are **significantly faster** in many operations, especially with cmdlets like `Group-Object` and `Sort-Object`.
* **Features:** Modern versions have a massive number of new and improved features and cmdlets. Some key additions since version 2.0 include:
    * **Module Auto-Loading:** Modules are automatically loaded when you use a cmdlet from them, so you no longer need to manually run `Import-Module`.
    * **Shorthand Syntax:** Shorthand aliases like `?` for `Where-Object` and `%` for `ForEach-Object` make scripting faster.
    * **Parallelization:** The `ForEach-Object -Parallel` switch makes it easy to run tasks concurrently, which is a major performance boost for automation.
    * **Improved Remoting:** Sessions are more robust and can be disconnected and reconnected.
    * **Modern Web Cmdlets:** `Invoke-WebRequest` and `Invoke-RestMethod` have been improved for easier interaction with REST APIs.

***

### Why Microsoft Ended Support for PowerShell 2.0

Microsoft is removing PowerShell 2.0 from Windows to **clean up legacy code, improve security, and reduce system complexity**.

* **Security Risks:** PowerShell 2.0's old architecture and lack of modern security protocols make it a security liability. Threat actors have exploited it to bypass security controls and run malware. Removing it eliminates this attack vector.
* **Outdated Architecture:** Version 2.0 is a legacy component, first released with Windows 7 in 2009. Maintaining this old code is a burden and prevents Microsoft from focusing on newer, more secure versions.
* **Modernization:** The removal is part of a broader effort by Microsoft to move users toward modern, supported tools like PowerShell 5.1 (which is preinstalled on most modern Windows systems) and the cross-platform PowerShell 7.x.
END