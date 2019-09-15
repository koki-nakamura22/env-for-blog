+++
author = ""
categories = [""]
date = 2019-09-15T22:39:57+10:00
description = ""
images = [""]
linktitle = ""
title = ""
type = "post"

+++

Nya-n

```csharp
public class Person {
    public string name { get; set; }

    public Person() {

    }

    private string SetName(string name) {
        this.name = name;
    }
}
```

```js
$(() => {
    console.log("Nya-n!");
})
```

```html
<html>
<head>
<title>aaa</title>
</head>
<body>
Hello nya-n!
</body>
</html>
```

```bat
@echo off

REM Build the project.
hugo

REM Go to public directory.
cd public

REM Add changes to git.
git add .

REM Create a commit message.
set d=%date%
set yyyy=%d:~-10,4%
set mm=%d:~-5,2%
set dd=%d:~-2,2%
set t=%time: =0%
set hh=%t:~0,2%
set mn=%t:~3,2%
set ss=%t:~6,2%
set commitMsg=Site updated: %yyyy%-%mm%-%dd% %hh%:%mn%:%ss%

REM Commit.
git commit -m "%commitMsg%"

REM Push source and build repos.
git push origin master

REM Come back to the project root.
cd ..

echo "The web page has been updated!"
```
