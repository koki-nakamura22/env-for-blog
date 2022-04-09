+++
author = "Koki"
categories = ["Python", "Google Colab"]
tags = ["Python", "Google Colab"]
date = 2022-04-09T14:52:06+09:00
linktitle = ""
title = "Google Colabで書いたコードをGitHubで管理する方法"
description = ""
type = "post"
+++
この記事では、Google Colabで書いたコードをGitHubで管理する方法を説明します。  
ローカルに環境構築をせずに開発をしつつ、そのコードを管理したい人向けの内容となっています。  
パブリックリポジトリ、プライベートリポジトリ両方を対象としています。  

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[共通の下準備](#%E5%85%B1%E9%80%9A%E3%81%AE%E4%B8%8B%E6%BA%96%E5%82%99)</font>
- <font color="#1111cc">[パブリックリポジトリを使用](#%E3%83%91%E3%83%96%E3%83%AA%E3%83%83%E3%82%AF%E3%83%AA%E3%83%9D%E3%82%B8%E3%83%88%E3%83%AA%E3%82%92%E4%BD%BF%E7%94%A8)</font>
  - <font color="#1111cc">[1. Gitアカウント設定](#1-git%E3%82%A2%E3%82%AB%E3%82%A6%E3%83%B3%E3%83%88%E8%A8%AD%E5%AE%9A)</font>
  - <font color="#1111cc">[2. Gitパブリックリポジトリをclone](#2-git%E3%83%91%E3%83%96%E3%83%AA%E3%83%83%E3%82%AF%E3%83%AA%E3%83%9D%E3%82%B8%E3%83%88%E3%83%AA%E3%82%92clone)</font>
  - <font color="#1111cc">[3. コードのcommitおよびpush](#3-%E3%82%B3%E3%83%BC%E3%83%89%E3%81%AEcommit%E3%81%8A%E3%82%88%E3%81%B3push)</font>
- <font color="#1111cc">[プライベートリポジトリを使用](#%E3%83%97%E3%83%A9%E3%82%A4%E3%83%99%E3%83%BC%E3%83%88%E3%83%AA%E3%83%9D%E3%82%B8%E3%83%88%E3%83%AA%E3%82%92%E4%BD%BF%E7%94%A8)</font>
  - <font color="#1111cc">[1. GitHub側でPersonal access tokens作成](#1-github%E5%81%B4%E3%81%A7personal-access-tokens%E4%BD%9C%E6%88%90)</font>
  - <font color="#1111cc">[2. Gitアカウント設定](#2-git%E3%82%A2%E3%82%AB%E3%82%A6%E3%83%B3%E3%83%88%E8%A8%AD%E5%AE%9A)</font>
  - <font color="#1111cc">[3. Gitプライベートリポジトリをclone](#3-git%E3%83%97%E3%83%A9%E3%82%A4%E3%83%99%E3%83%BC%E3%83%88%E3%83%AA%E3%83%9D%E3%82%B8%E3%83%88%E3%83%AA%E3%82%92clone)</font>
  - <font color="#1111cc">[4. コードのcommitおよびpush](#4-%E3%82%B3%E3%83%BC%E3%83%89%E3%81%AEcommit%E3%81%8A%E3%82%88%E3%81%B3push)</font>
- <font color="#1111cc">[実際やってみての感想](#%E5%AE%9F%E9%9A%9B%E3%82%84%E3%81%A3%E3%81%A6%E3%81%BF%E3%81%A6%E3%81%AE%E6%84%9F%E6%83%B3)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者
- Google Colabで書いたコードをGitHubで管理したい方


## 環境
- Google Colab


## 前提条件
- GitHubアカウント作成済み


## 共通の下準備
1. Google Colabのプロジェクトを作成する  
2. Google Driveをマウントする  
2は、cloneしたモノを保存するために必須です。  
方法は、このページがわかりやすかったのでこちらを参照してください。  
<font color="#1111cc"><a href="https://www.teamxeppet.com/colab-googledrive-mount/" target="_blank">【Google Colaboratory】2通りのGoogleドライブのマウント方法</a></font>  


## パブリックリポジトリを使用
パブリックリポジトリを使用する際は簡単で、それぞれ以下の流れで設定したりcloneするだけです。

### 1. Gitアカウント設定
pushを行えるようにするため、以下のコードブロックを作成し実行します。  
メールアドレスとユーザ名は、お使いのものに置き換えてください。
```sh
!git config --global user.email "メールアドレス"
!git config --global user.name "ユーザ名"
```

### 2. Gitパブリックリポジトリをclone
以下のコードブロックを作成し、実行します。  
[リポジトリURL]は、対象のものに置き換えてください。
```sh
%cd /content/drive/MyDrive/Colab Notebooks
!git clone [リポジトリURL]
```

### 3. コードのcommitおよびpush
Google Colab外で行う方法とほぼ同じです。  
以下のコードブロックを作成し、実行します。(addやcommit、pushの対象はお好みで。)
```sh
!git add .
!git commit -m "コミットメッセージ"
!git push origin main
```


## プライベートリポジトリを使用
プライベートリポジトリを使用する際は、Personal access tokenを利用して認証を行う必要があるため、手順が変わってきます。

### 1. GitHub側でPersonal access tokens作成
以下の手順で、Personal access tokensを作成します。  
これは、
1. GitHubにサインイン
2. ページ右上のアイコンから、Settingsをクリック
3. 左側メニュー一番下のDeveloper settingsをクリック
4. 左側メニュー一番下のPersonal access tokensをクリック
5. Generate new tokenをクリックし、Personal access tokensを作成
6. 作成されたtokenをコピー (後ほど使用するため。)


### 2. Gitアカウント設定
pushを行えるようにするため、以下のコードブロックを作成し実行します。  
メールアドレスとユーザ名は、お使いのものに置き換えてください。
```sh
!git config --global user.email "メールアドレス"
!git config --global user.name "ユーザ名"
```

### 3. Gitプライベートリポジトリをclone
以下のコードブロックを作成し、実行します。  
[Personal access tokens]は、先ほどコピーしたものを、  
[GitHubアカウント名]と[リポジトリ名]は、使用しているものや対象のものに置き換えてください。
```sh
!git clone リポジトリURL
%env TOKEN=[Personal access tokens]
%cd /content/drive/MyDrive/Colab Notebooks
!git clone https://$$TOKEN@github.com/[GitHubアカウント名]/[リポジトリ名].git
```

### 4. コードのcommitおよびpush
Google Colab外で行う方法とほぼ同じです。  
以下のコードブロックを作成し、実行します。(addやcommit、pushの対象はお好みで。)
```sh
!git add .
!git commit -m "コミットメッセージ"
!git push origin main
```

