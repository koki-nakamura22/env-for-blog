+++
author = "Koki"
categories = ["Hugo"]
date = 2019-10-02T21:30:24+10:00
description = "This article explains how to add a title to code block on Hugo blog."
images = [""]
linktitle = ""
title = "How to add a title to code block on Hugo blog"
type = "post"

+++
This article explains how to add a title to code block on Hugo blog.

The following lists are the table of contents about this article.

- <font color="#1111cc">[Target audience](#target-audience)</font>
- <font color="#1111cc">[Environment](#environment)</font>
- <font color="#1111cc">[Preconditions](#preconditions)</font>
- <font color="#1111cc">[Add a title to code block](#add-a-title-to-code-block)</font>
  - <font color="#1111cc">[Add JavaScript code](#add-javascript-code)</font>
  - <font color="#1111cc">[Add CSS code](#add-css-code)</font>
  - <font color="#1111cc">[How to set a title](#how-to-set-a-title)</font>
- <font color="#1111cc">[Reference articles](#reference-articles)</font>


## Target audience
- Those who want to add a title to code block on Hugo blog.


## Environment
- Hugo 0.57.2
- Hugo-extended 0.58.2


## Preconditions
- Installed Hugo and Hugo-extended


## Add a title to code block
### Add JavaScript code
Add the following code to static/js/add-on.js.  
I use IIFE (Immediately Invoked Function Expression) because I want to narrow the scope of a variable.
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

### Add CSS code
Add the following code to static/css/add-on.css.
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

### How to set a title
When you use code block, add ":[title]" to after language name.  
The following thing is example.  
````
```javascript:test.js
console.log("Have a nice blog life!!!");
```
````

<br>
That's it! It's so easy!  
Thank you very much author of above codes!  
Guys, have a nice blog life!


## Reference articles
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://aakira.app/blog/2018/12/code-block-title/" class="blog-card-thumbnail-link" target="_blank"><img src="https://capture.heartrails.com/120x120/shorten?https://aakira.app/blog/2018/12/code-block-title/" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://aakira.app/blog/2018/12/code-block-title/" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">HugoのコードブロックにQiitaのようなTitleをつける | AABrain</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="https://b.hatena.ne.jp/entry/https://aakira.app/blog/2018/12/code-block-title/" target="_blank"><img border="0" src="https://b.hatena.ne.jp/entry/image/https://aakira.app/blog/2018/12/code-block-title/" border="0" alt="" /></a></span></div></div>
