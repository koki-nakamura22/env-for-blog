+++
author = "Koki"
categories = ["Homebrew"]
date = 2022-03-20T15:50:48+09:00
description = 'This article explains how to solve an error message "error: Failed to merge in the changes" appears when executing brew update.'
images = [""]
linktitle = ""
title = 'What to do when an error message "error: Failed to merge in the changes" appears when executing brew update.'
type = "post"
draft = true

+++
This article explains how to solve an error message "error: Failed to merge in the changes" appears when executing brew update.

The following lists are the table of contents about this article.
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[Target audience](#target-audience)</font>
- <font color="#1111cc">[Environment](#environment)</font>
- <font color="#1111cc">[Preconditions](#preconditions)</font>
- <font color="#1111cc">[Executing brew update-reset](#executing-brew-update-reset)</font>
- <font color="#1111cc">[What does brew update-reset command do?](#what-does-brew-update-reset-command-do)</font>
- <font color="#1111cc">[Reference articles](#reference-articles)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## Target audience
Those who want to break through the errors that occur when executing brew update and update Homebrew.


## Environment
- WSL 2 (Ubuntu 20.04 LTS)


## Preconditions
- Installed Homebrew


## Executing brew update-reset
Executing the below command to solve the problem.
```sh
brew update-reset
```
That's it!

## What does brew update-reset command do?
Homebrew official and non-official remote repository information are reset, then reacquired and reconfigured.


## Reference articles
<font color="#1111cc"><a href="https://docs.brew.sh/Manpage#update-reset-repository-" target="_blank">Homebrew Documentation: update-reset </a></font>  
<font color="#1111cc"><a href="https://github.com/Homebrew/brew/issues/8975" target="_blank">install brew error error: Failed to merge in the changes.</a></font>  
