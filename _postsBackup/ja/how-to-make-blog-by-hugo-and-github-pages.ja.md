+++
author = "Koki"
categories = ["Hugo"]
date = 2019-09-15T22:39:57+10:00
description = "Hugo + GitHub Pagesでブログを作成する方法を説明します。"
images = [""]
linktitle = ""
title = "Hugo + GitHub Pagesでブログを作成する方法"
type = "post"

+++

本記事では、Hugo + GitHub Pagesの組み合わせでブログ環境を構築する方法について説明します。  
上から順番に読んでいただくと、ブログを作成できるような流れになっています。

本記事の内容です。

- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[インストール](#%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)</font>
- <font color="#1111cc">[サイトを作成](#%E3%82%B5%E3%82%A4%E3%83%88%E3%82%92%E4%BD%9C%E6%88%90)</font>
- <font color="#1111cc">[記事を作成](#%E8%A8%98%E4%BA%8B%E3%82%92%E4%BD%9C%E6%88%90)</font>
- <font color="#1111cc">[テーマを適用](#%E3%83%86%E3%83%BC%E3%83%9E%E3%82%92%E9%81%A9%E7%94%A8)</font>
- <font color="#1111cc">[ローカルでサーバ起動](#%E3%83%AD%E3%83%BC%E3%82%AB%E3%83%AB%E3%81%A7%E3%82%B5%E3%83%BC%E3%83%90%E8%B5%B7%E5%8B%95)</font>
- <font color="#1111cc">[GitHub PagesへDeploy](#github-pages%E3%81%B8deploy)</font>
  - <font color="#1111cc">[ゴール](#%E3%82%B4%E3%83%BC%E3%83%AB)</font>
  - <font color="#1111cc">[GitHub上でブログ用のリポジトリを作成](#github%E4%B8%8A%E3%81%A7%E3%83%96%E3%83%AD%E3%82%B0%E7%94%A8%E3%81%AE%E3%83%AA%E3%83%9D%E3%82%B8%E3%83%88%E3%83%AA%E3%82%92%E4%BD%9C%E6%88%90)</font>
  - <font color="#1111cc">[作成したリポジトリをクローン](#%E4%BD%9C%E6%88%90%E3%81%97%E3%81%9F%E3%83%AA%E3%83%9D%E3%82%B8%E3%83%88%E3%83%AA%E3%82%92%E3%82%AF%E3%83%AD%E3%83%BC%E3%83%B3)</font>
  - <font color="#1111cc">[デプロイ用スクリプト作成](#%E3%83%87%E3%83%97%E3%83%AD%E3%82%A4%E7%94%A8%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%97%E3%83%88%E4%BD%9C%E6%88%90)</font>
  - <font color="#1111cc">[GitHub Pagesの設定](#github-pages%E3%81%AE%E8%A8%AD%E5%AE%9A)</font>
  - <font color="#1111cc">[デプロイ](#%E3%83%87%E3%83%97%E3%83%AD%E3%82%A4)</font>
- <font color="#1111cc">[テーマ](#%E3%83%86%E3%83%BC%E3%83%9E)</font>
  - <font color="#1111cc">[テーマ一覧](#%E3%83%86%E3%83%BC%E3%83%9E%E4%B8%80%E8%A6%A7)</font>
  - <font color="#1111cc">[個人的おすすめテーマ](#%E5%80%8B%E4%BA%BA%E7%9A%84%E3%81%8A%E3%81%99%E3%81%99%E3%82%81%E3%83%86%E3%83%BC%E3%83%9E)</font>
- <font color="#1111cc">[参考にしたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%97%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>

---

# 環境
Windows10 (1903)

---

# 前提条件
- Chocolateyインストール済み
- Gitインストール済み

---

# インストール
下記コマンドを実行します。コマンドを実行するディレクトリはどこでも良いです。
```bat
choco install hugo -confirm
choco install hugo-extended -confirm
```
---

# サイトを作成
サイトを作成したいディレクトリで下記コマンドを実行します。  
[サイト名]には、好きなサイト名を入力してください。
```bat
hugo new site [サイト名]
```

---

# 記事を作成
記事を作成するには、作成したサイトディレクトリのルートで下記コマンドを実行します。  
[ディレクトリ名]は、後述する各テーマに沿って指定します。  
[記事名]は、好きな記事名を入力してください。  
```bat
hugo new [ディレクトリ名]/[記事名].md
```
記事作成後は、自由に作成したMarkdownファイルを編集します。

---

# テーマを適用
本記事内では、hugo-future-imperfect-slimを適用します。  
最初に作成したサイトディレクトリのルートで下記のコマンドを実行し、GitHubからthemesディレクトリへテーマをダウンロードします。  
```bat
git clone https://github.com/pacollins/hugo-future-imperfect-slim.git themes/hugo-future-imperfect-slim
```
その後、下記コマンドを同ディレクトリで実行し、サンプルサイトの設定を適用します。  
```bat
xcopy /s /e .\themes\hugo-future-imperfect-slim\exampleSite .
```  
ちなみに、テーマを適用する場合は、下記の様にconfig.tomlへ「theme="[テーマ名]"」の行を追記します。  
```toml
theme = "hugo-future-imperfect-slim"
```

テーマの一覧を確認できるページについては、本記事最後に記述します。

---

# ローカルでサーバ起動
下記コマンドを実行する。
```bat
hugo server
```

また、下記のように「-p [ポート番号]」とオプションを付けると、そのポート番号で起動することが可能。
```bat
hugo server -p 12345
```

<br>
これで、最低限ホームページを作成することができます。

---

# GitHub PagesへDeploy
## ゴール
今回は、GitHub Pagesのサブディレクトリで公開します。
例:下記URLにてブログを公開。  
https://koki-nakamura22.github.io/test-hugo-blog/

---

## GitHub上でブログ用のリポジトリを作成
静的ファイルを公開するためのリポジトリを作成します。  
今回は「test-hugo-blog」という名前のリポジトリを作成します。

---

## 作成したリポジトリをクローン
サイトディレクトリのルートで下記コマンドを実行し、作成したリポジトリをクローンします。  
下記のコマンドでは、念のためクローン前に既存のpublicディレクトリを削除しています。
```bat
rmdir /s /q public
git clone https://github.com/koki-nakamura22/test-hugo-blog.git public
```

---

## デプロイ用スクリプト作成
deploy.batというファイルをサイトディレクトリのルートに作成し、下記コードをファイル内にコピー&ペーストします。
```bat
@echo off

REM Build the project.
hugo

REM Go to public directory.
cd public

REM Add changes to git.
git add .

REM Create a commit message.
set d=%date%
set yyyy=%d:~-10,4%
set mm=%d:~-5,2%
set dd=%d:~-2,2%
set t=%time: =0%
set hh=%t:~0,2%
set mn=%t:~3,2%
set ss=%t:~6,2%
set commitMsg=Site updated: %yyyy%-%mm%-%dd% %hh%:%mn%:%ss%

REM Commit.
git commit -m "%commitMsg%"

REM Push source and build repos.
git push origin master

REM Come back to the project root.
cd ..

echo "The web page has been updated!"
```

---

## GitHub Pagesの設定  
「GitHub上でブログ用のリポジトリを作成」で作成したリポジトリのページを開き、下記の設定を行います。  
Settings -> GitHub PagesのSourceでmaster branchを選択 (大体の場合はmaster branchだと思います。)   
実際の画面を確認しながら作業を行いたい方は、下記ページを参考にするとわかりやすいです。  
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://tech.qookie.jp/posts/hexo-deploy-github-pages-fast/" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://tech.qookie.jp/posts/hexo-deploy-github-pages-fast/" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://tech.qookie.jp/posts/hexo-deploy-github-pages-fast/" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">HexoブログをGitHub Pagesで最速公開する | Qookie Tech</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://tech.qookie.jp/posts/hexo-deploy-github-pages-fast/" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://tech.qookie.jp/posts/hexo-deploy-github-pages-fast/" border="0" alt="" /></a></span></div></div>

---

## デプロイ
先ほど作成した「deploy.bat」を実行します。  
<br>  
ここまで作業が終わったら、実際に作成したurlへアクセスし、Hugoで作成したものが表示されるかを確認してみましょう。

---

# テーマ
## テーマ一覧
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://themes.gohugo.io/" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://themes.gohugo.io/" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://themes.gohugo.io/" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Complete List | Hugo Themes</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://themes.gohugo.io/" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://themes.gohugo.io/" border="0" alt="" /></a></span></div></div>

---

## 個人的おすすめテーマ
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://themes.gohugo.io/hugo-primer/" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://themes.gohugo.io/hugo-primer/" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://themes.gohugo.io/hugo-primer/" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Hugo Primer | Hugo Themes</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://themes.gohugo.io/hugo-primer/" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://themes.gohugo.io/hugo-primer/" border="0" alt="" /></a></span></div></div>
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://themes.gohugo.io/future-imperfect/" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://themes.gohugo.io/future-imperfect/" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://themes.gohugo.io/future-imperfect/" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Future Imperfect | Hugo Themes</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://themes.gohugo.io/future-imperfect/" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://themes.gohugo.io/future-imperfect/" border="0" alt="" /></a></span></div></div>
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://themes.gohugo.io/hugo-future-imperfect-slim/" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://themes.gohugo.io/hugo-future-imperfect-slim/" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://themes.gohugo.io/hugo-future-imperfect-slim/" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Hugo Future Imperfect Slim | Hugo Themes</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://themes.gohugo.io/hugo-future-imperfect-slim/" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://themes.gohugo.io/hugo-future-imperfect-slim/" border="0" alt="" /></a></span></div></div>
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://themes.gohugo.io/hugo-nuo/" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://themes.gohugo.io/hugo-nuo/" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://themes.gohugo.io/hugo-nuo/" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Hugo Nuo | Hugo Themes</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://themes.gohugo.io/hugo-nuo/" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://themes.gohugo.io/hugo-nuo/" border="0" alt="" /></a></span></div></div>

---

# 参考にしたページ
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://gohugo.io/getting-started/quick-start/" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://gohugo.io/getting-started/quick-start/" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://gohugo.io/getting-started/quick-start/" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Quick Start | Hugo</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://gohugo.io/getting-started/quick-start/" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://gohugo.io/getting-started/quick-start/" border="0" alt="" /></a></span></div></div>
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://gohugo.io/commands/" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://gohugo.io/commands/" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://gohugo.io/commands/" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Commands | Hugo</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://gohugo.io/commands/" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://gohugo.io/commands/" border="0" alt="" /></a></span></div></div>
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://qiita.com/Blank71/items/88a6c76ca9e162af73fe" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://qiita.com/Blank71/items/88a6c76ca9e162af73fe" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://qiita.com/Blank71/items/88a6c76ca9e162af73fe" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">HUGOとGitHub Pagesで自分のBlogページを作ってみた（Windows） - Qiita</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://qiita.com/Blank71/items/88a6c76ca9e162af73fe" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://qiita.com/Blank71/items/88a6c76ca9e162af73fe" border="0" alt="" /></a></span></div></div>
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://iikanji.hatenablog.jp/entry/2019/06/03/223531" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://iikanji.hatenablog.jp/entry/2019/06/03/223531" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://iikanji.hatenablog.jp/entry/2019/06/03/223531" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Hugoを使って生成した静的ページをGithub pagesにデプロイする - FREITAGEEK</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://iikanji.hatenablog.jp/entry/2019/06/03/223531" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://iikanji.hatenablog.jp/entry/2019/06/03/223531" border="0" alt="" /></a></span></div></div>
