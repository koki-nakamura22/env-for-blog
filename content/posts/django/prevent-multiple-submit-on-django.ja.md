+++
author = "Koki"
categories = ["Django"]
tags = ["Django"]
date = 2022-11-11T16:55:59+09:00
linktitle = ""
title = "DjangoのFormで多重submitを防ぐ"
description = "この記事では、DjangoのFormで多重submitを防ぐ方法について説明します。Djangoの...と書いてはいますが、Djangoに限らず、HTMLのformを使用するのであればどこでも使用可能だと思います。"
type = "post"
+++

この記事では、DjangoのFormで多重submitを防ぐ方法について説明します。  
Djangoの...と書いてはいますが、Djangoに限らず、HTMLのformを使用するのであればどこでも使用可能だと思います。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[DjangoのFormで多重submitを防ぐ](#django%E3%81%AEform%E3%81%A7%E5%A4%9A%E9%87%8Dsubmit%E3%82%92%E9%98%B2%E3%81%90)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者

- DjangoのFormで多重submitを防ぎたい方


## 環境

- Django v4.1.2


## 前提条件

- なし


## DjangoのFormで多重submitを防ぐ

以下のようにformのtypeがsubmitのinput要素に、onclickイベントを設定する。
```html
<input type="submit" value="送信" onclick="this.disabled=true,this.form.submit();">
```

これだけで、HTMLのformで多重submitを防ぐことができます。  
ただ、この方法だと連続でクリックしても2回目以降がsubmitされないというだけで、見た目は何も変わりません。  
もし見た目の変化 (1回クリックされたらグレーアウトするなど) が必要であれば、別途JavaScriptやTypeScriptにてCSSを動的に変更する処理を実装し使用してください。
