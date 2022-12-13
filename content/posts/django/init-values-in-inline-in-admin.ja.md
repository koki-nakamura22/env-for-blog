+++
author = "Koki"
categories = ["Django"]
tags = ["Django"]
date = 2022-12-13T10:35:15+09:00
linktitle = ""
title = "TabularInline (インラインフォーム) の値に初期値を設定"
description = "この記事では、TabularInlineを使用し実装するインラインフォームの値に初期値を設定する方法について説明します。"
type = "post"
+++

この記事では、TabularInlineを使用し実装するインラインフォームの値に初期値を設定する方法について説明します。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[この記事で説明する内容](#%E3%81%93%E3%81%AE%E8%A8%98%E4%BA%8B%E3%81%A7%E8%AA%AC%E6%98%8E%E3%81%99%E3%82%8B%E5%86%85%E5%AE%B9)</font>
- <font color="#1111cc">[この記事で説明しない内容](#%E3%81%93%E3%81%AE%E8%A8%98%E4%BA%8B%E3%81%A7%E8%AA%AC%E6%98%8E%E3%81%97%E3%81%AA%E3%81%84%E5%86%85%E5%AE%B9)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[インラインフォームに初期値を設定](#%E3%82%A4%E3%83%B3%E3%83%A9%E3%82%A4%E3%83%B3%E3%83%95%E3%82%A9%E3%83%BC%E3%83%A0%E3%81%AB%E5%88%9D%E6%9C%9F%E5%80%A4%E3%82%92%E8%A8%AD%E5%AE%9A)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者

- TabularInlineを使用し実装したインラインフォームの項目の値に初期値を設定したい方


## この記事で説明する内容

- TabularInlineを使用し実装するインラインフォームの項目の値に初期値を設定する方法


## この記事で説明しない内容

- TabularInlineの使い方  
  TabularInlineの使い方については、
  <font color="#1111cc"><a href="https://docs.djangoproject.com/ja/4.1/intro/tutorial07/#adding-related-objects" target="_blank">はじめての Django アプリ作成、その 7#リレーションを張ったオブジェクトの追加</a></font>
  あたりを参考に学習してください。


## 環境

- Django (version 3.2.16)


## 前提条件

- TabularInlineを使用しインラインフォーム実装済み


## インラインフォームに初期値を設定

以下の形でBaseInlineFormSetを継承したInlineFormSetクラスを作成し、  
それをTabularInlineクラスを継承したInlineクラスのformsetプロパティに設定します。  
これで、インラインフォームの各項目に好きな初期値を設定することができます。  
※各クラス名は、実際に使用しているものに読み替えてください。

```python
from django import forms
from django.contrib import admin


# 初期値設定のために、このクラスを作成。
class TestFormInlineFormSet(forms.models.BaseInlineFormSet):
    model = Test

    def __init__(self, *args, **kwargs):
        super(TestFormInlineFormSet, self).__init__(*args, **kwargs)
        if not self.instance.pk:
            # ここで設定する初期値は任意のもの。
            self.initial = [
                {
                    "Modelの項目名": "何かしらの初期値",
                },
            ]


class TestInline(admin.TabularInline):
    model = Test
    formset = TestFormInlineFormSet # ここで、対象のインラインフォームに初期値設定のために作成したインラインフォームセットクラスを設定する。
    # 以降、省略


@admin.register(Test)
class TestForm(admin.ModelAdmin):
    # 省略

    inlines = [TestInline]

    # 省略
```
