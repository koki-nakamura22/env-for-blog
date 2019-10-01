+++
author = "Koki"
categories = ["Hugo"]
date = 2019-10-01T20:50:00+10:00
description = "This article explains how to add a function of syntax highlight on Hugo blog."
images = [""]
linktitle = ""
title = "How to add a function of syntax highlight to Hugo blog"
type = "post"

+++
This article explains how to add a function of syntax highlight on Hugo blog.

The following lists are the table of contents about this article.

- <font color="#1111cc">[Target audience](#target-audience)</font>
- <font color="#1111cc">[Environment](#environment)</font>
- <font color="#1111cc">[Preconditions](#preconditions)</font>
- <font color="#1111cc">[Add a function of syntax highlight](#add-a-function-of-syntax-highlight)</font>
- <font color="#1111cc">[Reference articles](#reference-articles)</font>

# Target audience
- Those who want to add a function of syntax highlight on Hugo blog.

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

# Add a function of syntax highlight
Add the following codes to config.toml.
```toml
pygmentsCodefences = true
pygmentsStyle = "fruity"
```
You can chose a style on pygmentsStyle from the below pages.  
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://xyproto.github.io/splash/docs/all.html" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://xyproto.github.io/splash/docs/all.html" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://xyproto.github.io/splash/docs/all.html" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Chroma Style Gallery</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://xyproto.github.io/splash/docs/all.html" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://xyproto.github.io/splash/docs/all.html" border="0" alt="" /></a></span></div></div>

The above code chooses style that is "fruity".

<br>
---

# Reference articles
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://zwbetz.com/syntax-highlighting-in-hugo-with-chroma/?fbclid=IwAR2DS1e2wbYdyw1ZMnt_XWoAPpwXRXjYozd_UuupfNxHqTxWGwOuMvFwuXo" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://zwbetz.com/syntax-highlighting-in-hugo-with-chroma/?fbclid=IwAR2DS1e2wbYdyw1ZMnt_XWoAPpwXRXjYozd_UuupfNxHqTxWGwOuMvFwuXo" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://zwbetz.com/syntax-highlighting-in-hugo-with-chroma/?fbclid=IwAR2DS1e2wbYdyw1ZMnt_XWoAPpwXRXjYozd_UuupfNxHqTxWGwOuMvFwuXo" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Syntax highlighting in Hugo with Chroma | zwbetz</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://zwbetz.com/syntax-highlighting-in-hugo-with-chroma/?fbclid=IwAR2DS1e2wbYdyw1ZMnt_XWoAPpwXRXjYozd_UuupfNxHqTxWGwOuMvFwuXo" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://zwbetz.com/syntax-highlighting-in-hugo-with-chroma/?fbclid=IwAR2DS1e2wbYdyw1ZMnt_XWoAPpwXRXjYozd_UuupfNxHqTxWGwOuMvFwuXo" border="0" alt="" /></a></span></div></div>
