+++
author = "Koki"
categories = ["Hugo"]
date = 2022-03-20T16:16:05+09:00
description = "This article explains how to setting Hugo article URLs structure as the same as under /content directory structure."
images = [""]
linktitle = ""
title = "Setting Hugo article URLs structure as the same as under /content/ structure."
type = "post"
draft = true

+++
This article explains how to setting Hugo article URLs structure as the same as under /content directory structure.

The following lists are the table of contents about this article.
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[Target audience](#target-audience)</font>
- <font color="#1111cc">[Environment](#environment)</font>
- <font color="#1111cc">[Preconditions](#preconditions)</font>
- <font color="#1111cc">[Update Hugo](#update-hugo)</font>
- <font color="#1111cc">[Change setting to the config file.](#change-setting-to-the-config-file)</font>
- <font color="#1111cc">[Example](#example)</font>
- <font color="#1111cc">[Reference articles](#reference-articles)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## Target audience
- Those who want to organize the posts by category, and setting URLs structure as the same as under /content directory structure.


## Environment
- WSL 2 (Ubuntu 20.04 LTS)
- Hugo
- Homebrew


## Preconditions
- Installed Hugo
- Installed Homebrew


## Update Hugo
If your Hugo version is 0.83.0 or later, skip this section.  
If not, you need to upgrade Hugo because an attribute that is used in this article added at version 0.83.0.  

In this article case, uninstall Hugo by apt-get then re-install by Homebrew because apt-get repository has not known latest version Hugo.  

The re-install flow is the below.
```sh
sudo apt-get remove -y hugo
brew update
brew install hugo
```

When you execute brew update if the below error message displayed, please execute **update-reset** then execute **brew update** again.


## Change setting to the config file.
Change the permalinks section like below. (The below case is just an example.)
```toml:config.toml
[permalinks]
    posts = "/:year/:month/:day/:filename/" # Before change
    posts = "/:sections/:filename" # After change
```
If you use config.yaml or config.json, please refer to this page.  
<font color="#1111cc"><a href="https://gohugo.io/content-management/urls/" target="_blank">Hugo: URL Management</a></font>

## Example
I will put the example, which is I set up this site. If you are interested in that, check it!  
<font color="#1111cc"><a href="https://github.com/koki-nakamura22/env-for-blog/commit/e155732662e1c8cab8c9dda19940f8df045c28a7" target="_blank">organizing the posts</a></font>  


## Reference articles
<font color="#1111cc"><a href="https://gohugo.io/getting-started/installing/#homebrew-macos" target="_blank">Install Hugo | Hugo: Homebrew (macOS)</a></font>  
<font color="#1111cc"><a href="https://qiita.com/kkdd/items/53a36dcf9ac6a4e0fa3c" target="_blank">Homebrew 警告への対処（Another active Homebrew update process is already in progress）</a></font>  
<font color="#1111cc"><a href="https://discourse.gohugo.io/t/section-content-not-showing/10187" target="_blank">Section content not showing</a></font>  
