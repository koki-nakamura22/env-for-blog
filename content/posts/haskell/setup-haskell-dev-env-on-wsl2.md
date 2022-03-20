+++
author = "Koki"
categories = ["Haskell", "WSL"]
date = 2022-02-24T10:34:12+09:00
description = "This article explains how to set up a Haskell development environment with VS Code on WSL2 (Ubuntu 20.04). Also, includes useful VS Code extensions for development with Haskell."
images = [""]
linktitle = ""
title = "Set up a Haskell development environment with VS Code on WSL2 (Ubuntu 20.04)"
type = "post"

+++
This article explains how to set up a Haskell development environment with VS Code on WSL2 (Ubuntu 20.04).

The following lists are the table of contents about this article.

- <font color="#1111cc">[Target audience](#target-audience)</font>
- <font color="#1111cc">[Environment](#environment)</font>
- <font color="#1111cc">[Preconditions](#preconditions)</font>
- <font color="#1111cc">[Set up the development environment](#set-up-the-development-environment)</font>
  - <font color="#1111cc">[1. Install](#1-install)</font>
  - <font color="#1111cc">[2. Create a project](#2-create-a-project)</font>
  - <font color="#1111cc">[3. Prepare to enable build the project](#3-prepare-to-enable-build-the-project)</font>
  - <font color="#1111cc">[4. Check setting up the development environment successful](#4-check-setting-up-the-development-environment-successful)</font>
  - <font color="#1111cc">[5. Install VS Code extensions for development with Haskell](#5-install-vs-code-extensions-for-development-with-haskell)</font>
- <font color="#1111cc">[Reference articles](#reference-articles)</font>

## Target audience
- Those who want to set up a Haskell development environment with VS Code on WSL2 (Ubuntu 20.04).

## Environment
- Windows 10 (Ver. 21H2, Build. 19044.1526)
- WSL 2 (Ubuntu 20.04 LTS)

## Preconditions
- Install WSL 2 (Ubuntu 20.04 LTS) to Windows 10
- Install VS Code to WSL 2

## Set up the development environment

### 1. Install
```sh
wget -qO- https://get.haskellstack.org/ | sh
```

### 2. Create a project
```sh
stack new [your project name]
```

### 3. Prepare to enable build the project
```sh
cd [your project name]
stack setup
stack build
```

### 4. Check setting up the development environment successful
```sh
stack exec [your project name]-exe
```
Setting up has been succeeded when **someFunc** is shown up after executing the above command.  
It is like below.
```sh
$ stack exec [your project name]-exe
someFunc
```

### 5. Install VS Code extensions for development with Haskell
Finally, install the below extensions after launching VS Code
* Haskell  
Haskell Syntax Highlighting is installed together
* hlint  
haskell-linter is installed together

That's it!  
Enjoy your development life!

## Reference articles
<a href="https://docs.haskellstack.org/en/stable/install_and_upgrade/" target="_blank">Install/upgrade - The Haskell Tool Stack</a>
