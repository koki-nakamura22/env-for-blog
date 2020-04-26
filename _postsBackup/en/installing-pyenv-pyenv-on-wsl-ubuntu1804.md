+++
author = "Koki"
categories = ["Python", "WSL"]
date = 2020-04-26T20:26:18+10:00
description = "This article explains how to install pyenv, and Python by pyenv on WSL (Ubuntu 18.04 LTS)."
images = [""]
linktitle = ""
title = "Installing pyenv, and Python by pyenv on WSL (Ubuntu 18.04 LTS)"
type = "post"

+++
This article explains how to install pyenv, and Python by pyenv on WSL (Ubuntu 18.04 LTS).

The following lists are the table of contents about this article.

- <font color="#1111cc">[Target audience](#target-audience)</font>
- <font color="#1111cc">[Environment](#environment)</font>
- <font color="#1111cc">[Preconditions](#preconditions)</font>
- <font color="#1111cc">[Installing pyenv](#installing-pyenv)</font>
- <font color="#1111cc">[Installing Python by pyenv](#installing-python-by-pyenv)</font>
  - <font color="#1111cc">[Installing libraries that need for installing Python](#installing-libraries-that-need-for-installing-python)</font>
  - <font color="#1111cc">[Installing Python](#installing-python)</font>
- <font color="#1111cc">[Reference articles](#reference-articles)</font>

<br>
---

# Target audience
- Those who want to install pyenv and Python on WSL.

<br>
---

# Environment
- WSL (Ubuntu 18.04 LTS)

<br>
---

# Preconditions
- Already installed git.

<br>
---

# Installing pyenv
Execution the following commands.
```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
exec "$SHELL"
```

Then reboot WSL for applying the setting.  
Installation of pyenv is now complete.

# Installing Python by pyenv

## Installing libraries that need for installing Python

Execution the following command.
```bash
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev
```

## Installing Python

Execution the following command, then setting Python version that will use.  
In this case, installing Python 3.8.2.
```bash
pyenv install 3.8.2
pyenv global 3.8.2
```

<br>
---

# Reference articles
<div class="blog-card" style="padding:12px;margin:15px 0;border:1px solid #ddd;word-wrap:break-word;max-width:474px;width:auto;border-radius:5px;"><div class="blog-card-thumbnail" style="float:right;"><a href="https://github.com/pyenv/pyenv#basic-github-checkout" class="blog-card-thumbnail-link" target="_blank"><img src="http://capture.heartrails.com/120x120/shorten?https://github.com/pyenv/pyenv#basic-github-checkout" class="blog-card-thumb-image wp-post-image" alt="12436288584_94d6bc46d2_b.jpg" style="width:100px;height:100px;"></a></div><div class="blog-card-content" style="margin-left:0;margin-right:110px;line-height:120%;"><div class="blog-card-title" style="margin-bottom:5px;"><a href="https://github.com/pyenv/pyenv#basic-github-checkout" class="blog-card-title-link" style="font-weight:bold;text-decoration:none;color:#111;" target="_blank">GitHub - pyenv/pyenv: Simple Python version management</a></div><div class="blog-card-excerpt" style="color:#333;font-size:90%;">xxxxxxxxxx</div></div><div class="blog-card-footer" style="font-size:70%;color:#777;margin-top:10px;clear:both;"><span class="blog-card-hatena"><a href="http://b.hatena.ne.jp/entry/https://github.com/pyenv/pyenv#basic-github-checkout" target="_blank"><img border="0" src="http://b.hatena.ne.jp/entry/image/https://github.com/pyenv/pyenv#basic-github-checkout" border="0" alt="" /></a></span></div></div>


