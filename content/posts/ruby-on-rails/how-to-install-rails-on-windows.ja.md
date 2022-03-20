+++
author = "Koki"
categories = ["Ruby on Rails"]
date = 2019-09-30T21:23:27+10:00
description = "Windows 10にRuby on Railsをインストールする方法を説明します。"
images = [""]
linktitle = ""
title = "Windows 10にRuby on Railsをインストールする方法"
type = "post"

+++
本記事では、Windows 10環境にRuby on Railsをインストールする方法を説明していきます。  

本記事の内容です。

- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[インストール方法](#%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E6%96%B9%E6%B3%95)</font>
- <font color="#1111cc">[RubyとRuby on Railsがインストールされたことを確認](#ruby%E3%81%A8ruby-on-rails%E3%81%8C%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%95%E3%82%8C%E3%81%9F%E3%81%93%E3%81%A8%E3%82%92%E7%A2%BA%E8%AA%8D)</font>
- <font color="#1111cc">[参考にさせていただいたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%95%E3%81%9B%E3%81%A6%E3%81%84%E3%81%9F%E3%81%A0%E3%81%84%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>

## 対象読者
- Windows 10にRuby on Rails環境を作成したい方


## 環境
- Windows 10 (1903)
- Chocolatey (0.10.15)


## 前提条件
- Chocolateyインストール済み


## インストール方法
下記のコマンドたちを管理者権限のコマンドプロンプトもしくはPowerShellで実行します。  

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

RubyやRuby on Railsインストール時にバージョンを指定したい方は、下記の様にRubyおよびRuby on Railsのインストールコマンドを置き換えてください。  
下記はサンプルです。  
Rubyインストール時にバージョン2.4.2.2を指定する場合は、"choco install ruby -y"の代わりに下記を実行します。
```bat
choco install ruby --version=2.4.2.2 -y
```

また、Ruby on Railsインストール時にバージョン5.2.2を指定する場合は、"gem install bundle rails"の代わりに下記を実行します。
```bat
gem install rails -v 5.2.2
```


## RubyとRuby on Railsがインストールされたことを確認
それぞれ下記のコマンドをコマンドプロンプトもしくはPowerShellで実行し、インストールされたことを確認します。
```bat
ruby -v
rails -v
```
インストールに成功している場合は、それぞれ下記の様にバージョン情報が表示されます。
```bat
C:\Users\testuser>ruby -v
ruby 2.6.4p104 (2019-08-28 revision 67798) [x64-mingw32]

C:\Users\testuser>rails -v
Rails 6.0.0
```


## 参考にさせていただいたページ
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://qiita.com/toriiico/items/a0765ffdc0419512ae53" class="blog-card-thumbnail-link" target="_blank"><img src="https://capture.heartrails.com/120x120/shorten?https://qiita.com/toriiico/items/a0765ffdc0419512ae53" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://qiita.com/toriiico/items/a0765ffdc0419512ae53" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">chocolateyでruby on rails環境を構築 - Qiita</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="https://b.hatena.ne.jp/entry/https://qiita.com/toriiico/items/a0765ffdc0419512ae53" target="_blank"><img border="0" src="https://b.hatena.ne.jp/entry/image/https://qiita.com/toriiico/items/a0765ffdc0419512ae53" border="0" alt="" /></a></span></div></div>

<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://prog-8.com/docs/rails-env-win" class="blog-card-thumbnail-link" target="_blank"><img src="https://capture.heartrails.com/120x120/shorten?https://prog-8.com/docs/rails-env-win" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://prog-8.com/docs/rails-env-win" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Ruby on Railsの環境構築をしてみよう！(Windows) | プログラミングの入門なら基礎から学べるProgate[プロゲート]</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="https://b.hatena.ne.jp/entry/https://prog-8.com/docs/rails-env-win" target="_blank"><img border="0" src="https://b.hatena.ne.jp/entry/image/https://prog-8.com/docs/rails-env-win" border="0" alt="" /></a></span></div></div>
