+++
author = "Koki"
categories = ["Hugo"]
date = 2019-10-01T20:50:01+10:00
description = "Hugoで作成したブログにシンタックスハイライト機能を追加する方法を説明します。"
images = [""]
linktitle = ""
title = "Hugoブログにシンタックスハイライト機能を追加する方法"
type = "post"

+++
この記事では、Hugoで作成したブログにシンタックスハイライト機能を追加する方法を説明します。  

この記事の内容です。

- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[シンタックスハイライト機能を追加](#%E3%82%B7%E3%83%B3%E3%82%BF%E3%83%83%E3%82%AF%E3%82%B9%E3%83%8F%E3%82%A4%E3%83%A9%E3%82%A4%E3%83%88%E6%A9%9F%E8%83%BD%E3%82%92%E8%BF%BD%E5%8A%A0)</font>
- <font color="#1111cc">[参考にさせていただいたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%95%E3%81%9B%E3%81%A6%E3%81%84%E3%81%9F%E3%81%A0%E3%81%84%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>

# 対象読者
- Hugoで作成したブログにシンタックスハイライト機能を追加したい方

<br>
---

# 環境
- Hugo 0.57.2
- Hugo-extended 0.58.2

<br>
---

# 前提条件
- HugoおよびHugo-entendedインストール済み

<br>
---

# シンタックスハイライト機能を追加
config.tomlへ下記のコードを追加します。
```toml
pygmentsCodefences = true
pygmentsStyle = "fruity"
```
pygmentsStyleへ代入する値を変更することで、様々なスタイルを使用することができます。  
また、スタイルは下記のページから選択することができます。  
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://xyproto.github.io/splash/docs/all.html" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://xyproto.github.io/splash/docs/all.html" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://xyproto.github.io/splash/docs/all.html" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Chroma Style Gallery</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://xyproto.github.io/splash/docs/all.html" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://xyproto.github.io/splash/docs/all.html" border="0" alt="" /></a></span></div></div>

ちなみに、上記のコードで使用しているスタイルは"fruity"です。

<br>
---

# 参考にさせていただいたページ
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://zwbetz.com/syntax-highlighting-in-hugo-with-chroma/?fbclid=IwAR2DS1e2wbYdyw1ZMnt_XWoAPpwXRXjYozd_UuupfNxHqTxWGwOuMvFwuXo" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://zwbetz.com/syntax-highlighting-in-hugo-with-chroma/?fbclid=IwAR2DS1e2wbYdyw1ZMnt_XWoAPpwXRXjYozd_UuupfNxHqTxWGwOuMvFwuXo" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://zwbetz.com/syntax-highlighting-in-hugo-with-chroma/?fbclid=IwAR2DS1e2wbYdyw1ZMnt_XWoAPpwXRXjYozd_UuupfNxHqTxWGwOuMvFwuXo" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Syntax highlighting in Hugo with Chroma | zwbetz</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://zwbetz.com/syntax-highlighting-in-hugo-with-chroma/?fbclid=IwAR2DS1e2wbYdyw1ZMnt_XWoAPpwXRXjYozd_UuupfNxHqTxWGwOuMvFwuXo" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://zwbetz.com/syntax-highlighting-in-hugo-with-chroma/?fbclid=IwAR2DS1e2wbYdyw1ZMnt_XWoAPpwXRXjYozd_UuupfNxHqTxWGwOuMvFwuXo" border="0" alt="" /></a></span></div></div>
