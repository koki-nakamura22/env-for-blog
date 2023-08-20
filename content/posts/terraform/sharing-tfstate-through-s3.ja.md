+++
author = "Koki"
categories = ["Terraform"]
tags = ["Terraform"]
date = 2023-08-20T20:50:08+09:00
linktitle = ""
title = "tfstateファイルをS3経由で共有 (チームでTerraformを運用する際に必須の設定について)"
description = "この記事では、tfstateファイルをS3経由で共有・管理する方法、また、なぜそれが必要なのかについて説明します。"
type = "post"
+++
この記事では、tfstateファイルをS3経由で共有・管理する方法、また、なぜそれが必要なのかについて説明します。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[なぜtfstateをS3経由で共有管理する必要があるのか](#%E3%81%AA%E3%81%9Ctfstate%E3%82%92s3%E7%B5%8C%E7%94%B1%E3%81%A7%E5%85%B1%E6%9C%89%E7%AE%A1%E7%90%86%E3%81%99%E3%82%8B%E5%BF%85%E8%A6%81%E3%81%8C%E3%81%82%E3%82%8B%E3%81%AE%E3%81%8B)</font>
- <font color="#1111cc">[tfstateをS3で管理](#tfstate%E3%82%92s3%E3%81%A7%E7%AE%A1%E7%90%86)</font>
  - <font color="#1111cc">[設定追加](#%E8%A8%AD%E5%AE%9A%E8%BF%BD%E5%8A%A0)</font>
  - <font color="#1111cc">[設定反映](#%E8%A8%AD%E5%AE%9A%E5%8F%8D%E6%98%A0)</font>
- <font color="#1111cc">[参考にしたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%97%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者
- チームで、tfstateファイルをローカルではなくS3経由で共有・管理したい方


## 環境
- Terraform v1.5.0


## 前提条件
- なし

## なぜtfstateをS3経由で共有管理する必要があるのか

なぜtfstateをS3経由で共有・管理する必要があるのか？について説明します。  

まず、tfstateファイルはAWSへデプロイしたインフラ構成を記録・管理するためのファイルです。  
そのため、1人でインフラ構成を管理をしているなら問題は発生しないのですが、チームでインフラ構成を管理していると誰の環境に最新のtfstateファイルが存在しているのかわからなくなってしまいます。  
そのまま運用を行うと、デグレードが発生しやすくなり、問題が発生しやすくなります。  

これをどのように解決するのかについてですが、S3でtfstateファイルを管理し、それを各メンバーの環境から参照させることで、常に最新のtfstateファイルが1つだけでかつそれを参照させる解決します。


## tfstateをS3で管理

### 設定追加

main.tfのterraformブロックへ、backendブロックを追加します。
```tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.5.0"
    }
  }

  # 以下を追加
  backend "s3" {
    key    = "terraform.tfstate" # S3に保存する際のパスおよびファイル名指定
    region = "ap-northeast-1" # S3バケットのリージョン
    bucket = "test-bucket" # 保存先のバケット名
  }
}
```

### 設定反映

もし、既にTerraformを運用している際は、tfstateファイルをS3で管理するようにした設定を反映させる必要があります。  
これは簡単で、対象のmain.tfが存在するディレクトリで以下のコマンドを実行するだけです。
```sh
terraform init
```

上記コマンドを実行すると、処理を継続してもよいかを問われるので
```sh
yes
```
を入力しEnter/Returnを押してください。


## 参考にしたページ
<a href="https://developer.hashicorp.com/terraform/language/settings/backends/configuration" target="_blank" rel="noopener noreferrer" style="all: unset; cursor: pointer;" >
<div style="width: 100%; max-width: 36rem; height: 9rem; border-width: 1px; border-style: solid; border-color: rgb(209, 213, 219); display: flex; background-color: rgb(255, 255, 255);" onMouseOut="this.style.background='rgb(255, 255, 255)'" onMouseOver="this.style.background='rgb(243, 244, 246)'">
  <div style="padding: 0.75rem; width: 75%; display: flex; flex-direction: column; justify-content: space-between;">
    <div>
      <div style="color: rgb(31, 41, 55); font-size: 1.0rem; line-height: 1.5rem; max-height: 3.0rem; overflow: hidden;">Backend Configuration - Configuration Language | Terraform | HashiCorp Developer</div>
      <div style="font-size: 0.8rem; line-height: 1.25rem; max-height: 2.5rem; color: rgb(107, 114, 128); overflow: hidden; text-overflow: ellipsis;">Use the `backend` block to control where Terraform stores state. Learn about the available state backends, the backend block, initializing backends, partial backend configuration, changing backend configuration, and unconfiguring a backend.</div>
    </div>
    <div style="font-size: 0.75rem; line-height: 1rem; color: rgb(31, 41, 55);">developer.hashicorp.com</div>
  </div>
  <div style="border-left-width: 1px; width: 25%;">
    <img src=https://developer.hashicorp.com/og-image/terraform.jpg alt="No Image" style="object-fit: cover; width: 100%; height: 100%; background-color: rgb(209, 213, 219);" loading="lazy" />
  </div>
</div></a>
