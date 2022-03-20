+++
author = "Koki"
categories = ["Hugo"]
date = 2022-03-20T15:17:30+09:00
description = "This article explains how to add robots.txt to the site Hugo builds."
images = [""]
linktitle = ""
title = "Add a robots.txt to the site Hugo builds."
type = "post"

+++
This article explains how to add robots.txt to the site Hugo builds.

The following lists are the table of contents about this article.
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[Target audience](#target-audience)</font>
- <font color="#1111cc">[Environment](#environment)</font>
- <font color="#1111cc">[Preconditions](#preconditions)</font>
- <font color="#1111cc">[Add setting to the config file](#add-setting-to-the-config-file)</font>
- <font color="#1111cc">[Create the robots.txt under the layouts directory](#create-the-robotstxt-under-the-layouts-directory)</font>
- <font color="#1111cc">[Example](#example)</font>
- <font color="#1111cc">[Reference articles](#reference-articles)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## Target audience
- Those who want to add a robots.txt to the site Hugo builds.


## Environment
- Hugo (v0.94.2+extended linux/amd64 BuildDate=unknown)


## Preconditions
- Installed Hugo.


## Add setting to the config file
Add the below code to top-level in the config file.  
In this site case, I added the below code because the config file type is toml.
```toml:config.toml
enableRobotsTXT         = true
```

If you use a YAML type config file, add the below code.
```yaml:config.yaml
enableRobotsTXT: true
```

If you use a JSON type config file, add the below code.
```json:config.json
"enableRobotsTXT": true
```

Hugo will create the robots.txt that contents are below when generate the site.
```txt:robots.txt
User-agent: *
```


## Create the robots.txt under the layouts directory
When you want to customize the robots.txt, you can use your robots.txt you create in the layouts directory.


## Example
I will put the example, which is I set up this site. If you are interested in that, check it!  
<font color="#1111cc"><a href="https://github.com/koki-nakamura22/env-for-blog/commit/0dc7d79a89fc2b59275b76adca7b3009e09e060c" target="_blank">add robots.txt</a></font>  


## Reference articles
<font color="#1111cc"><a href="https://gohugo.io/templates/robots/" target="_blank">Hugo: Robots.txt File</a></font>  
