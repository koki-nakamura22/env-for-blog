+++
author = "Koki"
categories = ["CSS"]
date = 2019-10-07T18:31:02+11:00
description = "Explain how to adjust the display position of the <a> link destination in the same page (anchor)."
images = [""]
linktitle = ""
title = "Adjusting the display position of the <a> link destination in the same page (anchor)"
type = "post"

+++
This article explains how to adjust the display position of the &lt;a&gt; link destination in the same page.  
If we are using a fixed header, we need to adjust the position of the anchor when clicked the &lt;a&gt; link.  
Because the anchor is hidden behind the header.  

The following lists are the table of contents about this article.

- <font color="#1111cc">[Target audience](#target-audience)</font>
- <font color="#1111cc">[Environment](#environment)</font>
- <font color="#1111cc">[Preconditions](#preconditions)</font>
- <font color="#1111cc">[Adjusting link destinations position](#adjusting-link-destinations-position)</font>
- <font color="#1111cc">[Reference articles](#reference-articles)</font>


## Target audience
- Those who want to adjust the display position of the &lt;a&gt; link destination in the same page.


## Environment
- CSS3


## Preconditions
Nothing.


## Adjusting link destinations position
Setting the following codes to the target anchor tag to add-on.css.  
When you set it, you must set the same number to padding-top and margin-top.
```css:add-on.css
#target-tag {
  display: block;
  padding-top: 60px;
  margin-top: -60px;
}
```
In this blog, I adjust the headings in the post using the following codes.
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


## Reference articles
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://y-com.info/contents/?p=5641" class="blog-card-thumbnail-link" target="_blank"><img src="https://capture.heartrails.com/120x120/shorten?https://y-com.info/contents/?p=5641" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://y-com.info/contents/?p=5641" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">ページ内リンクのジャンプ先の位置を複雑なタグは無しでCSSだけで調整する方法 | 大阪のホームページ制作会社YCOM</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="https://b.hatena.ne.jp/entry/https://y-com.info/contents/?p=5641" target="_blank"><img border="0" src="https://b.hatena.ne.jp/entry/image/https://y-com.info/contents/?p=5641" border="0" alt="" /></a></span></div></div>
