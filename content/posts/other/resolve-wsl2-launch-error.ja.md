+++
author = "Koki"
categories = ["WSL"]
tags = ["WSL"]
date = 2023-08-27T13:55:30+09:00
linktitle = ""
title = "WSL2 Ubuntu起動時にエラーメッセージが表示され起動できない時の対処法"
description = "WSL2のUbuntuをストア経由でインストールすると、起動時にエラーメッセージが表示される場合があります。そんな時の解決方法を本記事では説明します。"
type = "post"
+++
WSL2のUbuntuをストア経由でインストールすると、起動時にエラーメッセージが表示される場合があります。そんな時の解決方法を本記事では説明します。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[ストア経由の問題点](#%E3%82%B9%E3%83%88%E3%82%A2%E7%B5%8C%E7%94%B1%E3%81%AE%E5%95%8F%E9%A1%8C%E7%82%B9)</font>
- <font color="#1111cc">[問題の解決方法](#%E5%95%8F%E9%A1%8C%E3%81%AE%E8%A7%A3%E6%B1%BA%E6%96%B9%E6%B3%95)</font>
  - <font color="#1111cc">[1. Ubuntu on WSL2のアンインストール](#1-ubuntu-on-wsl2%E3%81%AE%E3%82%A2%E3%83%B3%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)</font>
  - <font color="#1111cc">[2. Ubuntu on WSL2をコマンド経由でインストール](#2-ubuntu-on-wsl2%E3%82%92%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E7%B5%8C%E7%94%B1%E3%81%A7%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)</font>
  - <font color="#1111cc">[番外編: インストール可能なディストリビューションの確認](#%E7%95%AA%E5%A4%96%E7%B7%A8-%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E5%8F%AF%E8%83%BD%E3%81%AA%E3%83%87%E3%82%A3%E3%82%B9%E3%83%88%E3%83%AA%E3%83%93%E3%83%A5%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3%E3%81%AE%E7%A2%BA%E8%AA%8D)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者
- WSL2 Ubuntu起動時にエラーメッセージが表示された方


## 環境
- Windows 10またはそれ以降のバージョン
- WSL2を利用可能な環境


## 前提条件
- Windows Subsystem for Linux (WSL)の有効化

## ストア経由の問題点

WSL2のUbuntuをMicrosoft Store経由でインストールした際、起動時に以下のようなエラーメッセージが表示され、Ubuntu on WSL2が起動しない場合があります。  
```sh
コマンドが見つかりませんでした。
コマンドが見つかりませんでした。
コマンドが見つかりませんでした。
Please press any key...
```

ストア経由でインストールすると、こういった問題が発生するようです。  
次の章に沿って問題を解決しましょう。

## 問題の解決方法

### 1. Ubuntu on WSL2のアンインストール

まずは、Ubuntu on WSL2をアンインストールしましょう。  
このアンインストールはコマンドでも、設定→アプリ→インストールされているアプリからのアンインストールのどちらでも大丈夫です。

### 2. Ubuntu on WSL2をコマンド経由でインストール

以下のコマンドでUbuntu on WSL2をインストールします。  
以下の例では、Ubuntu 22.04をインストールしています。
```sh
wsl --install -d Ubuntu-22.04
```

### 番外編: インストール可能なディストリビューションの確認

利用可能なディストリビューションの一覧を知りたい場合は、次のコマンドを実行してください。
```sh
wsl --list --online
```

表示される一覧のNAME列にあるディストリビューション名を-dの後ろに指定することで、そのディストリビューションをインストールすることができます。
