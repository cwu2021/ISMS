@echo off
REM https://learn.microsoft.com/en-us/windows/wsl/install
REM "Run as administrator", enter the command below, then restart your machine.
wsl --install
REM Ubuntu 18.04, 20.04, 22.04 Desktop can also be installed with Hyper-V templates.
wsl --list --online
wsl --install Ubuntu-22.04
REM move instance to another drive
wsl export
wsl import
::how to run RHEL 10 on Windows as a Windows Subsystem for Linux distribution using Red Hat Enterprise Linux image builder.
