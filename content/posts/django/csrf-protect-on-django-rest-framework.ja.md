+++
author = "Koki"
categories = ["Django"]
tags = ["Django"]
date = 2023-09-03T17:54:15+09:00
linktitle = ""
title = "Django REST frameworkでのCSRFトークン認証方法"
description = "Django REST frameworkを使用してWeb APIでCSRFトークン認証を行う方法を解説します。"
type = "post"
+++
この記事では、Django REST frameworkを使用してWeb APIでCSRFトークン認証を行う方法を解説します。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[CSRFトークン認証の導入方法](#csrf%E3%83%88%E3%83%BC%E3%82%AF%E3%83%B3%E8%AA%8D%E8%A8%BC%E3%81%AE%E5%B0%8E%E5%85%A5%E6%96%B9%E6%B3%95)</font>
  - <font color="#1111cc">[なぜCSRFトークン認証を導入するのか](#%E3%81%AA%E3%81%9Ccsrf%E3%83%88%E3%83%BC%E3%82%AF%E3%83%B3%E8%AA%8D%E8%A8%BC%E3%82%92%E5%B0%8E%E5%85%A5%E3%81%99%E3%82%8B%E3%81%AE%E3%81%8B)</font>
  - <font color="#1111cc">[CSRFトークンを返すAPIの実装](#csrf%E3%83%88%E3%83%BC%E3%82%AF%E3%83%B3%E3%82%92%E8%BF%94%E3%81%99api%E3%81%AE%E5%AE%9F%E8%A3%85)</font>
  - <font color="#1111cc">[認証クラスの作成](#%E8%AA%8D%E8%A8%BC%E3%82%AF%E3%83%A9%E3%82%B9%E3%81%AE%E4%BD%9C%E6%88%90)</font>
  - <font color="#1111cc">[APIViewへの設定](#apiview%E3%81%B8%E3%81%AE%E8%A8%AD%E5%AE%9A)</font>
- <font color="#1111cc">[テスト時の注意点](#%E3%83%86%E3%82%B9%E3%83%88%E6%99%82%E3%81%AE%E6%B3%A8%E6%84%8F%E7%82%B9)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者
- Django REST frameworkでREST APIを開発している方
- データ改ざんを防ぐための仕組みに興味がある方
- CSRFトークン認証の基本的な知識がある方


## 環境

以下は筆者の動作確認環境
- Python 3.11
- Django 4.2.2
- Django REST framework 3.14.0


## 前提条件
- DjangoとDjango REST frameworkがインストール済みであること
- Djangoプロジェクトが既にセットアップされていること
- REST APIの基本的な概念に馴染みがあること


## CSRFトークン認証の導入方法

### なぜCSRFトークン認証を導入するのか
REST APIの開発でも、フォーム送信データの改ざんを防ぐための仕組みを入れたい場合があります。  
それを実現するために、CSRFトークン認証を導入し、POSTやPUT、PATCH、DELETEといったデータを変更するリクエストをサーバへ送る際にヘッダにCSRFトークンを含めることで検証を行い、フォーム送信データの改ざんを検知・ブロックすることが可能となります。  
しかし、これはREST APIの作法に反しており、導入する際には注意が必要です。  
(REST APIは状態を持つことを禁止している。)

### CSRFトークンを返すAPIの実装

まず、CSRFトークンを発行し返すAPIを実装します。  
以下のコードをWeb APIを実装するファイルに実装し、urls.pyへ登録し外部から実行できるようにします。  
今回は、`models.py`や`views.py`が存在するアプリディレクトリ配下に`apis.py`というファイルを作成し、実装します。

```python
from typing import Self
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.views import APIView

class CSRFTokens(APIView):
    def get(self: Self, request: Request) -> Response:
        return Response({"token": get_token(request)})
```

### 認証クラスの作成

次に、CSRFトークン認証を行うためのコードを、`models.py`や`views.py`が存在するアプリディレクトリ配下に`authentications.py`というファイルを作成し、実装します。

```python
from rest_framework.authentication import SessionAuthentication

class CSRFOnlySessionAuthentication(SessionAuthentication):
    def authenticate(self, request):
        self.enforce_csrf(request)
        return None
```

### APIViewへの設定

次に、APIViewに上記で作成した認証クラスを設定します。以下はそのサンプルコードです。  

```python
from rest_framework.views import APIView
from .authentications import CSRFOnlySessionAuthentication

class SampleResources(APIView):
    authentication_classes = [CSRFOnlySessionAuthentication]

    # その他getやpostなどの処理
```

## テスト時の注意点

テストコードでこの認証方法をテストする際は、APIClientを初期化する際にenforce_csrf_checks=Trueを渡さないと、CSRFトークン認証が無視されます。  
CSRFトークンの有無や、検証のテストを行う場合は、必ず以下のようにAPIClient初期化時にパラメータで`enforce_csrf_checks=True`を渡してください。

```python
from rest_framework.test import APIClient

client = APIClient(enforce_csrf_checks=True)
```
