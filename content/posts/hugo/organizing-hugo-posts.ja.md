+++
author = "Koki"
categories = ["Hugo"]
date = 2022-03-22T14:08:41+09:00
description = "この記事では、記事URL/content/以下のディレクトリ構造と一緒にする方法を説明します。"
images = [""]
linktitle = ""
title = "Hugoの記事URLを/content/以下のディレクトリ構造と一緒にする"
type = "post"

+++
この記事では、記事URL/content/以下のディレクトリ構造と一緒にする方法を説明します。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[Hugoアップデート](#hugo%E3%82%A2%E3%83%83%E3%83%97%E3%83%87%E3%83%BC%E3%83%88)</font>
- <font color="#1111cc">[configファイルへ設定追加](#config%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%81%B8%E8%A8%AD%E5%AE%9A%E8%BF%BD%E5%8A%A0)</font>
- <font color="#1111cc">[サンプル](#%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB)</font>
- <font color="#1111cc">[参考にしたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%97%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者
- 記事をディレクトリ毎に分け、かつURLの形式をそれに追従させたい方


## 環境
- WSL 2 (Ubuntu 20.04 LTS)
- Hugo
- Homebrew


## 前提条件
- Hugoインストール済
- Homebrewインストール済


## Hugoアップデート
Hugoのバージョンが0.83.0以降の方は、本セクションは無視してconfigファイルへ設定追加を読んでください。  
今回設定ファイルに追加する属性はバージョン0.83.0から追加されたため、バージョンアップが必須になります。

今回はapt-getにてHugoをインストールしてしまっていたため、まずはアンインストールし、その後にHomebrewでインストールしなおします。  
理由は、apt-getだとインストール可能な最新バージョンが0.64.0と古いためです。  

再インストール時のコマンドの流れは下記の通りです。
```sh
sudo apt-get remove -y hugo
brew update
brew install hugo
```
brew update実行時に
```sh
error: Failed to merge in the changes
```
と表示されてしまった方は、**brew update-reset** を実行した後、念のため、再度 **brew update** を実行してください。


## configファイルへ設定追加
config.tomlの[permalinks]セクションを、以下のように変更します。
```toml:config.toml
[permalinks]
    posts = "/:year/:month/:day/:filename/" # 変更前
    posts = "/:sections/:filename" # 変更後
```
変更前の値は、あくまでも一例です。  
あと、上記はconfigファイルの形式がtomlだった場合です。他の形式については、
<font color="#1111cc"><a href="https://gohugo.io/content-management/urls/" target="_blank">Hugo: URL Management</a></font>
を参考にしてください。


## サンプル
以下に本ブログの設定を行った際のコミットログを置いておきますので、参考にどうぞ。  
<font color="#1111cc"><a href="https://github.com/koki-nakamura22/env-for-blog/commit/e155732662e1c8cab8c9dda19940f8df045c28a7" target="_blank">organizing the posts</a></font>  


## 参考にしたページ
<font color="#1111cc"><a href="https://gohugo.io/getting-started/installing/#homebrew-macos" target="_blank">Install Hugo | Hugo: Homebrew (macOS)</a></font>  
<font color="#1111cc"><a href="https://qiita.com/kkdd/items/53a36dcf9ac6a4e0fa3c" target="_blank">Homebrew 警告への対処（Another active Homebrew update process is already in progress）</a></font>  
<font color="#1111cc"><a href="https://discourse.gohugo.io/t/section-content-not-showing/10187" target="_blank">Section content not showing</a></font>  
