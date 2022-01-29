+++
author = "Koki"
categories = ["CSS"]
date = 2019-10-07T18:31:02+11:00
description = "同一ページ内へ飛ぶ<a>タグをクリックした時の表示先位置を調整する方法を説明します。"
images = [""]
linktitle = ""
title = "<a>タグをクリックした時の表示先位置を調整する方法"
type = "post"

+++
この記事では、同一ページ内へ飛ぶ&lt;a&gt;タグをクリックした時の表示先位置を調整する方法を説明します。  
何故調整する必要があるのか？それは、本ブログの様に固定ヘッダを使用していると、&lt;a&gt;タグをクリックした時に表示されるアンカーがヘッダの後ろに隠れるからです。  

この記事の内容です。

- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[リンクのジャンプ先位置調整](#%E3%83%AA%E3%83%B3%E3%82%AF%E3%81%AE%E3%82%B8%E3%83%A3%E3%83%B3%E3%83%97%E5%85%88%E4%BD%8D%E7%BD%AE%E8%AA%BF%E6%95%B4)</font>
- <font color="#1111cc">[参考にさせていただいたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%95%E3%81%9B%E3%81%A6%E3%81%84%E3%81%9F%E3%81%A0%E3%81%84%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>


## 対象読者
- 同一ページ内へ飛ぶ&lt;a&gt;タグをクリックした時の表示先位置を調整したい方


## 環境
- CSS3


## 前提条件
- なし


## リンクのジャンプ先位置調整
add-on.css内で、下記のコードをリンク先のタグ(アンカー)に設定します。  
この時、padding-topとmargin-topに設定する数値は必ず同じにしてください。
```css:add-on.css
#target-tag {
  display: block;
  padding-top: 60px;
  margin-top: -60px;
}
```
このブログでは、下記のコードにて各見出しに対する調整を行っています。
```css:add-on.css
/* For link destinations adjustment. */
#site-main .post .content h1,
#site-main .post .content h2,
#site-main .post .content h3,
#site-main .post .content h4,
#site-main .post .content h5,
#site-main .post .content h6 {
  display: block;
  padding-top: 60px;
  margin-top: -60px;
}
```


## 参考にさせていただいたページ
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://y-com.info/contents/?p=5641" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://y-com.info/contents/?p=5641" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://y-com.info/contents/?p=5641" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">ページ内リンクのジャンプ先の位置を複雑なタグは無しでCSSだけで調整する方法 | 大阪のホームページ制作会社YCOM</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://y-com.info/contents/?p=5641" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://y-com.info/contents/?p=5641" border="0" alt="" /></a></span></div></div>
