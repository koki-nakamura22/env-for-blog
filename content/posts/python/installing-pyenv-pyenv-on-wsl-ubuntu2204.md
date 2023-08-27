+++
author = "Koki"
categories = ["Python", "WSL"]
tags = ["Python", "WSL"]
date = 2023-08-27T14:37:55+09:00
linktitle = ""
title = "How to Install pyenv on WSL2 Ubuntu 22.04"
description = "In this article, we'll walk you through the steps to install pyenv on Ubuntu 22.04 running on WSL2. From introducing the packages needed for pyenv's installation to setting up pyenv itself, we cover the complete process."
type = "post"
+++
In this article, we'll walk you through the steps to install pyenv on Ubuntu 22.04 running on WSL2. From introducing the packages needed for pyenv's installation to setting up pyenv itself, we cover the complete process.

The following lists are the table of contents about this article.
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[Target audience](#target-audience)</font>
- <font color="#1111cc">[Environment](#environment)</font>
- <font color="#1111cc">[Preconditions](#preconditions)</font>
- <font color="#1111cc">[Contents](#contents)</font>
  - <font color="#1111cc">[1. Installing Necessary Packages](#1-installing-necessary-packages)</font>
  - <font color="#1111cc">[2. Installing pyenv](#2-installing-pyenv)</font>
  - <font color="#1111cc">[3. Initial Configuration for pyenv](#3-initial-configuration-for-pyenv)</font>
- <font color="#1111cc">[Reference articles](#reference-articles)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## Target audience
- Those using WSL2
- Individuals looking to manage Python versions efficiently
- Those aiming to install pyenv on Ubuntu


## Environment
- WSL2
- Ubuntu 22.04


## Preconditions
- Can access to the internet

## Contents

### 1. Installing Necessary Packages

First, we need to install the packages required for pyenv. Execute the following command:  
```sh
sudo apt install -y gcc make build-essential libssl-dev libffi-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev liblzma-dev
```

### 2. Installing pyenv
Next, we'll use the official installation script to get pyenv set up.  
```sh
curl https://pyenv.run | bash
```

### 3. Initial Configuration for pyenv
Lastly, set up the environment variables for pyenv. Add the following lines to your .bashrc:  
```sh
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
```

With these steps, you should now have pyenv installed and ready to use on Ubuntu 22.04 on WSL2.

## Reference articles

- <a href="https://kfields.me/blog/pyenv_on_ubuntu_22" target="_blank">Install Pyenv on Ubuntu 22.04</a>
- <a href="https://www.mathpython.com/ubuntu-python" target="_blank">Ubuntu に pyenv を利用して Python をインストールする</a>
