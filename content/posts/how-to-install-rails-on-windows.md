+++
author = "Koki"
categories = ["Ruby on Rails"]
date = 2019-09-30T18:55:46+10:00
description = "This article explain how to install Ruby on Rails on Windows 10."
images = [""]
linktitle = ""
title = "How to install Ruby on Rails on Windows 10"
type = "post"

+++
This article explain how to install Ruby on Rails on Windows 10.  

The following lists are the table of contents about this article.

- <font color="#1111cc">[Target audience](#target-audience)</font>
- <font color="#1111cc">[Environment](#environment)</font>
- <font color="#1111cc">[Preconditions](#preconditions)</font>
- <font color="#1111cc">[Install](#install)</font>
- <font color="#1111cc">[How to check installed packages](#how-to-check-installed-packages)</font>
- <font color="#1111cc">[Reference articles](#reference-articles)</font>

## Target audience
- Those who want to create Ruby on Rails environment on Windows 10.


## Environment
- Windows 10 (1903)
- Chocolatey (0.10.15)


## Preconditions
- Already installed Chocolatey


## Install
Execute the following commands on Command Prompt or PowerShell as administrator.

```bat
REM Install Yarn
choco install yarn -y

REM Install Ruby
choco install ruby -y

REM Install msys2
choco install msys2 --params "/NoUpdate"  -y
refreshenv
ridk install 2 3

REM Install SQLite
gem uninstall sqlite3 --all
ridk exec pacman -S mingw-w64-x86_64-sqlite3
gem install sqlite3 --platform ruby

REM Install bundle
gem install bundle

REM Install Ruby on Rails
gem install rails
```

If you want to specify version Ruby and Ruby on Rails, replace install Ruby and Ruby on Rails commands.  
The following commands are an example.
When you install Ruby 2.4.2.2, use the following command instead of "choco install ruby -y".
```bat
choco install ruby --version=2.4.2.2 -y
```

Also, when you install Ruby on Rails 5.2.2, use the following command instead of "gem install bundle rails".
```bat
gem install rails -v 5.2.2
```


## How to check installed packages
Execute the following commands on Command Prompt or Power Shell.
```bat
ruby -v
rails -v
```
You can check each version. The following information is an example.
```bat
C:\Users\testuser>ruby -v
ruby 2.6.4p104 (2019-08-28 revision 67798) [x64-mingw32]

C:\Users\testuser>rails -v
Rails 6.0.0
```


## Reference articles
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://qiita.com/toriiico/items/a0765ffdc0419512ae53" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://qiita.com/toriiico/items/a0765ffdc0419512ae53" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://qiita.com/toriiico/items/a0765ffdc0419512ae53" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">chocolateyでruby on rails環境を構築 - Qiita</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://qiita.com/toriiico/items/a0765ffdc0419512ae53" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://qiita.com/toriiico/items/a0765ffdc0419512ae53" border="0" alt="" /></a></span></div></div>

<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://prog-8.com/docs/rails-env-win" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://prog-8.com/docs/rails-env-win" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://prog-8.com/docs/rails-env-win" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Ruby on Railsの環境構築をしてみよう！(Windows) | プログラミングの入門なら基礎から学べるProgate[プロゲート]</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://prog-8.com/docs/rails-env-win" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://prog-8.com/docs/rails-env-win" border="0" alt="" /></a></span></div></div>
