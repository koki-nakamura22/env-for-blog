+++
author = "Koki"
categories = ["Hugo"]
date = 2022-03-20T15:17:26+09:00
description = "この記事では、Hugoで生成するサイトへのrobots.txt作成および追加を行う方法を説明します。"
images = [""]
linktitle = ""
title = "Hugoサイトへのrobots.txt作成および追加"
type = "post"

+++
この記事では、Hugoで生成するサイトへのrobots.txt作成および追加を行う方法を説明します。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[configファイルに設定を追加](#config%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%81%AB%E8%A8%AD%E5%AE%9A%E3%82%92%E8%BF%BD%E5%8A%A0)</font>
- <font color="#1111cc">[layoutsディレクトリ配下にrobots.txtを作成](#layouts%E3%83%87%E3%82%A3%E3%83%AC%E3%82%AF%E3%83%88%E3%83%AA%E9%85%8D%E4%B8%8B%E3%81%ABrobotstxt%E3%82%92%E4%BD%9C%E6%88%90)</font>
- <font color="#1111cc">[サンプル](#%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB)</font>
- <font color="#1111cc">[参考にしたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%97%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者
- Hugoで生成したサイトへrobots.txtを追加したい方


## 環境
- Hugo (v0.94.2+extended linux/amd64 BuildDate=unknown)


## 前提条件
- Hugoインストール済


## configファイルに設定を追加
configファイル内のトップレベルに以下を追加します。  
私の環境だと、configファイルがtoml形式だったので、以下を追加しています。
```toml:config.toml
enableRobotsTXT         = true
```

もし手元のconfigファイルがyaml形式であれば下記を、
```yaml:config.yaml
enableRobotsTXT: true
```

json形式であれば下記をトップレベルに追加してください。
```json:config.json
"enableRobotsTXT": true
```

これだけで、内容が
```txt:robots.txt
User-agent: *
```
のrobots.txtが生成されるようになります。

## layoutsディレクトリ配下にrobots.txtを作成
実際はサイトマップ情報などをrobots.txtに追加したいので、カスタマイズしたくなります。  
その時は、/layoutsディレクトリ配下にrobots.txtを追加するだけでビルド時に生成してくれるようになります。


## サンプル
以下に本ブログの設定を行った際のコミットログを置いておきますので、良かったら参考にどうぞ。  
<font color="#1111cc"><a href="https://github.com/koki-nakamura22/env-for-blog/commit/0dc7d79a89fc2b59275b76adca7b3009e09e060c" target="_blank">add robots.txt</a></font>  


## 参考にしたページ
<font color="#1111cc"><a href="https://gohugo.io/templates/robots/" target="_blank">Hugo: Robots.txt File</a></font>  
