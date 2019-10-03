+++
author = "Koki"
categories = ["Hugo"]
date = 2019-10-03T21:52:51+10:00
description = "Explain how to add a copy code button on Hugo blog."
images = [""]
linktitle = ""
title = "Adding copy code button to Hugo blog"
type = "post"

+++
This article explains how to add a copy code button on Hugo blog.

The following lists are the table of contents about this article.

- <font color="#1111cc">[Target audience](#target-audience)</font>
- <font color="#1111cc">[Environment](#environment)</font>
- <font color="#1111cc">[Preconditions](#preconditions)</font>
- <font color="#1111cc">[Adding copy code button](#adding-copy-code-button)</font>
  - <font color="#1111cc">[Adding JavaScript code](#adding-javascript-code)</font>
  - <font color="#1111cc">[Adding CSS code](#adding-css-code)</font>
- <font color="#1111cc">[Reference articles](#reference-articles)</font>

<br>
---

# Target audience
- Those who want to add a copy code button to code block on Hugo blog.

<br>
---

# Environment
- Hugo 0.57.2
- Hugo-extended 0.58.2

<br>
---

# Preconditions
- Installed Hugo and Hugo-extended

<br>
---

# Adding copy code button
## Adding JavaScript code
Add the following code to static/js/add-on.js.  
I use IIFE (Immediately Invoked Function Expression) because I want to narrow the scope of a variable.
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

## Adding CSS code
Add the following code to static/css/add-on.css.
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
That's it!

<br>
---

# Reference articles
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://www.fiznool.com/blog/2018/09/14/adding-click-to-copy-buttons-to-a-hugo-powered-blog/" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://www.fiznool.com/blog/2018/09/14/adding-click-to-copy-buttons-to-a-hugo-powered-blog/" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://www.fiznool.com/blog/2018/09/14/adding-click-to-copy-buttons-to-a-hugo-powered-blog/" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Adding click-to-copy buttons to a Hugo powered blog</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://www.fiznool.com/blog/2018/09/14/adding-click-to-copy-buttons-to-a-hugo-powered-blog/" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://www.fiznool.com/blog/2018/09/14/adding-click-to-copy-buttons-to-a-hugo-powered-blog/" border="0" alt="" /></a></span></div></div>
