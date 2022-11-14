+++
author = "Koki"
categories = ["Markdown"]
tags = ["Markdown"]
date = 2022-11-14T12:31:38+09:00
linktitle = ""
title = "doctocで目次を自動生成しつつ文字色を設定するスクリプト"
description = "この記事では、doctocで目次を自動生成しつつ文字色を設定するスクリプトを紹介します。"
type = "post"
+++

この記事では、doctocで目次を自動生成しつつ文字色を設定するスクリプトを紹介します。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[スクリプトについて](#%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%97%E3%83%88%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6)</font>
- <font color="#1111cc">[余談](#%E4%BD%99%E8%AB%87)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者

- doctocで目次を自動生成しつつ、リンク文字列に色をしたい方


## 環境

- WSL2 (Ubuntu 22.04)
- Node.js (v18.1.0)


## 前提条件

- Node.jsインストール済み
- doctocインストール済み


## スクリプトについて

コードは以下の通りです。  
ご自由にお使いください + カスタマイズしてください。  
使用方法は、本スクリプトを任意のディレクトリへ配置した後に
```sh
node doctoc-ext.js [マークダウンファイルのパス]
```
を実行するだけです。 **[マークダウンファイルのパス]** には任意の値を指定してください。マークダウンファイルのパスは半角スペース区切りで複数指定できるようにしています。  
<br>
本スクリプトの内容です。  
本スクリプトでは、コマンドライン引数にて渡されたファイルに対し以下の処理を行っています。  
1. doctocを使用し目次の生成
2. 生成された目次に対し、正規表現を使用しfontタグを設定
{{< gist koki-nakamura22 4cbcf410d9695db27ded76acce67f562 >}}


## 余談

私の場合、本記事で紹介したスクリプトはHugoブログの記事に対し使用しているのですが、「何故、GitHub Actionsなどで自動化しないのか？」について。  
理由としては以下の2つがあります。  
1. 以下のページなどを参照した感じ、文字色を変更できなさそう。  
→文字色が明らかにリンクだと分かるものにできないと、微妙な感じになるためこれは必須だと考えている。
<a href="https://technote.space/posts/wpxml-toc-generator/" target="_blank" rel="noopener noreferrer" style="all: unset; cursor: pointer;" >
<div style="width: 100%; max-width: 36rem; height: 9rem; border-width: 1px; border-style: solid; border-color: rgb(209, 213, 219); display: flex; background-color: rgb(255, 255, 255);" onMouseOut="this.style.background='rgb(255, 255, 255)'" onMouseOver="this.style.background='rgb(243, 244, 246)'">
  <div style="padding: 0.75rem; width: 75%; display: flex; flex-direction: column; justify-content: space-between;">
    <div>
      <div style="color: rgb(31, 41, 55); font-size: 1.0rem; line-height: 1.5rem; max-height: 3.0rem; overflow: hidden;">READMEの目次の生成を自動化するGitHub Actions | Technote</div>
      <div style="font-size: 0.8rem; line-height: 1.25rem; max-height: 2.5rem; color: rgb(107, 114, 128); overflow: hidden; text-overflow: ellipsis;">READMEなどの目次を自動生成する GitHub Actions です。 導入手順 目次の位置を指定する 目次を入れたいマークダウンファイル内に以下のようなコメントを追加します。  例：   WORKFLOWを設定  例：   オプ.....</div>
    </div>
    <div style="font-size: 0.75rem; line-height: 1rem; color: rgb(31, 41, 55);">technote.space</div>
  </div>
  <div style="border-left-width: 1px; width: 25%;">
    <img src=https://technote.space/uploads/2019/08/github-actions.png alt="No Image" style="object-fit: cover; width: 100%; height: 100%; background-color: rgb(209, 213, 219);" loading="lazy" />
  </div>
</div></a>

2. デプロイ前にローカル環境で自分が思っている通りに目次を設定できているかを確認したい。  
→デプロイ時に自動で目次を生成するようにしてしまうと、ミスがあった際に再デプロイで必要になり、これは微妙だと考えている。

上記からスクリプトを作成し実行することで対応しているのですが、ここらへんをいい感じに解決できるソリューションがあれば嬉しいなーと思いつつ、途中で考えているのをやめた状態です。  
<br>
以上、余談でした。
