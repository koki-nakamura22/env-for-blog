+++
author = "Koki"
categories = ["PHP", "WSL"]
tags = ["PHP", "WSL"]
date = 2022-10-30T22:25:09+09:00
linktitle = ""
title = "WSL2 (Ubuntu 22.04) へphpenvおよびPHPをインストールする方法"
description = "本記事では、WSL2 (Ubuntu 22.04) へphpenvおよびPHPをインストールする方法を説明します。"
type = "post"
+++
この記事では、WSL2 (Ubuntu 22.04) へphpenvおよびPHPをインストールする方法を説明します。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[phpenvを使用しPHPをインストール](#phpenv%E3%82%92%E4%BD%BF%E7%94%A8%E3%81%97php%E3%82%92%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)</font>
  - <font color="#1111cc">[phpenvのインストール](#phpenv%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)</font>
  - <font color="#1111cc">[phpenvを使用しPHPのインストール](#phpenv%E3%82%92%E4%BD%BF%E7%94%A8%E3%81%97php%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)</font>
  - <font color="#1111cc">[PHPが正常にインストールされたか確認](#php%E3%81%8C%E6%AD%A3%E5%B8%B8%E3%81%AB%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%95%E3%82%8C%E3%81%9F%E3%81%8B%E7%A2%BA%E8%AA%8D)</font>
- <font color="#1111cc">[参考にしたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%97%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者

- WSL2環境へphpenvを使用してPHP環境を構築をしたい方


## 環境

- WSL2 (Ubuntu 22.04)


## 前提条件

- WSL2環境が使用可能


## phpenvを使用しPHPをインストール

### phpenvのインストール

1. phpenv公式の手順に従いインストール  
この時、<font color="#1111cc"><a href="https://github.com/phpenv/phpenv#installation" target="_blank">phpenv公式のインストール手順</a></font> に記載のある **Install php-build into it and any php** も必ず行う。

2. PHPのダウンロードおよびインストールに必要なライブラリインストール  
以下のコマンドを上から順に実行する。
```sh
sudo apt-get update
sudo apt-get install -y libcurl4-openssl-dev libjpeg-dev libonig-dev libtidy-dev libxslt-dev libzip-dev autoconf
curl -s https://raw.githubusercontent.com/php-build/php-build/master/build-openssl-1.0.sh | sh
```

### phpenvを使用しPHPのインストール

以下のコマンドを実行しphpenvを使用しPHPをインストールする。
```sh
PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/openssl@1.0/lib/pkgconfig" phpenv install [バージョン番号]
```

e.g. バージョン8.0.25をインストールする場合。
```sh
PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/openssl@1.0/lib/pkgconfig" phpenv install 8.0.25
```

### PHPが正常にインストールされたか確認

```sh
phpenv local [バージョン番号]
```
や
```sh
phpenv global [バージョン番号]
```
を実行し、使用するPHPのバージョンを指定する。  
その後、
```sh
php -v
```
を実行しターミナル上に上記で指定したPHPのバージョンが表示されることを確認する。

## 参考にしたページ

<a href="https://github.com/phpenv/phpenv" target="_blank" rel="noopener noreferrer" style="all: unset; cursor: pointer;" >
<div style="width: 100%; max-width: 36rem; height: 9rem; border-width: 1px; border-style: solid; border-color: rgb(209, 213, 219); display: flex; background-color: rgb(255, 255, 255);" onMouseOut="this.style.background='rgb(255, 255, 255)'" onMouseOver="this.style.background='rgb(243, 244, 246)'">
  <div style="padding: 0.75rem; width: 75%; display: flex; flex-direction: column; justify-content: space-between;">
    <div>
      <div style="color: rgb(31, 41, 55); font-size: 1.0rem; line-height: 1.5rem; max-height: 3.0rem; overflow: hidden;">GitHub - phpenv/phpenv: Simple PHP version management</div>
      <div style="font-size: 0.8rem; line-height: 1.25rem; max-height: 2.5rem; color: rgb(107, 114, 128); overflow: hidden; text-overflow: ellipsis;">Simple PHP version management. Contribute to phpenv/phpenv development by creating an account on GitHub.</div>
    </div>
    <div style="font-size: 0.75rem; line-height: 1rem; color: rgb(31, 41, 55);">github.com</div>
  </div>
  <div style="border-left-width: 1px; width: 25%;">
    <img src=https://opengraph.githubassets.com/b78669e09b6f85301c45a45f45eb0eb9c17884eb719f80c2b557dff5d0630a44/phpenv/phpenv alt="No Image" style="object-fit: cover; width: 100%; height: 100%; background-color: rgb(209, 213, 219);" loading="lazy" />
  </div>
</div></a>

<br>

<a href="https://qiita.com/akirak47/items/a7be7ffd2e0c7b084e95" target="_blank" rel="noopener noreferrer" style="all: unset; cursor: pointer;" >
<div style="width: 100%; max-width: 36rem; height: 9rem; border-width: 1px; border-style: solid; border-color: rgb(209, 213, 219); display: flex; background-color: rgb(255, 255, 255);" onMouseOut="this.style.background='rgb(255, 255, 255)'" onMouseOver="this.style.background='rgb(243, 244, 246)'">
  <div style="padding: 0.75rem; width: 75%; display: flex; flex-direction: column; justify-content: space-between;">
    <div>
      <div style="color: rgb(31, 41, 55); font-size: 1.0rem; line-height: 1.5rem; max-height: 3.0rem; overflow: hidden;">Ubuntu22.04でphpenv使おうと思ったらopensslのバージョン違いでbuildできない件 - Qiita</div>
      <div style="font-size: 0.8rem; line-height: 1.25rem; max-height: 2.5rem; color: rgb(107, 114, 128); overflow: hidden; text-overflow: ellipsis;">macの対策はたくさん記事が引っかかるけどubuntuの情報はあまり無いので同様の現象で詰まった方のために残しておきます。
掲題ですが、phpenvとphp-buildをインストールしたubuntu22.04で、php7.4.30や8...</div>
    </div>
    <div style="font-size: 0.75rem; line-height: 1rem; color: rgb(31, 41, 55);">qiita.com</div>
  </div>
  <div style="border-left-width: 1px; width: 25%;">
    <img src=https://qiita-user-contents.imgix.net/https%3A%2F%2Fcdn.qiita.com%2Fassets%2Fpublic%2Farticle-ogp-background-9f5428127621718a910c8b63951390ad.png?ixlib=rb-4.0.0&w=1200&mark64=aHR0cHM6Ly9xaWl0YS11c2VyLWNvbnRlbnRzLmltZ2l4Lm5ldC9-dGV4dD9peGxpYj1yYi00LjAuMCZ3PTkxNiZ0eHQ9VWJ1bnR1MjIuMDQlRTMlODElQTdwaHBlbnYlRTQlQkQlQkYlRTMlODElOEElRTMlODElODYlRTMlODElQTglRTYlODAlOUQlRTMlODElQTMlRTMlODElOUYlRTMlODIlODlvcGVuc3NsJUUzJTgxJUFFJUUzJTgzJTkwJUUzJTgzJUJDJUUzJTgyJUI4JUUzJTgzJUE3JUUzJTgzJUIzJUU5JTgxJTk1JUUzJTgxJTg0JUUzJTgxJUE3YnVpbGQlRTMlODElQTclRTMlODElOEQlRTMlODElQUElRTMlODElODQlRTQlQkIlQjYmdHh0LWNvbG9yPSUyMzIxMjEyMSZ0eHQtZm9udD1IaXJhZ2lubyUyMFNhbnMlMjBXNiZ0eHQtc2l6ZT01NiZ0eHQtY2xpcD1lbGxpcHNpcyZ0eHQtYWxpZ249bGVmdCUyQ3RvcCZzPTNkZjEzMGQ5ZTRiZThjMDAwYTFlMTExYzc0MGI2ZWFj&mark-x=142&mark-y=112&blend64=aHR0cHM6Ly9xaWl0YS11c2VyLWNvbnRlbnRzLmltZ2l4Lm5ldC9-dGV4dD9peGxpYj1yYi00LjAuMCZ3PTYxNiZ0eHQ9JTQwYWtpcmFrNDcmdHh0LWNvbG9yPSUyMzIxMjEyMSZ0eHQtZm9udD1IaXJhZ2lubyUyMFNhbnMlMjBXNiZ0eHQtc2l6ZT0zNiZ0eHQtYWxpZ249bGVmdCUyQ3RvcCZzPTBhMWY4ZjU1MjE5ZTA1ODhjNjFlN2ViZWNjM2ViMWFi&blend-x=142&blend-y=491&blend-mode=normal&s=83e5b346f5c705b1bbb3fc837f4314d0 alt="No Image" style="object-fit: cover; width: 100%; height: 100%; background-color: rgb(209, 213, 219);" loading="lazy" />
  </div>
</div></a>

<br>

<a href="https://github.com/php-build/php-build/issues/718" target="_blank" rel="noopener noreferrer" style="all: unset; cursor: pointer;" >
<div style="width: 100%; max-width: 36rem; height: 9rem; border-width: 1px; border-style: solid; border-color: rgb(209, 213, 219); display: flex; background-color: rgb(255, 255, 255);" onMouseOut="this.style.background='rgb(255, 255, 255)'" onMouseOver="this.style.background='rgb(243, 244, 246)'">
  <div style="padding: 0.75rem; width: 75%; display: flex; flex-direction: column; justify-content: space-between;">
    <div>
      <div style="color: rgb(31, 41, 55); font-size: 1.0rem; line-height: 1.5rem; max-height: 3.0rem; overflow: hidden;">FIX nothing below PHP 8.1 installs in Ubuntu 22.04 (`RSA_SSLV23_PADDING` undeclared in OpenSSL 3.0.0) · Issue #718 · php-build/php-build</div>
      <div style="font-size: 0.8rem; line-height: 1.25rem; max-height: 2.5rem; color: rgb(107, 114, 128); overflow: hidden; text-overflow: ellipsis;">my system has openssl 3.0.2-0ubuntu1.1 ~/.phpenv/plugins/php-build/install-dependencies.sh: autoconf is already the newest version (2.71-2). bash is already the newest version (5.1-6ubuntu1). bison...</div>
    </div>
    <div style="font-size: 0.75rem; line-height: 1rem; color: rgb(31, 41, 55);">github.com</div>
  </div>
  <div style="border-left-width: 1px; width: 25%;">
    <img src=https://opengraph.githubassets.com/9866a0331fd33e2ce6cb88886a415aa73efd9e9ef29d3a1b4290401202b4029b/php-build/php-build/issues/718 alt="No Image" style="object-fit: cover; width: 100%; height: 100%; background-color: rgb(209, 213, 219);" loading="lazy" />
  </div>
</div></a>

<br>

<a href="https://www.kabanoki.net/1301/" target="_blank" rel="noopener noreferrer" style="all: unset; cursor: pointer;" >
<div style="width: 100%; max-width: 36rem; height: 9rem; border-width: 1px; border-style: solid; border-color: rgb(209, 213, 219); display: flex; background-color: rgb(255, 255, 255);" onMouseOut="this.style.background='rgb(255, 255, 255)'" onMouseOver="this.style.background='rgb(243, 244, 246)'">
  <div style="padding: 0.75rem; width: 75%; display: flex; flex-direction: column; justify-content: space-between;">
    <div>
      <div style="color: rgb(31, 41, 55); font-size: 1.0rem; line-height: 1.5rem; max-height: 3.0rem; overflow: hidden;">CentOS7にphpenvを導入しようとしたらエラーが出た part2 | カバの樹</div>
      <div style="font-size: 0.8rem; line-height: 1.25rem; max-height: 2.5rem; color: rgb(107, 114, 128); overflow: hidden; text-overflow: ellipsis;">undefined</div>
    </div>
    <div style="font-size: 0.75rem; line-height: 1rem; color: rgb(31, 41, 55);">www.kabanoki.net</div>
  </div>
  <div style="border-left-width: 1px; width: 25%;">
    <img src=undefined alt="No Image" style="object-fit: cover; width: 100%; height: 100%; background-color: rgb(209, 213, 219);" loading="lazy" />
  </div>
</div></a>
