+++
author = "Koki"
categories = ["Windows"]
date = 2022-02-12T20:54:50+09:00
description = "Windowsでコマンドを使用し環境変数を永続的に設定する方法を説明します。これによって、PC・パソコンを再起動しても設定が消えないように、残るようになります。"
images = [""]
linktitle = ""
title = "Windowsでコマンドを使用し環境変数を永続的に設定する方法"
type = "post"

+++

この記事では、Windows でコマンドを使用し環境変数を永続的に設定する方法を説明します。  
これによって、いちいちシステムのプロパティ画面を開かなくても、コマンド一発で環境変数を設定できるようになります。  
また、環境変数の設定が必要なインストール作業をスクリプト化することもできるようになります。

この記事の内容です。

- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[設定するためのコマンド](#%E8%A8%AD%E5%AE%9A%E3%81%99%E3%82%8B%E3%81%9F%E3%82%81%E3%81%AE%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89)</font>
  - <font color="#1111cc">[ユーザ環境に設定](#%E3%83%A6%E3%83%BC%E3%82%B6%E7%92%B0%E5%A2%83%E3%81%AB%E8%A8%AD%E5%AE%9A)</font>
  - <font color="#1111cc">[システム環境に設定](#%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0%E7%92%B0%E5%A2%83%E3%81%AB%E8%A8%AD%E5%AE%9A)</font>
- <font color="#1111cc">[参考にさせていただいたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%95%E3%81%9B%E3%81%A6%E3%81%84%E3%81%9F%E3%81%A0%E3%81%84%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>

## 対象読者

- Windows の環境変数を設定するために、いちいちシステムのプロパティを開きたくない方

## 環境

- Windows

## 前提条件

無し

## 設定するためのコマンド

SETX コマンドを使用します。  
以下は、**TEST**という変数名で、**test variable value**という値を設定する例です。

### ユーザ環境に設定

```powershell
SETX TEST "test variable value"
```

### システム環境に設定

以下のコマンドは、必ず Powershell を管理者権限で起動し実行する必要があります。

```powershell
SETX /M TEST "test variable value"
```

## 参考にさせていただいたページ

<a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/setx" target="_blank">setx | Microsoft Docs</a>
