+++
author = "Koki"
categories = ["Chocolatey"]
date = 2019-09-04T16:38:27+10:00
description = "Windows 10でLinuxのapt-getやyumの様にパッケージを管理する環境を構築する方法を説明します。"
images = [""]
linktitle = ""
title = "Windows 10でパッケージマネージャ(Chocolatey)を使用する方法"
type = "post"

+++
本記事では、Chocolateyを使用し、Windows環境でLinuxのapt-getやyumを使用するパッケージ管理を実現する方法について説明します。

本記事の内容です。  

- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[インストール方法](#%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E6%96%B9%E6%B3%95)</font>
- <font color="#1111cc">[インストールされたことを確認](#%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%95%E3%82%8C%E3%81%9F%E3%81%93%E3%81%A8%E3%82%92%E7%A2%BA%E8%AA%8D)</font>
- <font color="#1111cc">[実際に何かインストールしてみる](#%E5%AE%9F%E9%9A%9B%E3%81%AB%E4%BD%95%E3%81%8B%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%97%E3%81%A6%E3%81%BF%E3%82%8B)</font>
- <font color="#1111cc">[インストール済みのパッケージ確認](#%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E6%B8%88%E3%81%BF%E3%81%AE%E3%83%91%E3%83%83%E3%82%B1%E3%83%BC%E3%82%B8%E7%A2%BA%E8%AA%8D)</font>
- <font color="#1111cc">[アンインストール方法](#%E3%82%A2%E3%83%B3%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E6%96%B9%E6%B3%95)</font>
- <font color="#1111cc">[パッケージのアップデート方法](#%E3%83%91%E3%83%83%E3%82%B1%E3%83%BC%E3%82%B8%E3%81%AE%E3%82%A2%E3%83%83%E3%83%97%E3%83%87%E3%83%BC%E3%83%88%E6%96%B9%E6%B3%95)</font>
- <font color="#1111cc">[参考にさせていただいたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%95%E3%81%9B%E3%81%A6%E3%81%84%E3%81%9F%E3%81%A0%E3%81%84%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>

# 対象読者
- WindowsでもLinuxのapt-getやyumのような機能を使用したい方

<br>
---

# インストール方法
下記のコマンドを、管理者権限で起動したコマンドプロンプト上で実行します。  
```bat
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```
  
もしくは、下記のコマンドを管理者権限で起動したPowerShell上で実行します。  
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

<br>
---

# インストールされたことを確認
上記のコマンドが終了した後に
```bat
choco -v
```
を実行し、下記のようにバージョン情報が表示されたらインストールが成功しています。
```bat
C:\WINDOWS\system32>choco -v
0.10.15
```

<br>
---

# 実際に何かインストールしてみる
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://chocolatey.org/packages" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://chocolatey.org/packages" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://chocolatey.org/packages" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Chocolatey Software | Packages</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://chocolatey.org/packages" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://chocolatey.org/packages" border="0" alt="" /></a></span></div></div>

を参考に、試しに7zipをインストールしてみます。  
下記のコマンドを実行します。  
この時、コマンドプロンプトやPowerShellは管理者権限で起動しておきましょう。(ソフトウェアをインストールする時は管理者権限が求められるため。)  
また、途中で処理を続行するかを問われるので、「Y」を入力し続行します。   
```powershell
choco install 7zip
```

<br>
---

# インストール済みのパッケージ確認
インストール済みのパッケージを確認する場合は、下記のコマンドを実行します。  
試しに、上記でインストールした7zipが表示されるか確認してみましょう。
```bat
choco list -localonly
``` 
<br>
---

# アンインストール方法
インストール済みのパッケージをアンインストールする際は、下記コマンドを実行します。  
この時、本当に削除してもよいかを聞かれるので「Y」を入力し、処理を続行します。
```bat
choco install [package name]
```  
例えば、上記でインストールしたものをアンインストールするには下記のコマンドを実行します。  
```bat
choco uninstall 7zip
```  

<br>
---

# パッケージのアップデート方法
すべてのパッケージをアップデートする場合は下記のコマンドを、
```bat
choco update all
``` 
パッケージを指定してアップデートする場合は下記のコマンドを実行します。
```bat
choco update [package name]
```

<br>
---

# 参考にさせていただいたページ
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://chocolatey.org/docs/installation" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://chocolatey.org/docs/installation" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://chocolatey.org/docs/installation" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Chocolatey Software | Installation</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://chocolatey.org/docs/installation" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://chocolatey.org/docs/installation" border="0" alt="" /></a></span></div></div>
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://www.nuits.jp/entry/hello-Chocolatey" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://www.nuits.jp/entry/hello-Chocolatey" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://www.nuits.jp/entry/hello-Chocolatey" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">はじめてのChocolatey - nuits.jp blog</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://www.nuits.jp/entry/hello-Chocolatey" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://www.nuits.jp/entry/hello-Chocolatey" border="0" alt="" /></a></span></div></div>
