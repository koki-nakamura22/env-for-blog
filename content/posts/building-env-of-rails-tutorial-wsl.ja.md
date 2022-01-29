+++
author = "Koki"
categories = ["Ruby on Rails"]
date = 2019-10-13T21:33:28+11:00
description = "WSL上にRuby on Railsのチュートリアル環境を構築する方法について説明します。"
images = [""]
linktitle = ""
title = "WSL上にRuby on Railsのチュートリアル環境を構築する方法"
type = "post"

+++
この記事では、WSL上にRuby on Railsのチュートリアル環境を構築する方法を説明します。

この記事の内容です。

- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[Ruby on Railsチュートリアルの構築](#ruby-on-rails%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB%E3%81%AE%E6%A7%8B%E7%AF%89)</font>
- <font color="#1111cc">[参考にさせていただいたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%95%E3%81%9B%E3%81%A6%E3%81%84%E3%81%9F%E3%81%A0%E3%81%84%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>


## 対象読者
- WSL上にRuby on Railsのチュートリアル環境を構築したい方


## 環境
- Windows 10 (1903)
- Ubuntu (WSLのディストリビューション, 必ず、バージョン情報が無いものを使用すること)


## 前提条件
- WSL有効済み
- Ubuntu (WSL)インストール済み


## Ruby on Railsチュートリアルの構築
下記のコマンドを上から順に実行してください。  
以上です！
```bash
# Install necessary tools
sudo apt update
sudo apt upgrade -y
sudo apt install autoconf bison build-essential libssl1.0-dev libyaml-dev libreadline-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm-dev sqlite3 libsqlite3-dev nodejs-dev node-gyp npm git -y
sudo npm install --global yarn

# Install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

# Install ruby-build
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

# Install Ruby
rbenv install 2.6.5
rbenv global 2.6.5

# Install Ruby on Rails
gem install rails -v 5.1.6 --no-document
```


## 参考にさせていただいたページ
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="http://railsgirls.jp/install#setup_for_windows" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?http://railsgirls.jp/install#setup_for_windows" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="http://railsgirls.jp/install#setup_for_windows" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Rails Girls - Japanese</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/http://railsgirls.jp/install#setup_for_windows" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/http://railsgirls.jp/install#setup_for_windows" border="0" alt="" /></a></span></div></div>
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://railstutorial.jp/chapters/beginning?version=5.1#sec-installing_rails" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://railstutorial.jp/chapters/beginning?version=5.1#sec-installing_rails" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://railstutorial.jp/chapters/beginning?version=5.1#sec-installing_rails" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">第1章 ゼロからデプロイまで - Railsチュートリアル</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://railstutorial.jp/chapters/beginning?version=5.1#sec-installing_rails" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://railstutorial.jp/chapters/beginning?version=5.1#sec-installing_rails" border="0" alt="" /></a></span></div></div>
