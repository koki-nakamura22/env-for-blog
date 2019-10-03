+++
author = "Koki"
categories = ["Hugo"]
date = 2019-10-03T21:52:51+10:00
description = "Hugoで作成したブログのコードブロックにコピーボタンを追加する方法を説明します。"
images = [""]
linktitle = ""
title = "Hugoブログのコードブロックにコピーボタンを追加する方法"
type = "post"

+++
この記事では、Hugoで作成したブログのコードブロックにコピーボタンを追加する方法を説明します。

この記事の内容です。

- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[コードブロックへコピーボタンを追加](#%E3%82%B3%E3%83%BC%E3%83%89%E3%83%96%E3%83%AD%E3%83%83%E3%82%AF%E3%81%B8%E3%82%B3%E3%83%94%E3%83%BC%E3%83%9C%E3%82%BF%E3%83%B3%E3%82%92%E8%BF%BD%E5%8A%A0)</font>
  - <font color="#1111cc">[JavaScriptのコードを追加](#javascript%E3%81%AE%E3%82%B3%E3%83%BC%E3%83%89%E3%82%92%E8%BF%BD%E5%8A%A0)</font>
  - <font color="#1111cc">[CSSのコードを追加](#css%E3%81%AE%E3%82%B3%E3%83%BC%E3%83%89%E3%82%92%E8%BF%BD%E5%8A%A0)</font>
- <font color="#1111cc">[参考にさせていただいたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%95%E3%81%9B%E3%81%A6%E3%81%84%E3%81%9F%E3%81%A0%E3%81%84%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>

<br>
---

# 対象読者
- Hugoで作成したブログのコードブロックにコピーボタンを追加したい方

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

# コードブロックへコピーボタンを追加
## JavaScriptのコードを追加
下記のコードをstatic/js/add-on.jsへ追加します。  
今回、即時関数を使用しているのは、今後機能を追加することを考えると変数のスコープ範囲を広げたくなかったからです。
```javascript:add-on.js
(() => {
  'use strict';

  if(!document.queryCommandSupported('copy')) {
    return;
  }

  function flashCopyMessage(el, msg) {
    el.textContent = msg;
    setTimeout(() => {
      el.textContent = "Copy";
    }, 1000);
  }

  function selectText(node) {
    let selection = window.getSelection();
    let range = document.createRange();
    if (node.childElementCount === 2) {
      // Skip the title.
      range.selectNodeContents(node.children[1]);
    } else {
      range.selectNodeContents(node);
    }
    selection.removeAllRanges();
    selection.addRange(range);
    return selection;
  }

  function addCopyButton(containerEl) {
    let copyBtn = document.createElement("button");
    copyBtn.className = "highlight-copy-btn";
    copyBtn.textContent = "Copy";

    let codeEl = containerEl.firstElementChild;
    copyBtn.addEventListener('click', () => {
      try {
        let selection = selectText(codeEl);
        document.execCommand('copy');
        selection.removeAllRanges();

        flashCopyMessage(copyBtn, 'Copied!')
      } catch(e) {
        console && console.log(e);
        flashCopyMessage(copyBtn, 'Failed :\'(')
      }
    });

    containerEl.appendChild(copyBtn);
  }

  // Add copy button to code blocks
  let highlightBlocks = document.getElementsByClassName('highlight');
  Array.prototype.forEach.call(highlightBlocks, addCopyButton);
})();
```

## CSSのコードを追加
下記のコードをstatic/css/add-on.cssへ追加します。
```css:add-on.css
.highlight {
    position: relative;
}
.highlight pre {
    padding-right: 75px;
}
.highlight-copy-btn {
    position: absolute;
    bottom: 7px;
    right: 7px;
    border: 0;
    border-radius: 4px;
    padding: 1px;
    font-size: 0.7em;
    line-height: 1.8;
    color: #fff;
    background-color: #777;
    min-width: 55px;
    text-align: center;
}
.highlight-copy-btn:hover {
    background-color: #666;
}
```

<br>
以上です！

<br>
---

# 参考にさせていただいたページ
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://www.fiznool.com/blog/2018/09/14/adding-click-to-copy-buttons-to-a-hugo-powered-blog/" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://www.fiznool.com/blog/2018/09/14/adding-click-to-copy-buttons-to-a-hugo-powered-blog/" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://www.fiznool.com/blog/2018/09/14/adding-click-to-copy-buttons-to-a-hugo-powered-blog/" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Adding click-to-copy buttons to a Hugo powered blog</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://www.fiznool.com/blog/2018/09/14/adding-click-to-copy-buttons-to-a-hugo-powered-blog/" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://www.fiznool.com/blog/2018/09/14/adding-click-to-copy-buttons-to-a-hugo-powered-blog/" border="0" alt="" /></a></span></div></div>
