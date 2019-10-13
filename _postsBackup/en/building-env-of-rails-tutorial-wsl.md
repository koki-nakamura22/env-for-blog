+++
author = "Koki"
categories = ["Ruby on Rails"]
date = 2019-10-13T21:33:28+11:00
description = "Explain how to build a environment of Ruby on Rails tutorial on WSL."
images = [""]
linktitle = ""
title = "How to build an environment of Ruby on Rails tutorial on WSL"
type = "post"

+++
This article explains how to build the environment of Ruby on Rails tutorial on WSL.

The following lists are the table of contents about this article.

- <font color="#1111cc">[Target audience](#target-audience)</font>
- <font color="#1111cc">[Environment](#environment)</font>
- <font color="#1111cc">[Preconditions](#preconditions)</font>
- <font color="#1111cc">[Building the environment of Ruby on Rails tutorial](#building-the-environment-of-ruby-on-rails-tutorial)</font>
- <font color="#1111cc">[Reference articles](#reference-articles)</font>

<br>
---

# Target audience
- Those who want to build the environment of Ruby on Rails tutorial on WSL.

<br>
---

# Environment
- Windows 10 (1903)
- Ubuntu (Distribution of WSL, have to use without version.)

<br>
---

# Preconditions
- Enable the function of WSL
- Installed Ubuntu (WSL)

<br>
---

# Building the environment of Ruby on Rails tutorial
Execute the following commands.  
That's it!
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


<br>
---

# Reference articles
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="http://railsgirls.jp/install#setup_for_windows" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?http://railsgirls.jp/install#setup_for_windows" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="http://railsgirls.jp/install#setup_for_windows" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Rails Girls - Japanese</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/http://railsgirls.jp/install#setup_for_windows" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/http://railsgirls.jp/install#setup_for_windows" border="0" alt="" /></a></span></div></div>
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://railstutorial.jp/chapters/beginning?version=5.1#sec-installing_rails" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://railstutorial.jp/chapters/beginning?version=5.1#sec-installing_rails" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://railstutorial.jp/chapters/beginning?version=5.1#sec-installing_rails" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">第1章 ゼロからデプロイまで - Railsチュートリアル</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://railstutorial.jp/chapters/beginning?version=5.1#sec-installing_rails" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://railstutorial.jp/chapters/beginning?version=5.1#sec-installing_rails" border="0" alt="" /></a></span></div></div>
