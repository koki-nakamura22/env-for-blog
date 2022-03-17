+++
author = "Koki"
categories = ["JavaScript"]
date = 2022-03-12T22:24:57+09:00
description = "This article explains how to install Jest, how to set up intellisense and how solving an import error."
images = [""]
linktitle = ""
title = "About installing Jest, and how to set up intellisense and how solving an import error."
type = "post"

+++
<font color="red">[17/03/2022] Fix the npm install command in the set up intellisense section.</font>

This article explains how to install Jest, how to set up intellisense and how solving an import error.

The following lists are the table of contents about this article.
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[Target audience](#target-audience)</font>
- <font color="#1111cc">[Environment](#environment)</font>
- <font color="#1111cc">[Preconditions](#preconditions)</font>
- <font color="#1111cc">[Install Jest](#install-jest)</font>
- <font color="#1111cc">[Set up intellisense](#set-up-intellisense)</font>
- <font color="#1111cc">[Set up for solving an import error](#set-up-for-solving-an-import-error)</font>
- <font color="#1111cc">[Digression](#digression)</font>
  - <font color="#1111cc">[Why did I choose Jest for JavaScript testing?](#why-did-i-choose-jest-for-javascript-testing)</font>
  - <font color="#1111cc">[Why do I use both npm and yarn?](#why-do-i-use-both-npm-and-yarn)</font>
- <font color="#1111cc">[Reference articles](#reference-articles)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## Target audience
- Those who want to build Jest environment.


## Environment
- Windows 10 (Ver. 21H2, Build. 19044.1526)
- WSL 2 (Ubuntu 20.04 LTS)
- Visual Studio Code


## Preconditions
- Installed npm and yarn


## Install Jest
```sh
npm install --save-dev jest
```


## Set up intellisense
Firstly, execute the below command to install Jest type definitions.
```sh
npm install --save-dev @types/jest
```

Then create a **jsconfig.json** to the project root directory.  
Content is the below.
```javascript
{
  "typeAcquisition": {
    "include": [
      "jest"
    ]
  }
}
```

## Set up for solving an import error
You need to set up another thing because an import error is happening when you use Jest if you use it as it is.  
Firstly, execute the below command to build babel environment.
```sh
yarn add --dev babel-jest @babel/core @babel/preset-env
```

Then create a **babel.config.cjs** to the project root directory, which's content is the below.
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


## Digression
### Why did I choose Jest for JavaScript testing?
From the below three reasons.
1. The number of users is the highest in the world. (From npm trends) So it is easy to get information even if we are bothered by Jest.
2. Easy to build environment
3. Jest supports various JavaScript libraries and frameworks.


### Why do I use both npm and yarn?
Because yarn is needed to build the babel environment. (I mean npm can not build it.)  


## Reference articles
<font color="#1111cc"><a href="https://jestjs.io/docs/configuration" target="_blank">Configuring Jest</a></font>  
<font color="#1111cc"><a href="https://www.npmtrends.com/jest-vs-jasmine-vs-mocha-vs-chai-vs-cypress" target="_blank">npm trends (chai vs cypress vs jasmine vs jest vs mocha)</a></font>

