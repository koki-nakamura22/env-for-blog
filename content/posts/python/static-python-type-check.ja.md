+++
author = "Koki"
categories = ["Python"]
tags = ["Python"]
date = 2022-08-20T18:42:32+09:00
linktitle = ""
title = "Pythonの静的型チェックをコマンドもしくはVS Code拡張機能に自動で行わせる方法"
description = "この記事では、Pythonの静的型チェックをコマンドもしくはVS Code拡張機能に自動で行わせる方法について説明します。"
type = "post"
+++

この記事では、Pythonの静的型チェックをコマンドもしくはVS Code拡張機能に自動で行わせる方法を説明します。  
最初に方法、その後に「何故、それを調べようと思ったのか？」を知りたい方向けに経緯を書いているので、興味のある方はそちらも読んでいただけると嬉しいです。  

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[Pythonの静的型チェックを行う](#python%E3%81%AE%E9%9D%99%E7%9A%84%E5%9E%8B%E3%83%81%E3%82%A7%E3%83%83%E3%82%AF%E3%82%92%E8%A1%8C%E3%81%86)</font>
  - <font color="#1111cc">[コマンドを使用](#%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E3%82%92%E4%BD%BF%E7%94%A8)</font>
  - <font color="#1111cc">[VS Codeの拡張機能を使用](#vs-code%E3%81%AE%E6%8B%A1%E5%BC%B5%E6%A9%9F%E8%83%BD%E3%82%92%E4%BD%BF%E7%94%A8)</font>
- <font color="#1111cc">[何故調べようと思ったのか](#%E4%BD%95%E6%95%85%E8%AA%BF%E3%81%B9%E3%82%88%E3%81%86%E3%81%A8%E6%80%9D%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%8B)</font>
  - <font color="#1111cc">[事の発端は趣味でTypeScriptを触ったことによる静的型付け言語熱の再燃](#%E4%BA%8B%E3%81%AE%E7%99%BA%E7%AB%AF%E3%81%AF%E8%B6%A3%E5%91%B3%E3%81%A7typescript%E3%82%92%E8%A7%A6%E3%81%A3%E3%81%9F%E3%81%93%E3%81%A8%E3%81%AB%E3%82%88%E3%82%8B%E9%9D%99%E7%9A%84%E5%9E%8B%E4%BB%98%E3%81%91%E8%A8%80%E8%AA%9E%E7%86%B1%E3%81%AE%E5%86%8D%E7%87%83)</font>
  - <font color="#1111cc">[たまたまPython互換の静的型付け言語を開発された型の記事が流れてきて興味を持つ](#%E3%81%9F%E3%81%BE%E3%81%9F%E3%81%BEpython%E4%BA%92%E6%8F%9B%E3%81%AE%E9%9D%99%E7%9A%84%E5%9E%8B%E4%BB%98%E3%81%91%E8%A8%80%E8%AA%9E%E3%82%92%E9%96%8B%E7%99%BA%E3%81%95%E3%82%8C%E3%81%9F%E5%9E%8B%E3%81%AE%E8%A8%98%E4%BA%8B%E3%81%8C%E6%B5%81%E3%82%8C%E3%81%A6%E3%81%8D%E3%81%A6%E8%88%88%E5%91%B3%E3%82%92%E6%8C%81%E3%81%A4)</font>
  - <font color="#1111cc">[Nimとの出会い](#nim%E3%81%A8%E3%81%AE%E5%87%BA%E4%BC%9A%E3%81%84)</font>
  - <font color="#1111cc">[そして本記事冒頭の話へ...](#%E3%81%9D%E3%81%97%E3%81%A6%E6%9C%AC%E8%A8%98%E4%BA%8B%E5%86%92%E9%A0%AD%E3%81%AE%E8%A9%B1%E3%81%B8)</font>
- <font color="#1111cc">[元になったツイート達](#%E5%85%83%E3%81%AB%E3%81%AA%E3%81%A3%E3%81%9F%E3%83%84%E3%82%A4%E3%83%BC%E3%83%88%E9%81%94)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者
- Pythonの型チェックをコマンドもしくはVS Code上で行いたい方

## 環境
- VS Code

## 前提条件
- pipインストール済み
- VS Codeインストール済み
- Pythonで型アノテーションを記述する方法を知っていること (本記事では説明を省略)

## Pythonの静的型チェックを行う

### コマンドを使用

mypyというライブラリをpipでインストールし使用する。  
使用方法は以下の公式ページに書いてあるので、こちらを参照。  
<a href="https://github.com/python/mypy" target="_blank" rel="noopener noreferrer" style="all: unset; cursor: pointer;" >
<div style="width: 100%; max-width: 36rem; height: 9rem; border-width: 1px; border-style: solid; border-color: rgb(209, 213, 219); display: flex; background-color: rgb(255, 255, 255);" onMouseOut="this.style.background='rgb(255, 255, 255)'" onMouseOver="this.style.background='rgb(243, 244, 246)'">
  <div style="padding: 0.75rem; width: 75%; display: flex; flex-direction: column; justify-content: space-between;">
    <div>
      <div style="color: rgb(31, 41, 55); font-size: 1.0rem; line-height: 1.5rem; max-height: 3.0rem; overflow: hidden;">GitHub - python/mypy: Optional static typing for Python</div>
      <div style="font-size: 0.8rem; line-height: 1.25rem; max-height: 2.5rem; color: rgb(107, 114, 128); overflow: hidden; text-overflow: ellipsis;">Optional static typing for Python. Contribute to python/mypy development by creating an account on GitHub.</div>
    </div>
    <div style="font-size: 0.75rem; line-height: 1rem; color: rgb(31, 41, 55);">github.com</div>
  </div>
  <div style="border-left-width: 1px; width: 25%;">
    <img src=https://opengraph.githubassets.com/9e4726565f0b6eefd4a45fe4132460d217bcb8d1eb3e05818d60429bc9f07322/python/mypy alt="No Image" style="object-fit: cover; width: 100%; height: 100%; background-color: rgb(209, 213, 219);" loading="lazy" />
  </div>
</div></a>


### VS Codeの拡張機能を使用

以下のページの通り、VS Codeに拡張機能Pylanceをインストールした上で1つ設定を行うと実現可能。  
設定方法についてはここで書いてしまうと参照元記事の筆者に申し訳ないので、そちらを参照。
<a href="https://www.emmanuelgautier.com/blog/enable-vscode-python-type-checking" target="_blank" rel="noopener noreferrer" style="all: unset; cursor: pointer;" >
<div style="width: 100%; max-width: 36rem; height: 9rem; border-width: 1px; border-style: solid; border-color: rgb(209, 213, 219); display: flex; background-color: rgb(255, 255, 255);" onMouseOut="this.style.background='rgb(255, 255, 255)'" onMouseOver="this.style.background='rgb(243, 244, 246)'">
  <div style="padding: 0.75rem; width: 75%; display: flex; flex-direction: column; justify-content: space-between;">
    <div>
      <div style="color: rgb(31, 41, 55); font-size: 1.0rem; line-height: 1.5rem; max-height: 3.0rem; overflow: hidden;">How to enable Python type checking in VSCode</div>
      <div style="font-size: 0.8rem; line-height: 1.25rem; max-height: 2.5rem; color: rgb(107, 114, 128); overflow: hidden; text-overflow: ellipsis;">Since version 3.5, Python now has support for type hints. This typing is a cool new feature allowing...</div>
    </div>
    <div style="font-size: 0.75rem; line-height: 1rem; color: rgb(31, 41, 55);">www.emmanuelgautier.com</div>
  </div>
  <div style="border-left-width: 1px; width: 25%;">
    <img src=undefined alt="No Image" style="object-fit: cover; width: 100%; height: 100%; background-color: rgb(209, 213, 219);" loading="lazy" />
  </div>
</div></a>

## 何故調べようと思ったのか

### 事の発端は趣味でTypeScriptを触ったことによる静的型付け言語熱の再燃

筆者自身が最近趣味でTypeScriptを触り、やっぱり静的型チェックがあるプログラミング言語の方が以下の恩恵を受けることができ、良いなと思ったためです。  
1. インテリセンスの恩恵をより受けることができる。
2. 型周りのバグを自動で減らせる

### たまたまPython互換の静的型付け言語を開発された型の記事が流れてきて興味を持つ

ほぼ同タイミングで、Python互換の静的型付け言語を開発された型の記事が流れてきました。  
記事はこちらです。  
<a href="https://zenn.dev/mtshiba/articles/a38c9fcd9646d4" target="_blank" rel="noopener noreferrer" style="all: unset; cursor: pointer;" >
<div style="width: 100%; max-width: 36rem; height: 9rem; border-width: 1px; border-style: solid; border-color: rgb(209, 213, 219); display: flex; background-color: rgb(255, 255, 255);" onMouseOut="this.style.background='rgb(255, 255, 255)'" onMouseOver="this.style.background='rgb(243, 244, 246)'">
  <div style="padding: 0.75rem; width: 75%; display: flex; flex-direction: column; justify-content: space-between;">
    <div>
      <div style="color: rgb(31, 41, 55); font-size: 1.0rem; line-height: 1.5rem; max-height: 3.0rem; overflow: hidden;">Python互換の静的型付け言語「Erg」</div>
      <div style="font-size: 0.8rem; line-height: 1.25rem; max-height: 2.5rem; color: rgb(107, 114, 128); overflow: hidden; text-overflow: ellipsis;">undefined</div>
    </div>
    <div style="font-size: 0.75rem; line-height: 1rem; color: rgb(31, 41, 55);">zenn.dev</div>
  </div>
  <div style="border-left-width: 1px; width: 25%;">
    <img src=https://res.cloudinary.com/zenn/image/upload/s--fk-oUBcV--/co_rgb:222%2Cg_south_west%2Cl_text:notosansjp-medium.otf_37_bold:mtshiba%2Cx_203%2Cy_98/c_fit%2Cco_rgb:222%2Cg_north_west%2Cl_text:notosansjp-medium.otf_70_bold:Python%25E4%25BA%2592%25E6%258F%259B%25E3%2581%25AE%25E9%259D%2599%25E7%259A%2584%25E5%259E%258B%25E4%25BB%2598%25E3%2581%2591%25E8%25A8%2580%25E8%25AA%259E%25E3%2580%258CErg%25E3%2580%258D%2Cw_1010%2Cx_90%2Cy_100/g_south_west%2Ch_90%2Cl_fetch:aHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EtL0FPaDE0R2g0WVFyaVliOXdBdEtlTUJXZjd1REJ5d2Q3UnJCYW5TSmlQYkRGPXM5Ni1j%2Cr_max%2Cw_90%2Cx_87%2Cy_72/v1627274783/default/og-base_z4sxah.png alt="No Image" style="object-fit: cover; width: 100%; height: 100%; background-color: rgb(209, 213, 219);" loading="lazy" />
  </div>
</div></a>

最初は「いいじゃん！」と思ったのですが、自分が欲しい機能を落ち着いて考えてみたところ、以下のツイートに行きつきました。
{{<tweet 1558308564476633088>}}

### Nimとの出会い

ここで「JavaScriptに対するTypeScriptのような言語が、Pythonにもあるのだろうか？」と思い調べ、
<font color="#1111cc"><a href="https://nim-lang.org"  target="_blank">Nim</a></font>
というプログラミング言語を知ることになります。  
軽く触ってみたところ好感触だったのですが、将来的にAWS Lambdaなどで使用することを考えると、ランタイム環境を自前で準備することを考えるとデフォルトで対応されていないと実用は厳しいと考え、それ以上調べることを中断することにしました。

### そして本記事冒頭の話へ...

そして、本記事冒頭の話へ繋がります。  
「そもそも言語で型アノテーションを記述できるなら、それを元にチェックするコマンドがあるのでは？」というところからmypyの存在を知りました。  
次にmypyを触ってみたところ、「いちいちコマンドを実行するのは面倒くさいのでPythonのLinterが無いかな...」と調べてみたところ、Microsoftが開発している拡張機能Pylanceが対応していることを知りました。  

以上が、本記事冒頭の内容に辿りつくまでの経緯です。  
これで、Pythonを使用したそこそこ以上の規模の開発に対する心理的ハードルが下がりますね。  

## 元になったツイート達

{{<tweet 1560920503447015424>}}
{{<tweet 1560921825046999040>}}

