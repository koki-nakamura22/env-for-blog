+++
author = "Koki"
categories = ["Homebrew"]
date = 2022-03-20T15:50:51+09:00
description = "この記事では、brew updateを実行した時にerror: Failed to merge in the changesというエラーが表示され、Homebrewの更新に失敗した時の対処法について説明します。"
images = [""]
linktitle = ""
title = "brew updateを実行した時にerror: Failed to merge in the changesというエラーが表示された時の対処法"
type = "post"
draft = true

+++
この記事では、brew updateを実行した時にerror: Failed to merge in the changesというエラーが表示され、Homebrewの更新に失敗した時の対処法について説明します。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[brew update-resetを実行](#brew-update-reset%E3%82%92%E5%AE%9F%E8%A1%8C)</font>
- <font color="#1111cc">[brew update-resetって何をしているの？](#brew-update-reset%E3%81%A3%E3%81%A6%E4%BD%95%E3%82%92%E3%81%97%E3%81%A6%E3%81%84%E3%82%8B%E3%81%AE)</font>
- <font color="#1111cc">[参考にしたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%97%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者
- brew update実行時に発生したエラーを突破し、Homebrewの更新を行いたい方


## 環境
- WSL 2 (Ubuntu 20.04 LTS)


## 前提条件
- Homebrewインストール済


## brew update-resetを実行
```sh
brew update-reset
```
を実行するだけで解決できます。

## brew update-resetって何をしているの？
Homebrew公式および公式以外のリモートリポジトリ情報を一旦リセットした後に再取得し、設定しなおしています。


## 参考にしたページ
<font color="#1111cc"><a href="https://docs.brew.sh/Manpage#update-reset-repository-" target="_blank">Homebrew Documentation: update-reset </a></font>  
<font color="#1111cc"><a href="https://github.com/Homebrew/brew/issues/8975" target="_blank">install brew error error: Failed to merge in the changes.</a></font>  
