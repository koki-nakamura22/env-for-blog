+++
author = "Koki"
categories = ["Python", "WSL"]
tags = ["Python", "WSL"]
date = 2023-08-27T14:37:51+09:00
linktitle = ""
title = "WSL2 Ubuntu 22.04にpyenvをインストールする方法"
description = "この記事では、WSL2上のUbuntu 22.04にpyenvをインストールする手順をわかりやすく説明します。pyenvのインストールに必要なパッケージの導入から、pyenvのセットアップまでの全手順を紹介します。"
type = "post"
+++
この記事では、WSL2上のUbuntu 22.04にpyenvをインストールする手順をわかりやすく説明します。pyenvのインストールに必要なパッケージの導入から、pyenvのセットアップまでの全手順を紹介します。  

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[インストール手順](#%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E6%89%8B%E9%A0%86)</font>
  - <font color="#1111cc">[1. 必要なパッケージのインストール](#1-%E5%BF%85%E8%A6%81%E3%81%AA%E3%83%91%E3%83%83%E3%82%B1%E3%83%BC%E3%82%B8%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)</font>
  - <font color="#1111cc">[2. pyenvのインストール](#2-pyenv%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)</font>
  - <font color="#1111cc">[3. pyenvの初期設定](#3-pyenv%E3%81%AE%E5%88%9D%E6%9C%9F%E8%A8%AD%E5%AE%9A)</font>
- <font color="#1111cc">[参考にしたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%97%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者
- WSL2を使用している方
- Pythonのバージョン管理を効率よく行いたい方
- pyenvをUbuntuにインストールしたい方


## 環境
- WSL2
- Ubuntu 22.04


## 前提条件
- インターネットへのアクセスが可能であること


## インストール手順

### 1. 必要なパッケージのインストール

最初に、pyenvのインストールに必要なパッケージを導入します。以下のコマンドを実行してください。  
```sh
sudo apt install -y gcc make build-essential libssl-dev libffi-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev liblzma-dev
```

### 2. pyenvのインストール

次に、公式のインストールスクリプトを使用してpyenvをインストールします。  
```sh
curl https://pyenv.run | bash
```


### 3. pyenvの初期設定

最後に、pyenvを利用するための環境変数を設定します。以下の行を.bashrcに追加してください。  
```sh
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
```

これで、WSL2上のUbuntu 22.04にpyenvがインストールされ、使えるようになります。

## 参考にしたページ

- <a href="https://kfields.me/blog/pyenv_on_ubuntu_22" target="_blank">Install Pyenv on Ubuntu 22.04</a>
- <a href="https://www.mathpython.com/ubuntu-python" target="_blank">Ubuntu に pyenv を利用して Python をインストールする</a>
