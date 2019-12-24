+++
author = "Koki"
categories = ["JavaScript"]
date = 2019-12-24T13:15:49+11:00
description = "Example codes about operating a embedded Vimeo video by JavaScript."
images = [""]
linktitle = ""
title = "Example codes about operating a embedded Vimeo video by JavaScript."
type = "post"

+++
This article explains the example codes of operating the embedded Vimeo video by JavaScript.  

The following lists are the table of contents about this article.

- <font color="#1111cc">[Target audience](#target-audience)</font>
- <font color="#1111cc">[Environment](#environment)</font>
- <font color="#1111cc">[Preconditions](#preconditions)</font>
- <font color="#1111cc">[Operating a embedded Vimeo video by JavaScript](#operating-a-embedded-vimeo-video-by-javascript)</font>
  - <font color="#1111cc">[Loading the embedded Vimeo video to a HTML file](#loading-the-embedded-vimeo-video-to-a-html-file)</font>
  - <font color="#1111cc">[Create a JavaScript file for each HTML file](#create-a-javascript-file-for-each-html-file)</font>
  - <font color="#1111cc">[Create a JavaScript to operating the Vimeo video.](#create-a-javascript-to-operating-the-vimeo-video)</font>
- <font color="#1111cc">[Example code](#example-code)</font>
- <font color="#1111cc">[Reference articles](#reference-articles)</font>

<br>
---

# Target audience
- Those who want to operating the Vimeo video by JavaScript.

<br>
---

# Environment
- JavaScript (ES2015)

<br>
---

# Preconditions
Nothing.

<br>
---

# Operating a embedded Vimeo video by JavaScript
## Loading the embedded Vimeo video to a HTML file
First, load the embedded Vimeo video to a HTML file by iframe.  
In this article case, using a sample Vimeo video.
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

## Create a JavaScript file for each HTML file
If you do not create a JavaScript file each HTML file, ignore this chapter, please.  
Next, create a JavaScript file for each HTML file, and loading a function of operation any embedded Vimeo videos.  
What about "vimeo-api-practice.js" I will explain on next chapter.
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

## Create a JavaScript to operating the Vimeo video.
Finally, create a JavaScript file to operating a embedded Vimeo video.  
<br>
First, load the Vimeo API in this file so that we can use this file as a common part.  
Next, recieve player id and button ids from caller by arguments, then setting any events.  
This chapter explains only play and pause, but you can do other operations. When you would like to do another operations, please read the official references.  
<br>
If you would like to use the following codes, please check <font color="#1111cc"><a href="https://github.com/koki-nakamura22/vimeo-js-example" target="_blank">my GitHub repository</a></font>.

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

# Example code
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://github.com/koki-nakamura22/vimeo-js-example" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://github.com/koki-nakamura22/vimeo-js-example" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://github.com/koki-nakamura22/vimeo-js-example" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">koki-nakamura22/vimeo-js-example: This repository is example.</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://github.com/koki-nakamura22/vimeo-js-example" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://github.com/koki-nakamura22/vimeo-js-example" border="0" alt="" /></a></span></div></div>

<br>
---

# Reference articles
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://developer.vimeo.com/player/sdk/basics" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://developer.vimeo.com/player/sdk/basics" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://developer.vimeo.com/player/sdk/basics" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Player SDK: The Basics | Vimeo Developer</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://developer.vimeo.com/player/sdk/basics" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://developer.vimeo.com/player/sdk/basics" border="0" alt="" /></a></span></div></div>

<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://github.com/vimeo/player.js/" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://github.com/vimeo/player.js/" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://github.com/vimeo/player.js/" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">vimeo/player.js: Interact with and control an embedded Vimeo Player.</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://github.com/vimeo/player.js/" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://github.com/vimeo/player.js/" border="0" alt="" /></a></span></div></div>
