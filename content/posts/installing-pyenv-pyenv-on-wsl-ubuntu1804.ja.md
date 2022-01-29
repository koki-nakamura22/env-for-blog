+++
author = "Koki"
categories = ["Python", "WSL"]
date = 2020-04-26T20:26:18+10:00
description = "この記事では、WSL (Ubuntu 18.04 LTS)へpyenvおよびpyenvを使用してPythonをインストールする方法を説明します。"
images = [""]
linktitle = ""
title = "WSL (Ubuntu 18.04 LTS)へpyenvおよびPythonをインストールする方法"
type = "post"

+++
この記事では、WSL (Ubuntu 18.04 LTS)へpyenvおよびpyenvを使用してPythonをインストールする方法を説明します。

この記事の内容です。

- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[pyenvインストール](#pyenv%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)</font>
- <font color="#1111cc">[Pythonインストール](#python%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)</font>
  - <font color="#1111cc">[Pythonをインストールするために必要なライブラリをインストール](#python%E3%82%92%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%99%E3%82%8B%E3%81%9F%E3%82%81%E3%81%AB%E5%BF%85%E8%A6%81%E3%81%AA%E3%83%A9%E3%82%A4%E3%83%96%E3%83%A9%E3%83%AA%E3%82%92%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)</font>
  - <font color="#1111cc">[Pythonをインストール](#python%E3%82%92%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)</font>
- <font color="#1111cc">[参考にさせていただいたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%95%E3%81%9B%E3%81%A6%E3%81%84%E3%81%9F%E3%81%A0%E3%81%84%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>


## 対象読者
- WSLへpyenvとPythonをインストールしたい方


## 環境
- WSL (Ubuntu 18.04 LTS)


## 前提条件
- Gitインストール済み。


## pyenvインストール
以下のコマンドを実行してpyenvをインストールします。
```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
exec "$SHELL"
```

コマンドの実行が終わったら、設定を反映させるためにWSLを再起動します。  
これで、pyenvのインストールは完了です。

## Pythonインストール

### Pythonをインストールするために必要なライブラリをインストール
以下のコマンドを実行します。
```bash
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev
```

### Pythonをインストール
以下のコマンドを実行し、その後、使用するPythonのバージョンを設定します。  
本記事では、バージョン3.8.2をインストールします。
```bash
pyenv install 3.8.2
pyenv global 3.8.2
```

## 参考にさせていただいたページ
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://github.com/pyenv/pyenv#basic-github-checkout" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://github.com/pyenv/pyenv#basic-github-checkout" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://github.com/pyenv/pyenv#basic-github-checkout" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">GitHub - pyenv/pyenv: Simple Python version management</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://github.com/pyenv/pyenv#basic-github-checkout" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://github.com/pyenv/pyenv#basic-github-checkout" border="0" alt="" /></a></span></div></div>
