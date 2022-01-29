+++
author = "Koki"
categories = ["Node.js"]
date = 2019-10-05T21:09:21+10:00
description = "VS Code上でホットリロード機能を含めたNode.js(Express)の開発環境構築方法について説明します。"
images = [""]
linktitle = ""
title = "VS Code上でホットリロード機能を含めたNode.js(Express)の開発環境構築方法"
type = "post"

+++
この記事では、VS Code上でホットリロード機能を含めたNode.js(Express)の開発環境構築方法について説明します。

この記事の内容です。

- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[開発環境構築](#%E9%96%8B%E7%99%BA%E7%92%B0%E5%A2%83%E6%A7%8B%E7%AF%89)</font>
  - <font color="#1111cc">[プロジェクトディレクトリを作成](#%E3%83%97%E3%83%AD%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%83%87%E3%82%A3%E3%83%AC%E3%82%AF%E3%83%88%E3%83%AA%E3%82%92%E4%BD%9C%E6%88%90)</font>
  - <font color="#1111cc">[Expressインストール](#express%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)</font>
      - <font color="#1111cc">[インストール](#%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)</font>
      - <font color="#1111cc">[テスト用環境を構築](#%E3%83%86%E3%82%B9%E3%83%88%E7%94%A8%E7%92%B0%E5%A2%83%E3%82%92%E6%A7%8B%E7%AF%89)</font>
  - <font color="#1111cc">[Nodemonのグローバルインストール](#nodemon%E3%81%AE%E3%82%B0%E3%83%AD%E3%83%BC%E3%83%90%E3%83%AB%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)</font>
      - <font color="#1111cc">[インストール](#%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB-1)</font>
      - <font color="#1111cc">[設定ファイル作成](#%E8%A8%AD%E5%AE%9A%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E4%BD%9C%E6%88%90)</font>
      - <font color="#1111cc">[launch.jsonの作成および編集](#launchjson%E3%81%AE%E4%BD%9C%E6%88%90%E3%81%8A%E3%82%88%E3%81%B3%E7%B7%A8%E9%9B%86)</font>
      - <font color="#1111cc">[package.jsonを編集](#packagejson%E3%82%92%E7%B7%A8%E9%9B%86)</font>
  - <font color="#1111cc">[プログラムのデバッグ実行方法](#%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%A0%E3%81%AE%E3%83%87%E3%83%90%E3%83%83%E3%82%B0%E5%AE%9F%E8%A1%8C%E6%96%B9%E6%B3%95)</font>
- <font color="#1111cc">[参考にさせていただいたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%95%E3%81%9B%E3%81%A6%E3%81%84%E3%81%9F%E3%81%A0%E3%81%84%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>


## 対象読者
- VS Code上でNode.js(Express)の開発環境を構築したい方


## 環境
- Windows 10 (1903)
- Visual Studio Code (1.38.1)
- Node.js (v10.16.3)
- npm (6.11.2)


## 前提条件
- Node.js, npmおよびVS Codeインストール済


## 開発環境構築
### プロジェクトディレクトリを作成
下記のコマンドを実行し、プロジェクト用のディレクトリを作成します。  
使用するコマンドはWindows, MacおよびLinux環境すべてで同じです。
```winbatch
mkdir [project name]
```

### Expressインストール
#### インストール
最初に、作成したプロジェクト用ディレクトリへ移動しておきます。  
次に、下記のコマンドを実行しExpressをローカルインストールします。
```winbatch
npm install express --save-dev
```

#### テスト用環境を構築
最初に下記にコマンドを実行します。
```winbatch
npm init
```
次にapp.jsというファイルを作成し、下記のコマンドをペーストします。
```javascript:app.js
const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("Hello World!");
});

const server = app.listen(3000, () => {
  const host = server.address().address;
  const port = server.address().port;
  console.log("Example app listening at http://%s:%s", host, port);
});
```
これでExpressの環境構築は終了です。  
次は、ホットリロードの設定をしていきます。
<br>

### Nodemonのグローバルインストール
ホットリロードの環境を構築するためにNodemonを使用します。
#### インストール
下記のコマンドを実行し、Nodemonをグローバルインストールします。
```winbatch
npm install nodemon -g
```

#### 設定ファイル作成
.nodemon.jsonをプロジェクトのルートパスに作成します。  
ファイルを作成したら、下記のコードをファイル内へペーストします。
```json:.nodemon.json
{
  "watch": "./*",
  "ext": "js,json",
  "exec": "node ./app"
}
```

#### launch.jsonの作成および編集
最初に、launch.jsonを下記の作業を行い作成します。
<br>
[Debug] in a left menu -> [Gear icon] -> Select Environmentのところで"Node.js"を選択.
<br>
次に、launch.json内の"configuration"の中身を下記に置き換えます。
```json
{
    "type": "node",
    "request": "attach",
    "name": "Node: Nodemon",
    "processId": "${command:PickProcess}",
    "restart": true,
    "protocol": "inspector"
}
```
下記のコードは置き換え後の、ファイル内全体のコードです。
```json:launch.json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "type": "node",
            "request": "attach",
            "name": "Node: Nodemon",
            "processId": "${command:PickProcess}",
            "restart": true,
            "protocol": "inspector"
        }
    ]
}
```

#### package.jsonを編集
最後に、プログラムを実行するためのコマンドをpackage.jsonへ追加します。  
下記のコマンドをファイル内の"script"へ追加します。
```json
"debug": "nodemon --inspect app.js"
```
<br>
これで開発環境の構築は終了です。
<br>

### プログラムのデバッグ実行方法
プログラムをデバッグ実行する場合、下記のコマンドをプロジェクト用ディレクトリのルートで実行します。
```winbatch
npm run debug
```
その後、VS Code上でF5キーを押します。  
この時にVS Codeからアタッチするプロセスを聞かれた場合は、"node --inspect app.js"を選択してください。  
プログラムを終了したい場合はShift + F5を押すか、デバッグメニューの"Disconnect"をクリックしてください。また、コマンドプロンプトもしくはPowerShell上でCtrl + Cを押すのも忘れないようにしてください。


# 参考にさせていただいたページ
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://expressjs.com/ja/starter/installing.html" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://expressjs.com/ja/starter/installing.html" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://expressjs.com/ja/starter/installing.html" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Express のインストール</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://expressjs.com/ja/starter/installing.html" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://expressjs.com/ja/starter/installing.html" border="0" alt="" /></a></span></div></div>
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://expressjs.com/ja/starter/hello-world.html" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://expressjs.com/ja/starter/hello-world.html" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://expressjs.com/ja/starter/hello-world.html" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Express の「Hello World」の例</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://expressjs.com/ja/starter/hello-world.html" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://expressjs.com/ja/starter/hello-world.html" border="0" alt="" /></a></span></div></div>
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://github.com/remy/nodemon" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://github.com/remy/nodemon" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://github.com/remy/nodemon" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">remy/nodemon: Monitor for any changes in your node.js application and automatically restart the server - perfect for development</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://github.com/remy/nodemon" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://github.com/remy/nodemon" border="0" alt="" /></a></span></div></div>
