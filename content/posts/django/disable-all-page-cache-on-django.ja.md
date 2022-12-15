+++
author = "Koki"
categories = ["Django"]
tags = ["Django"]
date = 2022-12-13T11:54:02+09:00
linktitle = ""
title = "Djangoの全ページのレスポンスに対しキャッシュを禁止する方法"
description = "この記事では、Djangoの全ページのレスポンスに対しキャッシュを禁止する方法について説明します。"
type = "post"
+++

この記事では、Djangoの全ページのレスポンスに対しキャッシュを禁止する方法について説明します。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[Djangoの全ページでキャッシュを禁止にする](#django%E3%81%AE%E5%85%A8%E3%83%9A%E3%83%BC%E3%82%B8%E3%81%A7%E3%82%AD%E3%83%A3%E3%83%83%E3%82%B7%E3%83%A5%E3%82%92%E7%A6%81%E6%AD%A2%E3%81%AB%E3%81%99%E3%82%8B)</font>
  - <font color="#1111cc">[何故、この対応が必要なのか？](#%E4%BD%95%E6%95%85%E3%81%93%E3%81%AE%E5%AF%BE%E5%BF%9C%E3%81%8C%E5%BF%85%E8%A6%81%E3%81%AA%E3%81%AE%E3%81%8B)</font>
  - <font color="#1111cc">[全ページでキャッシュを禁止にする方法](#%E5%85%A8%E3%83%9A%E3%83%BC%E3%82%B8%E3%81%A7%E3%82%AD%E3%83%A3%E3%83%83%E3%82%B7%E3%83%A5%E3%82%92%E7%A6%81%E6%AD%A2%E3%81%AB%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95)</font>
    - <font color="#1111cc">[1. conf/settings.pyへの設定追加](#1-confsettingspy%E3%81%B8%E3%81%AE%E8%A8%AD%E5%AE%9A%E8%BF%BD%E5%8A%A0)</font>
    - <font color="#1111cc">[2. ミドルウェアの作成](#2-%E3%83%9F%E3%83%89%E3%83%AB%E3%82%A6%E3%82%A7%E3%82%A2%E3%81%AE%E4%BD%9C%E6%88%90)</font>
- <font color="#1111cc">[参考にしたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%97%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者

- Djangoの全ページでキャッシュ利用を禁止にしたい方


## 環境

- Django (version 4.1.2)


## 前提条件

- なし


## Djangoの全ページでキャッシュを禁止にする

### 何故、この対応が必要なのか？

ざっくり書くと「キャッシュサーバーがキャッシュを持つことが原因で、見られたくない情報が他人から見れてしまうのを防ぐため。」です。

丸投げになりますが、ここらへんを読むと何故必要なのかの理解が深まるのかなと思います。  

- <font color="#1111cc"><a href="https://www.ipa.go.jp/security/awareness/vendor/programmingv2/contents/405.html" target="_blank">第5章 暴露対策 プロキシキャッシュ対策</a></font>
- <font color="#1111cc"><a href="https://blog.tokumaru.org/2015/03/blog-post_27.html" target="_blank">キャッシュ制御不備の脆弱性にご用心</a></font>

また、以下の本の  
4.15 共有資源やキャッシュに関する問題  
でも細かく説明されているので、是非購入し読んでみてください。  
本書はキャッシュ対策以外のことも説明されているので、Webアプリ開発時のセキュリティ対策全般の勉強になります。(以下リンクにアフィリエイトの設定は行っていません。)  
<font color="#1111cc"><a href="https://www.amazon.co.jp/%E4%BD%93%E7%B3%BB%E7%9A%84%E3%81%AB%E5%AD%A6%E3%81%B6-%E5%AE%89%E5%85%A8%E3%81%AAWeb%E3%82%A2%E3%83%97%E3%83%AA%E3%82%B1%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3%E3%81%AE%E4%BD%9C%E3%82%8A%E6%96%B9-%E7%AC%AC2%E7%89%88-%E8%84%86%E5%BC%B1%E6%80%A7%E3%81%8C%E7%94%9F%E3%81%BE%E3%82%8C%E3%82%8B%E5%8E%9F%E7%90%86%E3%81%A8%E5%AF%BE%E7%AD%96%E3%81%AE%E5%AE%9F%E8%B7%B5-%E5%BE%B3%E4%B8%B8/dp/4797393165" target="_blank">体系的に学ぶ 安全なWebアプリケーションの作り方 第2版 脆弱性が生まれる原理と対策の実践</a></font>


### 全ページでキャッシュを禁止にする方法

参考にしたページの内容とほぼ同じですが、以下の設定を行います。  

#### 1. conf/settings.pyへの設定追加

conf/settings.pyのMIDDLEWAREリストへ、後ほど作成するミドルウェアを登録します。

```python
MIDDLEWARE = [
    'corsheaders.middleware.CorsMiddleware',
    '[アプリ名].middleware.nocache.NoCacheMiddleware', # これを追加
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]
```

#### 2. ミドルウェアの作成

アプリのルートディレクトリにmiddlewareディレクトリを作成し、その中にnocache.pyを作成します。  
そして、nocache.pyの中に以下のコードを書きます。(コピペします。)  
```python
from django.conf import settings
from django.utils.deprecation import MiddlewareMixin


class NoCacheMiddleware(MiddlewareMixin):
    def process_response(self, request, response):
        response['Cache-Control'] = 'private, no-store, no-cache, must-revalidate'
        return response
```

これだけでアプリの全ページへアクセスした際のResponseに、上記で設定したキャッシュ利用を禁止する設定が追加されるようになります。  

## 参考にしたページ

<a href="https://bicstone.me/django-nocache" target="_blank" rel="noopener noreferrer" style="all: unset; cursor: pointer;" >
<div style="width: 100%; max-width: 36rem; height: 9rem; border-width: 1px; border-style: solid; border-color: rgb(209, 213, 219); display: flex; background-color: rgb(255, 255, 255);" onMouseOut="this.style.background='rgb(255, 255, 255)'" onMouseOver="this.style.background='rgb(243, 244, 246)'">
  <div style="padding: 0.75rem; width: 75%; display: flex; flex-direction: column; justify-content: space-between;">
    <div>
      <div style="color: rgb(31, 41, 55); font-size: 1.0rem; line-height: 1.5rem; max-height: 3.0rem; overflow: hidden;">Djangoで全ページキャッシュ禁止にする方法 - まっしろブログ</div>
      <div style="font-size: 0.8rem; line-height: 1.25rem; max-height: 2.5rem; color: rgb(107, 114, 128); overflow: hidden; text-overflow: ellipsis;">WSGIサーバで動作させているDjangoのWebサイトで、全ページにHTTPヘッダーを付加し、キャッシュ禁止にする方法を紹介します。</div>
    </div>
    <div style="font-size: 0.75rem; line-height: 1rem; color: rgb(31, 41, 55);">bicstone.me</div>
  </div>
  <div style="border-left-width: 1px; width: 25%;">
    <img src=https://bicstone.me/ogp/django-nocache.png alt="No Image" style="object-fit: cover; width: 100%; height: 100%; background-color: rgb(209, 213, 219);" loading="lazy" />
  </div>
</div></a>
