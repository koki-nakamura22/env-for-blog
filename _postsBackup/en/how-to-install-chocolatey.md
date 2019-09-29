+++
author = "Koki"
categories = ["Chocolatey"]
date = 2019-09-04T16:38:27+10:00
description = "This article explain how to install Chocolatey on Windows 10."
images = [""]
linktitle = ""
title = "How to install Chocolatey on Windows 10."
type = "post"

+++
This article explain how to install Chocolatey on Windows 10.  
Chocolatey is Package Management Tools that is like apt-get or yum on Linux.

The following lists are the table of contents about this article.

- <font color="#1111cc">[Target audience](#target-audience)</font>
- <font color="#1111cc">[How to install](#how-to-install)</font>
- <font color="#1111cc">[Confirm Chocolatey is installed](#confirm-chocolatey-is-installed)</font>
- <font color="#1111cc">[Install something to example](#install-something-to-example)</font>
- <font color="#1111cc">[How to check installed packages](#how-to-check-installed-packages)</font>
- <font color="#1111cc">[How to uninstall package](#how-to-uninstall-package)</font>
- <font color="#1111cc">[How to update package](#how-to-update-package)</font>
- <font color="#1111cc">[Reference articles](#reference-articles)</font>

# Target audience
- Those who want to use functions like apt-get or yum on Windows.

<br>
---

# How to install
Execute the following command on Command Prompt as Administrator.
```bat
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```

Or, execute the following command on PowerShell as Administrator.
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

<br>
---

# Confirm Chocolatey is installed
After execute install, execute the following command on Command Prompt or PowerShell.
```bat
choco -v
```
If version information appears like the following information, install was a success.
```bat
C:\WINDOWS\system32>choco -v
0.10.15
```

<br>
---

# Install something to example
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://chocolatey.org/packages" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://chocolatey.org/packages" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://chocolatey.org/packages" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Chocolatey Software | Packages</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://chocolatey.org/packages" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://chocolatey.org/packages" border="0" alt="" /></a></span></div></div>

Refer to the above article, let's install 7zip as a test.  
Execute the following command on Command Prompt or PowerShell as Administrator.  
When installing it, Command Prompt and Powershell will ask you if you want to continue. Press "Y" to continue a process.  
```powershell
choco install 7zip
```

<br>
---

# How to check installed packages
Execute the following command on Command Prompt or PowerShell.
```bat
choco list -localonly
``` 
<br>
---

# How to uninstall package
Execute the following command on Command Prompt or PowerShell.  
When uninstalling a package, you have to specify package that uninstalling.  
And Command Prompt and Powershell will ask you if you want to continue. Press "Y" to continue a process.
```bat
choco install [package name]
```  
For example, if uninstalling 7zip, execute the following command on Command Prompt or PowerShell.
```bat
choco uninstall 7zip
```  

<br>
---

# How to update package
If you want to update all packages, execute the following command,
```bat
choco update all
```
if you want to specify package, execute the following command on Command Prompt or PowerShell.
```bat
choco update [package name]
```

<br>
---

# Reference articles
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://chocolatey.org/docs/installation" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://chocolatey.org/docs/installation" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://chocolatey.org/docs/installation" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Chocolatey Software | Installation</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://chocolatey.org/docs/installation" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://chocolatey.org/docs/installation" border="0" alt="" /></a></span></div></div>
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://www.nuits.jp/entry/hello-Chocolatey" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://www.nuits.jp/entry/hello-Chocolatey" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://www.nuits.jp/entry/hello-Chocolatey" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">はじめてのChocolatey - nuits.jp blog</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://www.nuits.jp/entry/hello-Chocolatey" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://www.nuits.jp/entry/hello-Chocolatey" border="0" alt="" /></a></span></div></div>
