+++
author = "Koki"
categories = ["Hugo"]
tags = ["Hugo"]
date = 2022-11-14T11:32:51+09:00
linktitle = ""
title = "実行環境のOSに依存しないHugoで作成したサイトのビルドとデプロイを一括で行うスクリプトを開発した話"
description = "この記事では、開発したHugoで作成したサイトのビルドとデプロイを一括で行うスクリプトを紹介します。"
type = "post"
+++

この記事では、開発したHugoで作成したサイトのビルドとデプロイを一括で行うスクリプトを紹介します。  
過去にも似たような記事を書いていますが、今回は実行環境のOSに依存しないものにしています。  

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[開発したスクリプトについて](#%E9%96%8B%E7%99%BA%E3%81%97%E3%81%9F%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%97%E3%83%88%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6)</font>
- <font color="#1111cc">[ブログがGitHub Pagesでホストされていると、そもそもスクリプトが不要な話](#%E3%83%96%E3%83%AD%E3%82%B0%E3%81%8Cgithub-pages%E3%81%A7%E3%83%9B%E3%82%B9%E3%83%88%E3%81%95%E3%82%8C%E3%81%A6%E3%81%84%E3%82%8B%E3%81%A8%E3%81%9D%E3%82%82%E3%81%9D%E3%82%82%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%97%E3%83%88%E3%81%8C%E4%B8%8D%E8%A6%81%E3%81%AA%E8%A9%B1)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者

- Hugoで作成したサイトのビルドおよびデプロイをいちいちコマンドを打って行いたくない方


## 環境

- WSL2 (Ubuntu 22.04)
- Node.js (v18.1.0)

## 前提条件

- Node.jsインストール済み

## 開発したスクリプトについて

いちいちコマンドを順番に打ってビルドやデプロイを行いたくなかったため、以下のスクリプトを開発しました。  
よければ自由にお使いください + カスタマイズしてください。  
使用方法は、本スクリプトをHugoプロジェクトのルートディレクトリへ配置し、
```sh
node deploy.js
```
を実行するだけです。  
事前準備として、publicディレクトリをGitHub Pagesのリポジトリを紐づけておく必要があります。  
<br>
本スクリプトの内容です。  
行っていることはシンプルで、以下のことを行っているだけです。
1. Hugoサイトをビルド
2. 最新情報に更新されたpublicディレクトリへ移動し、git add、commit、pushを順に実行  
(コミットメッセージは年月日)
{{< gist koki-nakamura22 f1734030731d7059d09ff6652c1336c7 >}}

## ブログがGitHub Pagesでホストされていると、そもそもスクリプトが不要な話

ブログがGitHub Pagesでホストされている場合、そもそも、こういったスクリプトを作成しなくてもGitHub Actionsを使用したら同様のことを行えそうでした。  
どういった設定を行えばよいのかは以下の公式サイトにすべて記載されているので、そちらを参照ください。

<a href="https://gohugo.io/hosting-and-deployment/hosting-on-github/" target="_blank" rel="noopener noreferrer" style="all: unset; cursor: pointer;" >
<div style="width: 100%; max-width: 36rem; height: 9rem; border-width: 1px; border-style: solid; border-color: rgb(209, 213, 219); display: flex; background-color: rgb(255, 255, 255);" onMouseOut="this.style.background='rgb(255, 255, 255)'" onMouseOver="this.style.background='rgb(243, 244, 246)'">
  <div style="padding: 0.75rem; width: 75%; display: flex; flex-direction: column; justify-content: space-between;">
    <div>
      <div style="color: rgb(31, 41, 55); font-size: 1.0rem; line-height: 1.5rem; max-height: 3.0rem; overflow: hidden;">Host on GitHub</div>
      <div style="font-size: 0.8rem; line-height: 1.25rem; max-height: 2.5rem; color: rgb(107, 114, 128); overflow: hidden; text-overflow: ellipsis;">Deploy Hugo as a GitHub Pages project or personal/organizational site and automate the whole process with Github Action Workflow</div>
    </div>
    <div style="font-size: 0.75rem; line-height: 1rem; color: rgb(31, 41, 55);">gohugo.io</div>
  </div>
  <div style="border-left-width: 1px; width: 25%;">
    <img src=https://gohugo.io/opengraph/gohugoio-card-base-1_huf001e7df4fd9c00c4355abac7d4ca455_242906_filter_11532075945470954979.png alt="No Image" style="object-fit: cover; width: 100%; height: 100%; background-color: rgb(209, 213, 219);" loading="lazy" />
  </div>
</div></a>
