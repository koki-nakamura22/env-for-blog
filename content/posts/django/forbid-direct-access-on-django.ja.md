+++
author = "Koki"
categories = ["Django"]
tags = ["Django"]
date = 2022-12-17T20:15:47+09:00
linktitle = ""
title = "Djangoの各ViewでURLを使用した直接アクセスを禁止する方法 (ミドルウェア未使用)"
description = ""
type = "post"
+++

この記事では、ミドルウェアを使用せずにDjangoの各ViewでURLを使用した直接アクセスを禁止する方法方法を説明します。  
システム (アプリ) 全体では設定したくない時に各ページ個別に設定するのに使用します。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[各Viewで直接アクセスを禁止する方法](#%E5%90%84view%E3%81%A7%E7%9B%B4%E6%8E%A5%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%E3%82%92%E7%A6%81%E6%AD%A2%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95)</font>
  - <font color="#1111cc">[単純な直接アクセス禁止](#%E5%8D%98%E7%B4%94%E3%81%AA%E7%9B%B4%E6%8E%A5%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%E7%A6%81%E6%AD%A2)</font>
  - <font color="#1111cc">[フォームの値ありきのパターンの直接アクセス禁止](#%E3%83%95%E3%82%A9%E3%83%BC%E3%83%A0%E3%81%AE%E5%80%A4%E3%81%82%E3%82%8A%E3%81%8D%E3%81%AE%E3%83%91%E3%82%BF%E3%83%BC%E3%83%B3%E3%81%AE%E7%9B%B4%E6%8E%A5%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%E7%A6%81%E6%AD%A2)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者

- 各ページ個別に直接アクセスをしたい方


## 環境

- Django (version 4.1.2, 3.2.16)


## 前提条件

- Viewの実装はViewクラスを継承したクラスで実装している


## 各Viewで直接アクセスを禁止する方法

### 単純な直接アクセス禁止

以下のように、何かしらのViewクラスを継承したクラスにて、  
get関数をオーバーライドしホストやアクセス元URLを元に直接アクセスか否かをチェックします。  
以下の例では、hogeアプリの/reservationからしかアクセスできない/confirm-reservationへ直接アクセスされた際に、トップページを強制的に開かせるようにしています。  
また、URLについてはurls.pyにそれぞれ登録されていること前提です。

```python
from django.views.generic import TemplateView
from urllib import parse

class ConfirmReservationView(TemplateView):
    # 省略

    def get(self, request, *args, **kwargs):
        referer = self.request.environ.get('HTTP_REFERER')
        parsed_referer_url = parse.urlparse(referer)

        if not (self.request.get_host() == parsed_referer_url.netloc
            and parsed_referer_url.path == reverse('hoge:reservation')):
            return HttpResponseRedirect(reverse('hoge:top'))

        return super().get(request, *args, **kwargs)

    # 省略
```

### フォームの値ありきのパターンの直接アクセス禁止

単純な直接アクセス禁止 で説明したコードに対し、それぞれセッションやPOSTメソッドで渡された値をチェックすることで他のパターンで直接アクセスを検知することができます。  
ここらへんは、それぞれ要求や仕様に応じてカスタマイズしていただければと思います。

```python
from django.views.generic import TemplateView
from urllib import parse

class ConfirmReservationView(TemplateView):
    # 省略

    def get(self, request, *args, **kwargs):
        referer = self.request.environ.get('HTTP_REFERER')
        parsed_referer_url = parse.urlparse(referer)

        if (not (self.request.get_host() == parsed_referer_url.netloc
            and parsed_referer_url.path == reverse('hoge:reservation')))
            or 'フォームの値のキー' not in self.request.session # セッションを使用し値を渡す場合はこの行を追加
            or 'フォームの値のキー' not in self.request.POST: # POSTメソッドを使用し値を渡す場合はこの行を追加
            return HttpResponseRedirect(reverse('hoge:top'))

        return super().get(request, *args, **kwargs)

    # 省略
```
