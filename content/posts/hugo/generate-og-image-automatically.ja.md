+++
author = "Koki"
categories = ["Hugo"]
tags = ["Hugo"]
date = 2022-04-14T13:40:41+09:00
linktitle = ""
title = "HugoブログのOGP画像をコマンド一発で自動生成し、それを自動設定する"
description = "作成するのに手間が掛かるOGP画像を、コマンド一発で自動生成し、それを自動設定する方法について説明します。"
type = "post"
+++
この記事では、HugoブログのOGP画像をコマンド一発で自動生成し、それを自動設定する方法を説明します。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[OGP画像自動生成のための環境構築](#ogp%E7%94%BB%E5%83%8F%E8%87%AA%E5%8B%95%E7%94%9F%E6%88%90%E3%81%AE%E3%81%9F%E3%82%81%E3%81%AE%E7%92%B0%E5%A2%83%E6%A7%8B%E7%AF%89)</font>
  - <font color="#1111cc">[1. 使用するテンプレート画像のダウンロード](#1-%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%E3%83%86%E3%83%B3%E3%83%97%E3%83%AC%E3%83%BC%E3%83%88%E7%94%BB%E5%83%8F%E3%81%AE%E3%83%80%E3%82%A6%E3%83%B3%E3%83%AD%E3%83%BC%E3%83%89)</font>
  - <font color="#1111cc">[2. 使用するフォントのダウンロード](#2-%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%E3%83%95%E3%82%A9%E3%83%B3%E3%83%88%E3%81%AE%E3%83%80%E3%82%A6%E3%83%B3%E3%83%AD%E3%83%BC%E3%83%89)</font>
  - <font color="#1111cc">[3. Go言語のインストールおよび初期化](#3-go%E8%A8%80%E8%AA%9E%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%8A%E3%82%88%E3%81%B3%E5%88%9D%E6%9C%9F%E5%8C%96)</font>
  - <font color="#1111cc">[4. tcardgenのインストールおよび設定](#4-tcardgen%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%8A%E3%82%88%E3%81%B3%E8%A8%AD%E5%AE%9A)</font>
  - <font color="#1111cc">[5. ブログ記事のテンプレートを編集](#5-%E3%83%96%E3%83%AD%E3%82%B0%E8%A8%98%E4%BA%8B%E3%81%AE%E3%83%86%E3%83%B3%E3%83%97%E3%83%AC%E3%83%BC%E3%83%88%E3%82%92%E7%B7%A8%E9%9B%86)</font>
  - <font color="#1111cc">[6. 複数のOGP画像を一気に作成するためにスクリプト化](#6-%E8%A4%87%E6%95%B0%E3%81%AEogp%E7%94%BB%E5%83%8F%E3%82%92%E4%B8%80%E6%B0%97%E3%81%AB%E4%BD%9C%E6%88%90%E3%81%99%E3%82%8B%E3%81%9F%E3%82%81%E3%81%AB%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%97%E3%83%88%E5%8C%96)</font>
- <font color="#1111cc">[OGP画像を自動で参照するための設定](#ogp%E7%94%BB%E5%83%8F%E3%82%92%E8%87%AA%E5%8B%95%E3%81%A7%E5%8F%82%E7%85%A7%E3%81%99%E3%82%8B%E3%81%9F%E3%82%81%E3%81%AE%E8%A8%AD%E5%AE%9A)</font>
- <font color="#1111cc">[本記事の対応を行った際のコミットログ](#%E6%9C%AC%E8%A8%98%E4%BA%8B%E3%81%AE%E5%AF%BE%E5%BF%9C%E3%82%92%E8%A1%8C%E3%81%A3%E3%81%9F%E9%9A%9B%E3%81%AE%E3%82%B3%E3%83%9F%E3%83%83%E3%83%88%E3%83%AD%E3%82%B0)</font>
- <font color="#1111cc">[ハマった点](#%E3%83%8F%E3%83%9E%E3%81%A3%E3%81%9F%E7%82%B9)</font>
- <font color="#1111cc">[参考にしたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%97%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者
- HugoブログのOGP画像の生成および設定を自動化したい方


## 環境
- WSL 2 (Ubuntu 20.04 LTS)
- Homebrew
- Node (v16.13.0)
- Hugo (v0.94.2+extended linux/amd64 BuildDate=unknown)


## 前提条件
- 使用しているテーマはHugo Future Imperfect Slim
- 指定したOGP画像が存在しない場合は、プロフィール画像をOGP画像として使用


## OGP画像自動生成のための環境構築
本セクション内で実行しているコマンドは、すべてプロジェクトのルートディレクトリで行うこと前提です。

### 1. 使用するテンプレート画像のダウンロード
OGP画像を生成するのに使用するテンプレート画像をダウンロードし配置します。  
今回は <font color="#1111cc"><a href="https://www.illust-box.jp" target="_blank">全てのイラスト素材が無料で利用できるサイト イラストボックス</a></font> さんのものを利用しています。  
ダウンロードが終わったら、画像サイズを 1200px * 630px に変更し、**static/img/og/** へ **/ogp-template.png** という名前で保存します。  
今回、画像サイズの変更には <font color="#1111cc"><a href="https://resizeimage.net" target="_blank">Online Image Resizer</a></font> を使用しました。


### 2. 使用するフォントのダウンロード
次に、使用するフォントをダウンロードし配置します。  
今回は参考にしたページを真似し、 **HackGen (白源)** を使用します。  
ダウンロードは以下から。
<div class="blogcardfu" style="width:auto;max-width:9999px;border:1px solid #E0E0E0;border-radius:3px;margin:10px 0;padding:15px;line-height:1.4;text-align:left;background:#FFFFFF;"><a href="https://github.com/yuru7/HackGen" target="_blank" style="display:block;text-decoration:none;"><span class="blogcardfu-image" style="float:right;width:100px;padding:0 0 0 10px;margin:0 0 5px 5px;"><img src="https://images.weserv.nl/?w=100&url=ssl:opengraph.githubassets.com/920970973d06e68625017d289164916136a8f6380934bb813e405224a23ded47/yuru7/HackGen" width="100" style="width:100%;height:auto;max-height:100px;min-width:0;border:0 none;margin:0;"></span><br style="display:none"><span class="blogcardfu-title" style="font-size:112.5%;font-weight:700;color:#333333;margin:0 0 5px 0;">GitHub - yuru7/HackGen: Hack と源柔ゴシックを合成したプログラミングフォント 白源 (はくげん／HackGen)</span><br><span class="blogcardfu-content" style="font-size:87.5%;font-weight:400;color:#666666;">Hack と源柔ゴシックを合成したプログラミングフォント 白源 (はくげん／HackGen). Contribute to yuru7/HackGen development by creating an account on GitHub.</span><br><span style="clear:both;display:block;overflow:hidden;height:0;">&nbsp;</span></a></div>

ダウンロードが終わったら、 **HackGen-Regular.ttf** と **HackGen-Bold.ttf** を **static/fonts/hackgen/HackGen** へ配置します。


### 3. Go言語のインストールおよび初期化
OGP画像の自動生成に使用するライブラリ、tcardgenを使用するのにGo言語をインストールする必要があるのでインストールします。  
コマンドは以下の通りです。
```sh
brew install go
```

インストールが終わったら、以下のコマンドを実行し初期化しておきます。  
go mod initの引数には、適当なモジュール名を指定します。  
今回は、他のプログラムから特にモジュールを呼び出さないので、私のブログ環境のリポジトリ名をそのまま指定しています。
```sh
go mod init env-for-blog
```

### 4. tcardgenのインストールおよび設定
以下のコマンドを実行し、tcardgenをインストールします。
```sh
go get github.com/Ladicle/tcardgen
```

インストールが完了したら、プロジェクトのルートディレクトリに以下の設定ファイル、tcargen.ymlを作成します。  
以下はあくまでも一例なため、自身の好みに合わせていろいろといじってみてください。
```yaml:tcargen.yml
template: static/img/og/ogp-template.png
title:
  fontSize: 65
  fontStyle: Bold
info:
  start:
    pX: 126
    pY: 495
  fontSize: 30
  fontStyle: Regular
  separator: " - "
tags:
  start:
    pX: 1100
    pY: 495
  fontStyle: Regular
  fontSize: 0
```


### 5. ブログ記事のテンプレートを編集
tcardgenを使用しOGP画像を生成するためには、記事へのタグ設定が必須となっています。  
私の環境だとブログ記事のテンプレートにtagsが無かったため、ここで追加しておきます。
```yaml:archetypes/default.md
+++
author = "Koki"
categories = [""]
tags = [""] # ←これを追加
date = {{ .Date }}
linktitle = ""
title = ""
description = ""
type = "post"
draft = true
+++
# 以下省略
```

また、tagsの設定内容が空だとOGP画像生成時にエラーが発生し生成できないため、必ず設定するようにしましょう。


### 6. 複数のOGP画像を一気に作成するためにスクリプト化
ここまできたら、tcardgenコマンドを実行しOGP画像を自動生成できるようになります。  
コマンド例は
```sh
tcardgen \
--fontDir [フォントファイルが存在するディレクトリパス] \
--outDir [生成したOGP画像ファイルの出力先] \
--template [OGP画像生成に使用するテンプレート画像のパス] \
--config tcargen.yml \
[生成対象記事ファイルのパス]
```
で、本記事のOGP画像を生成する時のコマンドは以下になります。
```sh
tcardgen \
--fontDir static/fonts/hackgen/HackGen \
--outDir static/img/og \
--template static/img/og/ogp-template.png \
--config tcargen.yml \
content/post/hugo/generate-og-image-automatically.ja.md
```

ただ、これだと複数記事に対応できないため、スクリプト化しておきます。  
私が実際に使用しているスクリプトは以下の通りです。
```javascript:gen-ogp-image.js
const fs = require("fs");
const path = require("path");
const { execSync } = require("child_process");

const fontDir = "static/fonts/hackgen/HackGen";
const outputDir = "static/img/og";
const configFilePath = "tcargen.yml";

for (let i = 2; i < process.argv.length; i++) {
  const filePath = path.join(__dirname, process.argv[i]);
  if (fs.existsSync(filePath)) {
    const commandStr = `~/go/bin/tcardgen --fontDir ${fontDir} --output ${outputDir} --config ${configFilePath} ${filePath}`;
    execSync(commandStr);
    console.info(`${process.argv[i]} completed`);
  } else {
    console.error(`\x1b[31m${filePath} was not found.`);
  }
}
```

引数として渡された記事ファイルの分、tcardgenコマンドを実行します。  
本スクリプトは以下のように使用することができます。
```sh
node gen-ogp-image.js content/post/hugo/generate-og-image-automatically.ja.md content/post/hugo/generate-og-image-automatically.md
```


## OGP画像を自動で参照するための設定
最後に、自動生成したOGP画像を自動で参照するための設定を行います。  
使用しているテーマであるHugo Future Imperfect Slimのメタタグ設定箇所は **layouts/partials/meta.html** なため、このファイルを触っていきます。  
該当箇所は
```html:layouts/partials/meta.html
{{- with or (.Params.openGraph) (.Params.images) -}}
  {{ range . }}
    <meta property="og:image" content="{{ .src | absURL }}">
    <meta property="og:image:alt" content="{{ .alt }}">
  {{- end -}}
{{ else }}
  <meta property="og:image" content="{{ .Site.Params.intro.pic.src | absURL }}">
{{ end }}
```
なのですが、何故かテーマディレクトリ配下のサンプルサイトを元に設定しても **.src** を参照できないとエラーを吐かれたので、以下の様に独自処理に書き換えました。
```html:layouts/partials/meta.html
{{ $ogImagePathBase := printf "/img/og/%s.png" .File.BaseFileName }}
{{ $ogImagePathForCheckExists := printf "/static%s" $ogImagePathBase }}
{{ if fileExists $ogImagePathForCheckExists }}
  {{ $ogImagePath := printf "/blog%s" $ogImagePathBase }}
  <meta property="og:image" content="{{ $ogImagePath | absURL }}">
{{ else }}
  <meta property="og:image" content="{{ .Site.Params.intro.pic.src | absURL }}">
{{ end }}
<meta property="og:image:alt" content="The Open Graph logo">
```
static/img/og/配下に記事ファイル名と同じ名前のpngファイルが存在していたらそれをOGP画像として使用し、そうでなければサイトプロフィールの画像をOGP画像として使用しています。  
altは、とりあえず The Open Graph logo としておけばよさそうだったので、固定にしています。


## 本記事の対応を行った際のコミットログ
全体的に何をどのように触ったのかを確認したい方向けに、コミットログやファイル変更情報をおいておきます。  
<font color="#1111cc"><a href="https://github.com/koki-nakamura22/env-for-blog/pull/12/files" target="_blank">Pull request Files changed: 8 generate an ogp image automatically</a></font>  
<font color="#1111cc"><a href="https://github.com/koki-nakamura22/env-for-blog/pull/13/files" target="_blank">Pull request Files changed: 8 generate an ogp image automatically 2</a></font>  


## ハマった点
Go言語をインストールする際にapt-getコマンドを使用したところ、インストールされたバージョンが古くtcardgenインストール時に以下のエラーが発生しました。  
```sh
# cd .; git clone -- https://gopkg.in/yaml.v2 /home/koki-n/go/src/gopkg.in/yaml.v2
Cloning into '/home/koki-n/go/src/gopkg.in/yaml.v2'...
fatal: unable to access 'https://gopkg.in/yaml.v2/': server certificate verification failed. CAfile: none CRLfile: none
package gopkg.in/yaml.v2: exit status 128
package github.com/pelletier/go-toml/v2: cannot find package "github.com/pelletier/go-toml/v2" in any of:
        /usr/lib/go-1.13/src/github.com/pelletier/go-toml/v2 (from $GOROOT)
        /home/koki-n/go/src/github.com/pelletier/go-toml/v2 (from $GOPATH)
```
apt-getコマンドでインストールすると最新安定版ではない古いバージョンのものがインストールされることが多々あるため、許されるならば可能な限りHomebrewを使用するなど、別ルートでライブラリをインストールした方が良いと思います。


## 参考にしたページ
<font color="#1111cc"><a href="https://michimani.net/post/development-generate-ogp-image-by-tcardgen-in-hugo/" target="_blank">[Hugo] tcardgen を使って OGP 画像を自動生成する</a></font>  
<font color="#1111cc">https://github.com/Ladicle/tcardgen<a href="" target="_blank">Ladicle/tcardgen</a></font>  
