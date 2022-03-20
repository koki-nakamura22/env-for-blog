+++
author = "Koki"
categories = ["Haskell", "WSL"]
date = 2022-02-24T10:34:15+09:00
description = "この記事では、WSL2 (Ubuntu 20.04) 上でVS Codeを使用したHaskell開発環境を構築する方法を説明します。また、VS Codeで使用する拡張機能についても説明しています。"
images = [""]
linktitle = ""
title = "WSL2 (Ubuntu 20.04) 上でVS Codeを使用したHaskell開発環境を構築する方法"
type = "post"

+++
この記事では、WSL2 (Ubuntu 20.04) 上でVS Codeを使用したHaskell開発環境を構築する方法を説明します。

この記事の内容です。

- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[開発環境構築](#%E9%96%8B%E7%99%BA%E7%92%B0%E5%A2%83%E6%A7%8B%E7%AF%89)</font>
  - <font color="#1111cc">[1. インストール](#1-%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)</font>
  - <font color="#1111cc">[2. プロジェクト作成](#2-%E3%83%97%E3%83%AD%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E4%BD%9C%E6%88%90)</font>
  - <font color="#1111cc">[3. プロジェクトをビルド可能にするための準備](#3-%E3%83%97%E3%83%AD%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%82%92%E3%83%93%E3%83%AB%E3%83%89%E5%8F%AF%E8%83%BD%E3%81%AB%E3%81%99%E3%82%8B%E3%81%9F%E3%82%81%E3%81%AE%E6%BA%96%E5%82%99)</font>
  - <font color="#1111cc">[4. インストールおよび環境構築に成功したことの確認](#4-%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%8A%E3%82%88%E3%81%B3%E7%92%B0%E5%A2%83%E6%A7%8B%E7%AF%89%E3%81%AB%E6%88%90%E5%8A%9F%E3%81%97%E3%81%9F%E3%81%93%E3%81%A8%E3%81%AE%E7%A2%BA%E8%AA%8D)</font>
  - <font color="#1111cc">[5. VS Codeの拡張機能インストール](#5-vs-code%E3%81%AE%E6%8B%A1%E5%BC%B5%E6%A9%9F%E8%83%BD%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)</font>
- <font color="#1111cc">[参考にしたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%97%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>

## 対象読者
- WSL2 (Ubuntu 20.04) 上で、VS Codeを使用したHaskell開発環境を構築したい方


## 環境
- Windows 10 (Ver. 21H2, Build. 19044.1526)
- WSL 2 (Ubuntu 20.04 LTS)

## 前提条件
- WSL 2の環境構築済み
- WSL 2へVS Codeインストール済み

## 開発環境構築

### 1. インストール
```sh
wget -qO- https://get.haskellstack.org/ | sh
```

### 2. プロジェクト作成
```sh
stack new [your project name]
```

### 3. プロジェクトをビルド可能にするための準備
```sh
cd [your project name]
stack setup
stack build
```

### 4. インストールおよび環境構築に成功したことの確認
```sh
stack exec [your project name]-exe
```
以下のように**someFunc**と表示されたら、インストールおよび環境構築に成功しています。
```sh
$ stack exec [your project name]-exe
someFunc
```

### 5. VS Codeの拡張機能インストール
最後に、VS Codeを起動し以下の拡張機能をインストールします。
* Haskell  
一緒にHaskell Syntax Highlightingもインストールされます。
* hlint  
一緒にhaskell-linterもインストールされます。

以上で、Haskellの開発環境構築は完了です。

## 参考にしたページ
<a href="https://docs.haskellstack.org/en/stable/install_and_upgrade/" target="_blank">Install/upgrade - The Haskell Tool Stack</a>
