+++
author = "Koki"
categories = ["Visual Studio Code"]
date = 2022-02-25T16:29:51+09:00
description = "This article explains how to ignore auto-formatting a specific language on VS Code. (Using Prettier)"
images = [""]
linktitle = ""
title = "Ignore auto-formatting a specific language on VS Code (Using Prettier)"
type = "post"

+++
This article explains how to gnore auto-formatting a specific language on VS Code (Using Prettier).

The following lists are the table of contents about this article.
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[Target audience](#target-audience)</font>
- <font color="#1111cc">[Environment](#environment)</font>
- <font color="#1111cc">[Preconditions](#preconditions)</font>
- <font color="#1111cc">[Edit setting.json](#edit-settingjson)</font>
  - <font color="#1111cc">[1. Open setting.json](#1-open-settingjson)</font>
  - <font color="#1111cc">[2. Disable specific language auto-formatting function](#2-disable-specific-language-auto-formatting-function)</font>
- <font color="#1111cc">[Reference articles](#reference-articles)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## Target audience
- Those who want to switch the on-off auto-formatting function on a specific language


## Environment
- Visual Studio Code


## Preconditions
- Install Prettier (Prettier is VS Code extention)

## Edit setting.json
### 1. Open setting.json
Pushing Ctrl + Shift + P simultaneously then choosing Preferences: Open Settings(JSON).  
If your environment is Mac OS, push Command + Shift + P instead of Ctrl + Shift + P.


### 2. Disable specific language auto-formatting function
Add the below line to a specific language section.
```json
"editor.formatOnSave": false
```

e.g. Add to markdown section.
```json
  "[markdown]": {
    "editor.formatOnSave": false
  },
```

When a specific language section does not exist in the setting.json, you can add a new section yourself.  
You can know from what language can use to add the new section that checking the below page.   
<a href="https://code.visualstudio.com/docs/languages/identifiers#_known-language-identifiers"  target="_blank">Language Identifiers#Known language identifiers</a>


## Reference articles
<a href="https://github.com/prettier/prettier-vscode" target="_blank">prettier / prettier-vscode</a>
