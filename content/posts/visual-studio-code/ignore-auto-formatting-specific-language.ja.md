+++
author = "Koki"
categories = ["Visual Studio Code"]
date = 2022-02-25T16:29:54+09:00
description = "この記事では、Visual Studio Code (VS Code)で特定言語のみ自動フォーマット機能を無効 (オフ)にする方法を説明します。"
images = [""]
linktitle = ""
title = "VS Codeで特定言語のみ自動フォーマット機能を無効にする (Prettier使用)"
type = "post"

+++
この記事では、Visual Studio Code (VS Code)で特定言語のみ自動フォーマット機能を無効 (オフ)にする方法を説明します。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[setting.jsonを編集](#settingjson%E3%82%92%E7%B7%A8%E9%9B%86)</font>
  - <font color="#1111cc">[1. setting.jsonを開く](#1-settingjson%E3%82%92%E9%96%8B%E3%81%8F)</font>
  - <font color="#1111cc">[2. 特定言語の自動フォーマット機能をオフに設定する](#2-%E7%89%B9%E5%AE%9A%E8%A8%80%E8%AA%9E%E3%81%AE%E8%87%AA%E5%8B%95%E3%83%95%E3%82%A9%E3%83%BC%E3%83%9E%E3%83%83%E3%83%88%E6%A9%9F%E8%83%BD%E3%82%92%E3%82%AA%E3%83%95%E3%81%AB%E8%A8%AD%E5%AE%9A%E3%81%99%E3%82%8B)</font>
- <font color="#1111cc">[参考にしたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%97%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者
- 使用する言語によって、自動フォーマットを使う・使わないを切り替えたい方


## 環境
- Visual Studio Code


## 前提条件
- Prettierインストール済み (Prettierは拡張機能)


## setting.jsonを編集
### 1. setting.jsonを開く
お使いのOSがWindowsの場合はCtrl + Shift + Pを、Macの場合はCommand + Shift + Pを同時押しし、その後、Preferences: Open Settings(JSON)(日本語化済みなら基本設定:　設定(JSON)を開く)を選択します。

### 2. 特定言語の自動フォーマット機能をオフに設定する
```json
  "[言語名]": {
    ...
  },
```
となっているセクションに、
```json
"editor.formatOnSave": false
```
を追加します。  
以下の例は、markdownファイル編集時のみ自動フォーマットをオフにする設定です。
```json
  "[markdown]": {
    "editor.formatOnSave": false
  },
```
もし特定言語のセクションが存在しない場合は、自分で追加することも可能です。  
キーに設定可能な言語名は、以下のVS Code公式ページから確認することが可能です。  
<a href="https://code.visualstudio.com/docs/languages/identifiers#_known-language-identifiers"  target="_blank">Language Identifiers#Known language identifiers</a>

以上で設定は終了です。

## 参考にしたページ
<a href="https://github.com/prettier/prettier-vscode" target="_blank">prettier / prettier-vscode</a>
