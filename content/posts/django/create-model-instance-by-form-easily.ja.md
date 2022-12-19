+++
author = "Koki"
categories = ["Django"]
tags = ["Django"]
date = 2022-12-19T21:20:59+09:00
linktitle = ""
title = "Formのデータを元に短いコードで素敵にModelインスタンスを作成する"
description = "この記事では、Formの入力されたデータを元に短いコードでModelインスタンスを作成するコードについて説明します。Formで入力されたデータをサクッとDBに登録したい時に使えます。"
type = "post"
+++

この記事では、Formの入力されたデータを元に短いコードでModelインスタンスを作成するコードについて説明します。  
Formで入力されたデータをサクッとDBに登録したい時に使えます。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[Formの入力されたデータを元に短いコードでModelインスタンスを作成](#form%E3%81%AE%E5%85%A5%E5%8A%9B%E3%81%95%E3%82%8C%E3%81%9F%E3%83%87%E3%83%BC%E3%82%BF%E3%82%92%E5%85%83%E3%81%AB%E7%9F%AD%E3%81%84%E3%82%B3%E3%83%BC%E3%83%89%E3%81%A7model%E3%82%A4%E3%83%B3%E3%82%B9%E3%82%BF%E3%83%B3%E3%82%B9%E3%82%92%E4%BD%9C%E6%88%90)</font>
  - <font color="#1111cc">[1. Formクラスにdict変換用処理実装](#1-form%E3%82%AF%E3%83%A9%E3%82%B9%E3%81%ABdict%E5%A4%89%E6%8F%9B%E7%94%A8%E5%87%A6%E7%90%86%E5%AE%9F%E8%A3%85)</font>
  - <font color="#1111cc">[2. Formインスタンスを元にModelインスタンス作成](#2-form%E3%82%A4%E3%83%B3%E3%82%B9%E3%82%BF%E3%83%B3%E3%82%B9%E3%82%92%E5%85%83%E3%81%ABmodel%E3%82%A4%E3%83%B3%E3%82%B9%E3%82%BF%E3%83%B3%E3%82%B9%E4%BD%9C%E6%88%90)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者

- Formの入力されたデータを元に短いコードでModelインスタンスを作成したい方


## 環境

- Django (version 4.1.2, 3.2.16)


## 前提条件

なし


## Formの入力されたデータを元に短いコードでModelインスタンスを作成

簡単に説明すると、以下のステップで処理を行う。  
1. POSTデータを元にFormインスタンス作成
2. Formインスタンスをdictに変換、展開しModelのコンストラクタへ渡しModelのインスタンス作成

### 1. Formクラスにdict変換用処理実装
```python:forms.py
from django import forms


# 共通処理として使用するためにベースクラスを作成し、
# それを継承させた方が楽。
class BaseModelForm(forms.ModelForm):
    # これを追加することでdict()でdictに変換できる。
    def __iter__(self):
        for k in self.fields:
            yield (k, self.data[k])


class HogeForm(forms.ModelForm):
    # 省略
```

### 2. Formインスタンスを元にModelインスタンス作成

```python
from django.views import generic

from .forms import HogeForm
from .models import Hoge


class TestView(generic.TemplateView):
    def post(self, request, *args, **kwargs):
        hoge_form = HogeForm(data=request.POST)
        # 任意の何かしらの処理
        hoge = Hoge(**dict(hoge_form))
        # 以降はhoge.save()など、ご自由に
```

