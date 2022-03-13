+++
author = "Koki"
categories = ["JavaScript"]
date = 2022-03-12T22:24:54+09:00
description = "この記事では、JavaScriptのテストフレームワークであるJestのインストール方法、インテリセンスなどの設定方法について説明します。"
images = [""]
linktitle = ""
title = "Jestのインストール方法およびインテリセンスなどの設定方法について"
type = "post"

+++
この記事では、JavaScriptのテストフレームワークであるJestのインストール方法、インテリセンスなどの設定方法について説明します。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[Jestのインストール](#jest%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)</font>
- <font color="#1111cc">[便利に使うための設定](#%E4%BE%BF%E5%88%A9%E3%81%AB%E4%BD%BF%E3%81%86%E3%81%9F%E3%82%81%E3%81%AE%E8%A8%AD%E5%AE%9A)</font>
  - <font color="#1111cc">[インテリセンス](#%E3%82%A4%E3%83%B3%E3%83%86%E3%83%AA%E3%82%BB%E3%83%B3%E3%82%B9)</font>
  - <font color="#1111cc">[import時のエラー解消](#import%E6%99%82%E3%81%AE%E3%82%A8%E3%83%A9%E3%83%BC%E8%A7%A3%E6%B6%88)</font>
- <font color="#1111cc">[余談](#%E4%BD%99%E8%AB%87)</font>
  - <font color="#1111cc">[何故Jestを選んだのか？](#%E4%BD%95%E6%95%85jest%E3%82%92%E9%81%B8%E3%82%93%E3%81%A0%E3%81%AE%E3%81%8B)</font>
  - <font color="#1111cc">[なぜnpmとyarnを使い分けているのか？](#%E3%81%AA%E3%81%9Cnpm%E3%81%A8yarn%E3%82%92%E4%BD%BF%E3%81%84%E5%88%86%E3%81%91%E3%81%A6%E3%81%84%E3%82%8B%E3%81%AE%E3%81%8B)</font>
- <font color="#1111cc">[参考にしたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%97%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者
- Jestの利用環境を構築したい方


## 環境
- Windows 10 (Ver. 21H2, Build. 19044.1526)
- WSL 2 (Ubuntu 20.04 LTS)
- Visual Studio Code


## 前提条件
- npmおよびyarnインストール済


## Jestのインストール
```sh
npm install --save-dev jest
```

## 便利に使うための設定
### インテリセンス
まずは、以下のコマンドでJestの型定義をインストールします。
```sh
npm install --save-dev jest@types/jest
```

次に、プロジェクトのルートディレクトリに以下のファイルを **jsconfig.json** という名前で作成します。
```javascript
{
  "typeAcquisition": {
    "include": [
      "jest"
    ]
  }
}
```


### import時のエラー解消
このままではJestのテストファイル内でテスト対象をimportをした時に参照できずエラーが発生するので、対応するためにbabel環境を構築する必要があります。  
最初に、以下のコマンドでbabelをインストールします。
```sh
yarn add --dev babel-jest @babel/core @babel/preset-env
```

次に、プロジェクトのルートディレクトリに以下のファイルを  **babel.config.cjs** という名前で作成します。
```javascript
module.exports = {
  presets: [
    [
      "@babel/preset-env",
      {
        targets: {
          node: "current",
        },
      },
    ],
  ],
};
```

## 余談
### 何故Jestを選んだのか？
ざっくり、以下の3つの理由からです。
1. npmでのダウンロード数が圧倒的に多い(利用者数が多い) ため、何かあっても情報を得やすい。
2. 環境構築が簡単。
3. 様々なライブラリやフレームワークに対応している。


### なぜnpmとyarnを使い分けているのか？
正直なところ、昨今のnpmの改良具合を見ているとパフォーマンスなどの差はどんどん縮まってきているのでNode.js公式パッケージマネージャーであるnpmのみを使っておいた方が安心安全だと思います。  
が、今回の場合はbabel周りがyarnでしかインストールできなかったため、渋々使っています。  
本当はnpmだけで統一したかった...


## 参考にしたページ
<font color="#1111cc"><a href="https://jestjs.io/ja/docs/configuration" target="_blank">Jestの設定</a></font>  
<font color="#1111cc"><a href="https://www.npmtrends.com/jest-vs-jasmine-vs-mocha-vs-chai-vs-cypress" target="_blank">npm trends (chai vs cypress vs jasmine vs jest vs mocha)</a></font>
