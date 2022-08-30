+++
author = "Koki"
categories = ["Python"]
tags = ["Python", "CHALICE"]
date = 2022-08-30T17:17:27+09:00
linktitle = ""
title = "CHALICEの自動ポリシー生成 (Automatic policy generation) 対象範囲の検証"
description = "この記事では、CHALICEのAutomatic policy generation対象範囲が不明だったため、思いつく限り試し検証した結果を記載しています。"
type = "post"
+++
この記事では、CHALICEのAutomatic policy generation対象範囲が不明だったため、思いつく限り試し検証した結果を記載しています。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[TL;DR](#tldr)</font>
- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[CHALICEの自動ポリシー生成 (Automatic policy generation) の対象範囲検証および結果](#chalice%E3%81%AE%E8%87%AA%E5%8B%95%E3%83%9D%E3%83%AA%E3%82%B7%E3%83%BC%E7%94%9F%E6%88%90-automatic-policy-generation-%E3%81%AE%E5%AF%BE%E8%B1%A1%E7%AF%84%E5%9B%B2%E6%A4%9C%E8%A8%BC%E3%81%8A%E3%82%88%E3%81%B3%E7%B5%90%E6%9E%9C)</font>
  - <font color="#1111cc">[app.py](#apppy)</font>
  - <font color="#1111cc">[project root/chalicelib内のファイル](#project-rootchalicelib%E5%86%85%E3%81%AE%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB)</font>
  - <font color="#1111cc">[project root/directory内のファイル](#project-rootdirectory%E5%86%85%E3%81%AE%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB)</font>
  - <font color="#1111cc">[project root内のファイル (app.pyと同階層)](#project-root%E5%86%85%E3%81%AE%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB-apppy%E3%81%A8%E5%90%8C%E9%9A%8E%E5%B1%A4)</font>
- <font color="#1111cc">[結論](#%E7%B5%90%E8%AB%96)</font>
- <font color="#1111cc">[参考にしたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%97%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## TL;DR

app.py内にS3やDynamoDBといったLambda外を参照するコードを書きましょう。


## 対象読者
- CHALICEを使用していて自動ポリシー生成が行われない問題を解決したい方


## 環境
- Python v3.9.12
- CHALICE v1.27.1


## CHALICEの自動ポリシー生成 (Automatic policy generation) の対象範囲検証および結果

以下の見出しは、boto3を使用しAutomatic policy generationのために処理を実装したファイルです。  
app.py以外はすべて、app.pyに処理を実装したファイルおよび関数をimportしています。  
プロジェクトはhelloworldという名前で作成しています。


### app.py

以下のコードを実装。

```python:app.py
from chalice.app import Chalice

app = Chalice(app_name='helloworld')

import boto3

@app.route('/')
def index():
    s3 = boto3.client('s3')
    s3.download_file()
```

結果: PolicyのStatement内に以下が追加される。(Sidは省略)

```json
{
    "Effect": "Allow",
    "Action": [
        "s3:GetObject"
    ],
    "Resource": [
        "*"
    ],
},
```

### project root/chalicelib内のファイル

プロジェクトルートにchalicelibディレクトリを作成し、その中に以下のファイルを作成する。
```python:chalicelib/hoge.py
import boto3

def f():
    s3 = boto3.client('s3')
    s3.download_file()
```

次に、上記ファイルをapp.pyにimportし関数を参照させる。

```python:app.py
from chalice.app import Chalice

app = Chalice(app_name='helloworld')

from chalicelib.hoge import f

@app.route('/')
def index():
    f()
```

結果: PolicyのStatement内にS3の内容が追加されない。

### project root/directory内のファイル

プロジェクトルートにfugaディレクトリを作成し、その中に以下のファイルを作成する。
```python:fuga/piyo.py
import boto3

def f2():
    s3 = boto3.client('s3')
    s3.download_file()
```

次に、上記ファイルをapp.pyにimportし関数を参照させる。

```python:app.py
from chalice.app import Chalice

app = Chalice(app_name='helloworld')

from fuga import f2

@app.route('/')
def index():
    f2()
```

結果: PolicyのStatement内にS3の内容が追加されない。

### project root内のファイル (app.pyと同階層)

プロジェクトルートに以下のファイルを作成する。
```python:foo.py
import boto3

def f3():
    s3 = boto3.client('s3')
    s3.download_file()
```

次に、上記ファイルをapp.pyにimportし関数を参照させる。

```python:app.py
from chalice.app import Chalice

app = Chalice(app_name='helloworld')

from foo import f3

@app.route('/')
def index():
    f3()
```

結果: PolicyのStatement内にS3の内容が追加されない。

## 結論

動作を確認する限りapp.pyのみAutomatic policy generationの対象範囲となっている。  
そのため、app.py外にS3やDynamoDBなどを参照するコードを実装したい場合は、以下のような対応をとる必要がある。

```python
from chalice.app import Chalice

app = Chalice(app_name='helloworld')

import boto3

@app.lambda_function()
def for_automatic_policy_generation():
    s3 = boto3.client('s3')
    s3.download_file()

@app.route('/')
def index():
    # 何かしらの処理
```

ポリシー自動生成用にLambda関数を1つ実装することになりモヤモヤしますが、本記事執筆時点ではこうするしかないのかなと思います。  
後述する参考にしたページでは
```python
@app.route('/')
def index():
```
内にfor_automatic_policy_generationとほぼ同じ関数を呼び出すようにしていますが、全関数にそれを記述するのは美しくないですし、またダミーのWeb APIを生やすなら、どこからも参照されないLambda関数を1個作成する方が良いと考え上記の形にしています。

## 参考にしたページ

<a href="https://github.com/aws/chalice/issues/692" target="_blank" rel="noopener noreferrer" style="all: unset; cursor: pointer;" >
<div style="width: 100%; max-width: 36rem; height: 9rem; border-width: 1px; border-style: solid; border-color: rgb(209, 213, 219); display: flex; background-color: rgb(255, 255, 255);" onMouseOut="this.style.background='rgb(255, 255, 255)'" onMouseOver="this.style.background='rgb(243, 244, 246)'">
  <div style="padding: 0.75rem; width: 75%; display: flex; flex-direction: column; justify-content: space-between;">
    <div>
      <div style="color: rgb(31, 41, 55); font-size: 1.0rem; line-height: 1.5rem; max-height: 3.0rem; overflow: hidden;">Bug: `chalice deploy` fails to discover required permissions for Lambda IAM role · Issue #692 · aws/chalice</div>
      <div style="font-size: 0.8rem; line-height: 1.25rem; max-height: 2.5rem; color: rgb(107, 114, 128); overflow: hidden; text-overflow: ellipsis;">Ordinarily, chalice deploy finds IAM permissions required for the application to work, builds an IAM role and prompts the user for authorization to add necessary permissions to the role: $ chalice ...</div>
    </div>
    <div style="font-size: 0.75rem; line-height: 1rem; color: rgb(31, 41, 55);">github.com</div>
  </div>
  <div style="border-left-width: 1px; width: 25%;">
    <img src=https://opengraph.githubassets.com/28ac413c9f6c7575a5f971ede9d9ce2641891d6a76dd381e6927157fc9e612a3/aws/chalice/issues/692 alt="No Image" style="object-fit: cover; width: 100%; height: 100%; background-color: rgb(209, 213, 219);" loading="lazy" />
  </div>
</div></a>
