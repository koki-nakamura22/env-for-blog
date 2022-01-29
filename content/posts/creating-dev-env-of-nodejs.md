+++
author = "Koki"
categories = ["Node.js"]
date = 2019-10-05T21:09:21+10:00
description = "Explain how to create a development environment of Node.js (Use Express) including a function of hot reload. (VS Code)"
images = [""]
linktitle = ""
title = "Creating a development environment of Node.js (Use Express and VS Code)"
type = "post"

+++
This article explains how to create a development environment of Node.js (Use Express) including a function of hot reload. (VS Code)

The following lists are the table of contents about this article.

- <font color="#1111cc">[Target audience](#target-audience)</font>
- <font color="#1111cc">[Environment](#environment)</font>
- <font color="#1111cc">[Preconditions](#preconditions)</font>
- <font color="#1111cc">[Creating the development environment](#creating-the-development-environment)</font>
  - <font color="#1111cc">[Make project directory](#make-project-directory)</font>
  - <font color="#1111cc">[Install Express](#install-express)</font>  
      - <font color="#1111cc">[Install](#install)</font>
      - <font color="#1111cc">[Create a environment for test](#create-a-environment-for-test)</font>
  - <font color="#1111cc">[Install Nodemon globally](#install-nodemon-globally)</font>
      - <font color="#1111cc">[Install](#install-1)</font>
      - <font color="#1111cc">[Make a setting file](#make-a-setting-file)</font>
      - <font color="#1111cc">[Make and edit launch.json](#make-and-edit-launchjson)</font>
      - <font color="#1111cc">[Edit package.json](#edit-packagejson)</font>
  - <font color="#1111cc">[How to execute in debug mode](#how-to-execute-in-debug-mode)</font>
- <font color="#1111cc">[Reference articles](#reference-articles)</font>


## Target audience
- Those who want to create the development environment of Node.js (Express) on VS Code.


## Environment
- Windows 10 (1903)
- Visual Studio Code (1.38.1)
- Node.js (v10.16.3)
- npm (6.11.2)


## Preconditions
- Installed Node.js, npm and VS Code


## Creating the development environment
### Make project directory
Execute the following command to make the directory.  
Use the command that is the same on Windows, Mac and Linux.
```winbatch
mkdir [project name]
```
<br>

### Install Express
#### Install
First, Move to the directory that was made.  
Then execute the following command to install Express locally.
```winbatch
npm install express --save-dev
```

#### Create a environment for test
First, execute the following command to init npm.
```winbatch
npm init
```
Then create a app.js file and copy the following codes to the file.
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
Creating a developing environment of Node.js (Express) that finished.  
Next, setting up an environment of hot reload.
<br>

### Install Nodemon globally
Use Nodemon to creating an environment of hot reload.
#### Install
Execute the following command to install nodemon globally.
```winbatch
npm install nodemon -g
```

#### Make a setting file
Make .nodemon.json file at project's root path.  
Then paste the following codes to the file.
```json:.nodemon.json
{
  "watch": "./*",
  "ext": "js,json",
  "exec": "node ./app"
}
```

#### Make and edit launch.json
First, make launch.json by the following work.  
<br>
[Debug] in a left menu -> [Gear icon] -> Choose "Node.js" on Select Environment.
<br>
Then replace the contents of "configuration" from source to the following code.
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
The following codes are complete form.
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

#### Edit package.json
Finally, adding a command to package.json for executing program.  
Adding the following command to "script" in the package.json.
```json
"debug": "nodemon --inspect app.js"
```
<br>
This is the end of creating the development environment.
<br>

### How to execute in debug mode
To start the program in debug mode, execute the following command at project's root path.
```winbatch
npm run debug
```
Then press "F5" key on VS Code.  
If VS Code ask for you about "Pick the node.js process to attach to", choose "node --inspect app.js".  
When you want to exit, press F5 or click "Disconnect" in a debug menu. And, press Ctrl + C in Command Prompt or PowerShell.


## Reference articles
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://expressjs.com/en/starter/installing.html" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://expressjs.com/en/starter/installing.html" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://expressjs.com/en/starter/installing.html" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Installing Express</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://expressjs.com/en/starter/installing.html" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://expressjs.com/en/starter/installing.html" border="0" alt="" /></a></span></div></div>
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://expressjs.com/en/starter/hello-world.html" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://expressjs.com/en/starter/hello-world.html" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://expressjs.com/en/starter/hello-world.html" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">Express "Hello World" example</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://expressjs.com/en/starter/hello-world.html" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://expressjs.com/en/starter/hello-world.html" border="0" alt="" /></a></span></div></div>
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://github.com/remy/nodemon" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://github.com/remy/nodemon" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://github.com/remy/nodemon" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">remy/nodemon: Monitor for any changes in your node.js application and automatically restart the server - perfect for development</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://github.com/remy/nodemon" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://github.com/remy/nodemon" border="0" alt="" /></a></span></div></div>