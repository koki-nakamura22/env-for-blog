+++
author = "Koki"
categories = ["Windows", "Python", "Chocolatey"]
date = 2022-02-13T20:46:22+09:00
description = "WindowsでChocolateyを使用し、pyenvをインストールする方法を説明します。"
images = [""]
linktitle = ""
title = "Windowsにpyenvをインストールする方法 (Chocolatey使用)"
type = "post"

+++

この記事では、WindowsでChocolateyを使用し、pyenvをインストールする方法を説明します。

この記事の内容です。
- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[インストール](#%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)</font>
  - <font color="#1111cc">[1. インストールコマンド実行](#1-%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E5%AE%9F%E8%A1%8C)</font>
  - <font color="#1111cc">[2. 環境変数設定](#2-%E7%92%B0%E5%A2%83%E5%A4%89%E6%95%B0%E8%A8%AD%E5%AE%9A)</font>
  - <font color="#1111cc">[3. インストールされたことを確認](#3-%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%95%E3%82%8C%E3%81%9F%E3%81%93%E3%81%A8%E3%82%92%E7%A2%BA%E8%AA%8D)</font>
- <font color="#1111cc">[余談](#%E4%BD%99%E8%AB%87)</font>

## 対象読者
- Windowsにpyenvをインストールしたい方

## 環境
- Windows 10

## 前提条件
- Chocolateyインストール済み  
インストール方法は<font color="#1111cc"><a href="/blog/ja/2019/09/04/how-to-install-chocolatey/"  target="_blank">Windows 10でパッケージマネージャ(Chocolatey)を使用する方法</a></font>を参照。

## インストール
### 1. インストールコマンド実行
以下のコマンドをPowershellコンソール上で実行します。
```powershell
choco install pyenv-win
```

### 2. 環境変数設定
以下、2つのパスを環境変数Pathへ追加します。
```
%USERPROFILE%\.pyenv\pyenv-win\bin
%USERPROFILE%\.pyenv\pyenv-win\shims
```

### 3. インストールされたことを確認
最後に、Powershell コンソールで
```powershell
pyenv --version
```
を実行し、以下のようにバージョン情報が表示されたらインストール完了です。
```powershell
pyenv 1.2.22-47-g4c302a02
```

## 余談
環境変数Pathの設定は
```powershell
SETX PATH "%PATH%;%USERPROFILE%\.pyenv\pyenv-win\bin;%USERPROFILE%\.pyenv\pyenv-win\shims"
```
をPowershellコンソール上で実行しても行うことができます。が、これを行う時に環境変数の値の合計文字数が1024文字を超えていると、<b>警告: 保存されたデータは 1024 文字に切り捨てられました。</b>と表示され、環境変数Pathの値の一部が吹っ飛ぶので気を付けましょう。
筆者は一度Pathの一部を吹っ飛ばしましたが、幸い、直前にPathの値すべてをテキストエディタに貼り付けていたため、事なきを得ました。
