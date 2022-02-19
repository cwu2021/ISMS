@echo off
REM Which drive is \Device\Harddisk1\DR1?
REM https://superuser.com/questions/538574/which-drive-is-device-harddisk1-dr1
diskpart

REM Commenting multiple lines in DOS batch file (stackoverflow.com)
goto comment
C:\windows\system32>diskpart

    Microsoft DiskPart version 6.1.7601
    Copyright (C) 1999-2008 Microsoft Corporation.
    On computer: COMPUTERNAME

    DISKPART> list disk

      Disk ###  Status         Size     Free     Dyn  Gpt
      --------  -------------  -------  -------  ---  ---
      Disk 0    Online          476 GB    11 GB
      Disk 1    Online           59 GB      0 B

    DISKPART> sel disk 1

    Disk 1 is now the selected disk.

    DISKPART> list part

:comment
