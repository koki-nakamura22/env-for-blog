+++
author = "Koki"
categories = ["Hugo"]
date = 2019-10-02T21:30:25+10:00
description = "Hugoで作成したブログのコードブロックにタイトルを追加する方法を説明します。"
images = [""]
linktitle = ""
title = "Hugoブログのコードブロックにタイトルを追加する方法"
type = "post"

+++
この記事では、Hugoで作成したブログのコードブロックにタイトルを追加する方法を説明します。  

この記事の内容です。

- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[コードブロックへタイトルを追加](#%E3%82%B3%E3%83%BC%E3%83%89%E3%83%96%E3%83%AD%E3%83%83%E3%82%AF%E3%81%B8%E3%82%BF%E3%82%A4%E3%83%88%E3%83%AB%E3%82%92%E8%BF%BD%E5%8A%A0)</font>
  - <font color="#1111cc">[JavaScriptのコードを追加](#javascript%E3%81%AE%E3%82%B3%E3%83%BC%E3%83%89%E3%82%92%E8%BF%BD%E5%8A%A0)</font>
  - <font color="#1111cc">[CSSのコードを追加](#css%E3%81%AE%E3%82%B3%E3%83%BC%E3%83%89%E3%82%92%E8%BF%BD%E5%8A%A0)</font>
  - <font color="#1111cc">[タイトルの設定方法](#%E3%82%BF%E3%82%A4%E3%83%88%E3%83%AB%E3%81%AE%E8%A8%AD%E5%AE%9A%E6%96%B9%E6%B3%95)</font>
- <font color="#1111cc">[参考にさせていただいたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%95%E3%81%9B%E3%81%A6%E3%81%84%E3%81%9F%E3%81%A0%E3%81%84%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>


## 対象読者
- Hugoで作成したブログのコードブロックにタイトルを追加したい方


## 環境
- Hugo 0.57.2
- Hugo-extended 0.58.2


## 前提条件
- HugoおよびHugo-entendedインストール済み


## コードブロックへタイトルを追加
### JavaScriptのコードを追加
下記のコードをstatic/js/add-on.jsへ追加します。  
今回、即時関数を使用しているのは、今後機能を追加することを考えると変数のスコープ範囲を広げたくなかったからです。
```javascript:add-on.js
(function addTitleToCodeBlock() {
  let list = document.body.getElementsByClassName("highlight");

  for (i = 0; i <= list.length - 1; i++) {
    let code = list[i].firstElementChild.firstElementChild;
    let codeName = code ? code.className.split(":")[1] : null;

    if (codeName) {
      let div = document.createElement("div");
      div.textContent = codeName;
      div.classList.add("code-name");
      code.parentNode.insertBefore(div, code);
    }
  }
}());
```

### CSSのコードを追加
下記のコードをstatic/css/add-on.cssへ追加します。
```css:add-on.css
pre.chroma code {  
  margin-top: -28px;
  padding-top: 40px;
  padding-bottom: 12px;
}

.code-name {
  display: inline-block;
  position: relative;
  padding: 4px 8px;
  background-color: #E7E9EB;
  color: #485A60;
  font-size: 13px;
  font-weight: 400;
}
```

### タイトルの設定方法
コードブロックを使用する時、言語名の後ろに":[title]"を追加します。  
下記はサンプルです。
````
```javascript:test.js
console.log("Have a nice blog life!!!");
```
````

<br>
以上の設定で、コードブロックへタイトルを表示することができます。  
簡単ですね！上記のコードを考えた方に感謝です。


## 参考にさせていただいたページ
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://aakira.app/blog/2018/12/code-block-title/" class="blog-card-thumbnail-link" target="_blank"><img src="https://capture.heartrails.com/120x120/shorten?https://aakira.app/blog/2018/12/code-block-title/" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://aakira.app/blog/2018/12/code-block-title/" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">HugoのコードブロックにQiitaのようなTitleをつける | AABrain</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="https://b.hatena.ne.jp/entry/https://aakira.app/blog/2018/12/code-block-title/" target="_blank"><img border="0" src="https://b.hatena.ne.jp/entry/image/https://aakira.app/blog/2018/12/code-block-title/" border="0" alt="" /></a></span></div></div>