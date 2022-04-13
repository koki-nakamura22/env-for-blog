+++
author = "Koki"
categories = ["Hugo"]
tags = ["Hugo"]
date = 2022-04-13T18:40:09+09:00
linktitle = ""
title = "Hugoサーバをローカルで起動している時のみGoogle Analyticsを無効にする"
description = "この記事では、Hugoサーバをローカルで起動している時のみGoogle Analyticsを無効にする方法を説明します。これによって、ローカルの確認によりAnalytics情報が汚れることがなくなります。"
type = "post"
draft = true
+++
この記事では、Hugoサーバをローカルで起動している時のみGoogle Analyticsを無効にする方法を説明します。  
これによって、ローカルの確認によりAnalytics情報が汚れることがなくなります。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[localhost上でのみGoogle Analyticsを無効にする](#localhost%E4%B8%8A%E3%81%A7%E3%81%AE%E3%81%BFgoogle-analytics%E3%82%92%E7%84%A1%E5%8A%B9%E3%81%AB%E3%81%99%E3%82%8B)</font>
  - <font color="#1111cc">[1. Google Analyticsのテンプレートを読み込んでいる個所を把握する](#1-google-analytics%E3%81%AE%E3%83%86%E3%83%B3%E3%83%97%E3%83%AC%E3%83%BC%E3%83%88%E3%82%92%E8%AA%AD%E3%81%BF%E8%BE%BC%E3%82%93%E3%81%A7%E3%81%84%E3%82%8B%E5%80%8B%E6%89%80%E3%82%92%E6%8A%8A%E6%8F%A1%E3%81%99%E3%82%8B)</font>
  - <font color="#1111cc">[2. localhost上ではGoogle Analyticsを読み込まないように変更する](#2-localhost%E4%B8%8A%E3%81%A7%E3%81%AFgoogle-analytics%E3%82%92%E8%AA%AD%E3%81%BF%E8%BE%BC%E3%81%BE%E3%81%AA%E3%81%84%E3%82%88%E3%81%86%E3%81%AB%E5%A4%89%E6%9B%B4%E3%81%99%E3%82%8B)</font>
- <font color="#1111cc">[参考にしたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%97%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者
- Hugoブログ上で、本番環境でのみGoogle Analyticsを有効にしたい方


## 環境
- Hugo (v0.94.2+extended linux/amd64 BuildDate=unknown)


## 前提条件
- Hugoインストール済


## localhost上でのみGoogle Analyticsを無効にする
### 1. Google Analyticsのテンプレートを読み込んでいる個所を把握する
まずは、Google Analyticsのテンプレートを読み込んでいる個所を探します。  
自分の場合は layouts/partials/scripts.html が対象でしたが、お使いのテーマによって異なると思いますので、以下のようなコマンドを実行し、それぞれ探したほうがいいと思います。
```sh
grep '{{- template "_internal/google_analytics_async.html" . -}}' -rl .
```

### 2. localhost上ではGoogle Analyticsを読み込まないように変更する
次に、以下のように該当箇所を変更します。
```html:変更前.html
{{- template "_internal/google_analytics_async.html" . -}}
```

```html:変更後.html
{{ if .Site.IsServer }}
  <script type="text/javascript">
    console.info("Disable Google Analytics on Localhost");
  </script>
{{ else}}
  {{- template "_internal/google_analytics_async.html" . -}}
{{ end }}
```

今回は、ローカルでHugoサーバを起動している時にはコンソールにメッセージを表示するようにしました。  
行っていることは簡単で、.Site.IsServer変数がサーバがローカルで起動しているかどうかのフラグを管理しているため、それを利用して条件分岐をしているだけです。


## 参考にしたページ
<font color="#1111cc"><a href="https://discourse.gohugo.io/t/how-to-exclude-google-analytics-when-running-under-hugo-local-server/6092/32" target="_blank">How to Exclude Google Analytics When Running Under Hugo Local Server</a></font>  
