+++
author = "Koki"
categories = ["Django"]
tags = ["Django"]
date = 2022-11-11T16:43:44+09:00
linktitle = ""
title = "Djangoの特定のViewでキャッシュを無効化する"
description = "この記事では、Djangoの特定のViewでキャッシュを無効化する方法について説明します。"
type = "post"
+++

この記事では、Djangoの特定のViewでキャッシュを無効化する方法について説明します。  
Google Chrome, Microsoft Edge, Firefoxにて動作確認済みです。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[Djangoの特定のViewでキャッシュを無効化する方法](#django%E3%81%AE%E7%89%B9%E5%AE%9A%E3%81%AEview%E3%81%A7%E3%82%AD%E3%83%A3%E3%83%83%E3%82%B7%E3%83%A5%E3%82%92%E7%84%A1%E5%8A%B9%E5%8C%96%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者
- DjangoのViewでキャッシュを無効化したい方


## 環境

- Django v4.1.2


## 前提条件

- なし


## Djangoの特定のViewでキャッシュを無効化する方法

まず最初に、 以下のコードを追加し必要なものをインポートします。
```python
from django.utils.decorators import method_decorator
from django.views.decorators.cache import never_cache
```

次に、以下の様にデコレータをキャッシュを無効化したいViewのクラスに設定します。  
```python
@method_decorator(never_cache, name='dispatch')
class HogeView(LoginRequiredMixin, FormView):
    ...
```

これだけで、特定のViewのキャッシュを無効化できます。
