+++
author = "Koki"
categories = ["Django"]
tags = ["Django"]
date = 2022-12-17T20:41:47+09:00
linktitle = ""
title = "DjangoのForm項目のchoicesにDBから値を取得し設定する場合は、コンストラクタ内で設定しないとエラーが発生する話"
description = "この記事では、Form項目のchoicesにDBから取得した値を設定する方法を説明します。"
type = "post"
+++

この記事では、Form項目のchoicesにDBから取得した値を設定する方法を説明します。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[Form項目のchoisesにDBから取得した値を設定する方法](#form%E9%A0%85%E7%9B%AE%E3%81%AEchoises%E3%81%ABdb%E3%81%8B%E3%82%89%E5%8F%96%E5%BE%97%E3%81%97%E3%81%9F%E5%80%A4%E3%82%92%E8%A8%AD%E5%AE%9A%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者

- Form項目のchoisesにDBから取得した値を設定したい方


## 環境

- Django (version 4.1.2, 3.2.16)


## 前提条件

なし


## Form項目のchoisesにDBから取得した値を設定する方法

DjangoのFormでは、直接メンバーフィールドのchoicesにModel.objects.values_listなどでDBから取得した値を設定しようとすると、エラーが発生します。  
それを回避するため、以下の様にコンストラクタ内で設定する必要があるというところに行きついたので、共有します。  
もし他に良い方法がある方が居たら、コソッと教えていただけると嬉しいです。  

以下の例は、HogeフォームでDBから取得した国リストをドロップダウンリスト形式で表示したい時の設定です。  
値も表記も両方、国名にしています。  
要求や仕様に応じて、自由にカスタマイズして使っていただければと思います。

```python
from django import forms

class HogeForm(BaseModelForm):
    def __init__(self, data=None, files=None, auto_id='id_%s', prefix=None, initial=None, error_class=ErrorList, label_suffix=None, empty_permitted=False, instance=None, use_required_attribute=None, renderer=None, readonly=False):
        self.base_fields['countries'] = forms.fields.ChoiceField(
            choices=Country.objects.values_list("name", "name"),
            required=True,
            widget=forms.widgets.Select(),
            label='国'
        )
        super().__init__(data, files, auto_id, prefix, initial, error_class, label_suffix, empty_permitted, instance, use_required_attribute, renderer, readonly)

    class Meta:
        model = Hoge
```
