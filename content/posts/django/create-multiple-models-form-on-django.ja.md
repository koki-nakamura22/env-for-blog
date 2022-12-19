+++
author = "Koki"
categories = ["Django"]
tags = ["Django"]
date = 2022-12-19T20:26:31+09:00
linktitle = ""
title = "Djangoで複数ModelのFormをページ上で1つのFormとして扱う"
description = "この記事では、Djangoで複数ModelのFormをページ上で1つのFormとして扱う方法を説明します。"
type = "post"
+++

この記事では、Djangoで複数ModelのFormを1つのFormとして扱う方法を説明します。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[複数モデルのFormをページ上で1つのFormとして扱う方法](#%E8%A4%87%E6%95%B0%E3%83%A2%E3%83%87%E3%83%AB%E3%81%AEform%E3%82%92%E3%83%9A%E3%83%BC%E3%82%B8%E4%B8%8A%E3%81%A71%E3%81%A4%E3%81%AEform%E3%81%A8%E3%81%97%E3%81%A6%E6%89%B1%E3%81%86%E6%96%B9%E6%B3%95)</font>
  - <font color="#1111cc">[1. 各モデルのFormクラスを作成](#1-%E5%90%84%E3%83%A2%E3%83%87%E3%83%AB%E3%81%AEform%E3%82%AF%E3%83%A9%E3%82%B9%E3%82%92%E4%BD%9C%E6%88%90)</font>
  - <font color="#1111cc">[2. Viewクラスを作成](#2-view%E3%82%AF%E3%83%A9%E3%82%B9%E3%82%92%E4%BD%9C%E6%88%90)</font>
  - <font color="#1111cc">[3. Templateを作成](#3-template%E3%82%92%E4%BD%9C%E6%88%90)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者

- Djangoで複数ModelのFormをページ上で1つのFormとして扱いたい方


## 環境

- Django (version 4.1.2, 3.2.16)


## 前提条件

なし


## 複数モデルのFormをページ上で1つのFormとして扱う方法

以降のサンプルコードでは、Hoge, Fugaモデルをページ上で1つのFormとして扱っています。  
各モデルやクラス名は、使用したいものに置き換えてお使いください。

### 1. 各モデルのFormクラスを作成

```python:forms.py
from django import forms

from .models import Hoge, Fuga


class HogeForm(forms.ModelForm):
    class Meta:
        model = Hoge


class FugaForm(forms.ModelForm):
    class Meta:
        model = Fuga
```


### 2. Viewクラスを作成

```python:views.py
from django.views.generic import TemplateView

from .forms import HogeForm, FugaForm


class TestView(TemplateView):
    template_name = 'test_form.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)

        # ここでページ上に表示したいFormをcontextに設定する。
        context['hoge_form'] = HogeForm
        context['fuga_form'] = FugaForm

        return context


    def post(self, request, *args, **kwargs):
        # 送信されたデータを元に各フォームインスタンスを作成する。
        hoge_form = HogeForm(data=request.POST)
        fuga_form = FugaForm(data=request.POST)

        # 以降は、 Validationなり独自処理なりお好きにどうぞ。
```


### 3. Templateを作成

```html:templates/test_form.html
<html>
    <head>
        <title>テストフォームページ</title>
    </head>
    <body>
        <!-- formタグにnovalidateを設定しているのは、
             ValidationをすべてViewクラス側にて行いたいため。(余談) -->
        <form method="post" novalidate>
            {% csrf_token %}

            <!-- 1つのformタグ内で各Formをtableタグで囲むことで、
                 複数モデルをベースに作成した各Formのデータを送信できる。 -->
            <table>
                {{ hoge_form }}
            </table>

            <table>
                {{ fuga_form }}
            </table>

            <input type="submit" value="送信" onclick="this.disabled=true,this.form.submit();">
        </form>
    </body>
</html>
```
