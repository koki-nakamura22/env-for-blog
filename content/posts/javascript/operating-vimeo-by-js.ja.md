+++
author = "Koki"
categories = ["JavaScript"]
date = 2019-12-24T13:15:50+11:00
description = "埋め込みVimeo動画をJavaScriptで操作するサンプルコードについて説明します。"
images = [""]
linktitle = ""
title = "埋め込みVimeo動画をJavaScriptで操作するサンプルコード"
type = "post"

+++
この記事では、埋め込みVimeo動画をJavaScriptで操作するサンプコードについて説明します。

この記事の内容です。

- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[JavaScriptでVimeo動画を操作する](#javascript%E3%81%A7vimeo%E5%8B%95%E7%94%BB%E3%82%92%E6%93%8D%E4%BD%9C%E3%81%99%E3%82%8B)</font>
  - <font color="#1111cc">[HTMLファイルに埋め込み用Vimeo動画を読み込む](#html%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%81%AB%E5%9F%8B%E3%82%81%E8%BE%BC%E3%81%BF%E7%94%A8vimeo%E5%8B%95%E7%94%BB%E3%82%92%E8%AA%AD%E3%81%BF%E8%BE%BC%E3%82%80)</font>
  - <font color="#1111cc">[各HTML用のJavaScriptファイルを作成する](#%E5%90%84html%E7%94%A8%E3%81%AEjavascript%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92%E4%BD%9C%E6%88%90%E3%81%99%E3%82%8B)</font>
  - <font color="#1111cc">[Vimeoビデオを操作する機能のJavaScriptファイルを作成する](#vimeo%E3%83%93%E3%83%87%E3%82%AA%E3%82%92%E6%93%8D%E4%BD%9C%E3%81%99%E3%82%8B%E6%A9%9F%E8%83%BD%E3%81%AEjavascript%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92%E4%BD%9C%E6%88%90%E3%81%99%E3%82%8B)</font>
- <font color="#1111cc">[サンプルコード](#%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E3%82%B3%E3%83%BC%E3%83%89)</font>
- <font color="#1111cc">[参考にさせていただいたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%95%E3%81%9B%E3%81%A6%E3%81%84%E3%81%9F%E3%81%A0%E3%81%84%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>


## 対象読者
- JavaScriptで埋め込みVimeo動画を操作したい方


## 環境
- JavaScript (ES2015)


## 前提条件
なし


## JavaScriptでVimeo動画を操作する
### HTMLファイルに埋め込み用Vimeo動画を読み込む
最初に、埋め込み用Vimeo動画をiframeを使用して読み込みます。  
この記事では、サンプルのVimeo動画を使用しています。
```html:index.html
<html>
  <head>
    <script type="module" src="./javascript/index.js"></script>
  </head>
  <body>
    <!-- Specific your video URL on src attribute. -->
    <iframe
      id="sample-player"
      src="https://player.vimeo.com/video/76979871"
      width="640"
      height="360"
      frameborder="0"
      webkitallowfullscreen
      mozallowfullscreen
      allowfullscreen
      allow="autoplay"
    ></iframe>
    <div>
      <button id="play-button">play</button>
      <button id="pause-button">pause</button>
      <button id="play-pause-button">play and pause</button>
    </div>
  </body>
</html>
```

### 各HTML用のJavaScriptファイルを作成する
もし、各HTML用にJavaScriptファイルを作成しない方なら、この内容は読み飛ばしてください。  

次に、各HTML用にJavaScriptファイルを作成し、埋め込みVimeo動画を操作するためのJavaScriptファイルを読み込みます。  
ここで読み込んでいるJavaScriptファイルについては、次の章で説明します。
```javascript:index.js
import * as vimeo from './vimeo-api-practice.js';

window.onload = () => {
  let playerInformation = new vimeo.PlayerInformation(
    'player',
    {
      playButtonId: 'play-button',
      pauseButtonId: 'pause-button',
      playPauseButtonId: 'play-pause-button'
    }
  );
  vimeo.settingPlayer(playerInformation);
}
```

### Vimeoビデオを操作する機能のJavaScriptファイルを作成する
最後に、Vimeoビデオを操作する機能のJavaScriptファイルを作成します。  
<br>
最初に、Vimeo APIを読み込みます。「何故このファイルでAPIを読み込むのか？」については、本ファイルを独立した機能として扱えるようにしたかったからです。  
次に、動画プレーヤーのidと操作するボタンの各idを呼び出し元から受け取り、それらのDOM要素にイベントを設定します。  
この章では動画再生と一時停止のみしか行っていませんが、他の操作も行えます。もし他の操作を行いたい場合は、公式リファレンスを参考にしてください。  
<br>
本記事のコードは<font color="#1111cc"><a href="https://github.com/koki-nakamura22/vimeo-js-example" target="_blank">GitHub</a></font>で公開していますので、必要な方はご自由にお使いください。

```javascript:vimeo.js
let tag = document.createElement('script');
tag.src = 'https://player.vimeo.com/api/player.js';
document.getElementsByTagName('head')[0].appendChild(tag);

export function settingPlayer(playerInformation) {
  let iframe = document.getElementById(playerInformation.playerId);
  let player = new Vimeo.Player(iframe);
  // Setting play the video by play button.
  document.getElementById(playerInformation.playButtonId)
          .addEventListener("click", event => { player.play(); });
  // Setting pause the video by play button.
  document.getElementById(playerInformation.pauseButtonId)
          .addEventListener("click", event => { player.pause(); });
  // Setting play and pause the video by play button.
  // When the video is playing, pause it. And when the video is pausing, play it.
  document.getElementById(playerInformation.playPauseButtonId)
          .addEventListener("click", event => {
            player.getPaused().then(paused => {
            paused ? player.play() : player.pause();
          });
  });
}

export class PlayerInformation {
  constructor(playerId, buttonIds) {
    this.playerId = playerId;
    if (buttonIds.playButtonId) this.playButtonId = buttonIds.playButtonId;
    if (buttonIds.pauseButtonId) this.pauseButtonId = buttonIds.pauseButtonId;
    if (buttonIds.playPauseButtonId) this.playPauseButtonId = buttonIds.playPauseButtonId;
  }
}
```


## サンプルコード
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://github.com/koki-nakamura22/vimeo-js-example" class="blog-card-thumbnail-link" target="_blank"><img src="https://capture.heartrails.com/120x120/shorten?https://github.com/koki-nakamura22/vimeo-js-example" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://github.com/koki-nakamura22/vimeo-js-example" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">koki-nakamura22/vimeo-js-example: This repository is example.</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="https://b.hatena.ne.jp/entry/https://github.com/koki-nakamura22/vimeo-js-example" target="_blank"><img border="0" src="https://b.hatena.ne.jp/entry/image/https://github.com/koki-nakamura22/vimeo-js-example" border="0" alt="" /></a></span></div></div>


## 参考にさせていただいたページ
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://developer.vimeo.com/player/sdk/basics" class="blog-card-thumbnail-link" target="_blank"><img src="https://capture.heartrails.com/120x120/shorten?https://developer.vimeo.com/player/sdk/basics" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://developer.vimeo.com/player/sdk/basics" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Player SDK: The Basics | Vimeo Developer</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="https://b.hatena.ne.jp/entry/https://developer.vimeo.com/player/sdk/basics" target="_blank"><img border="0" src="https://b.hatena.ne.jp/entry/image/https://developer.vimeo.com/player/sdk/basics" border="0" alt="" /></a></span></div></div>

<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://github.com/vimeo/player.js/" class="blog-card-thumbnail-link" target="_blank"><img src="https://capture.heartrails.com/120x120/shorten?https://github.com/vimeo/player.js/" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://github.com/vimeo/player.js/" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">vimeo/player.js: Interact with and control an embedded Vimeo Player.</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="https://b.hatena.ne.jp/entry/https://github.com/vimeo/player.js/" target="_blank"><img border="0" src="https://b.hatena.ne.jp/entry/image/https://github.com/vimeo/player.js/" border="0" alt="" /></a></span></div></div>
