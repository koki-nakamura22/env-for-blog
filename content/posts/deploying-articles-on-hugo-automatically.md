+++
author = "Koki"
categories = ["Hugo"]
date = 2019-10-08T22:33:12+11:00
description = "Explain how to deploy articles on Hugo blog automatically."
images = [""]
linktitle = ""
title = "Deploying articles on Hugo blog automatically"
type = "post"

+++
This article explains how to deploy articles on Hugo blog automatically.

The following lists are the table of contents about this article.

- <font color="#1111cc">[Target audience](#target-audience)</font>
- <font color="#1111cc">[Environment](#environment)</font>
- <font color="#1111cc">[Preconditions](#preconditions)</font>
- <font color="#1111cc">[How to deploy articles automatically](#how-to-deploy-articles-automatically)</font>
  - <font color="#1111cc">[Make batch file](#make-batch-file)</font>
  - <font color="#1111cc">[Make PowerShell script file](#make-powershell-script-file)</font>
  - <font color="#1111cc">[How to use script files](#how-to-use-script-files)</font>


## Target audience
- Those who want to deploy articles automatically.


## Environment
- Windows 10 (1903)
- Command Prompt
- Power Shell (5.1.18362.145)
- Hugo (0.57.2)
- Hugo-extended (0.58.2)


## Preconditions
- Manage blog posts on GitHub.
- Cloned Hugo blog repository as "public" directory.


## How to deploy articles automatically
Make script files, then execute it.  
In this case, use batch file and Powershell script file because use batch file is easier to execute PowerShell script file.

### Make batch file
Make "deploy.bat" file in blog root directory and copy and paste the following codes to it.
```bat
powershell -NoProfile -ExecutionPolicy Unrestricted .\deploy.ps1
```

### Make PowerShell script file
Make "deploy.ps1" file in blog root directory and copy and paste the following codes to it.
```powershell
# Build the project.
hugo

# Go to public directory.
Set-Location .\public

# Add changes to git.
git add .

# Create a commit message.
$dateTime = Get-Date -format "yyyy-MM-dd HH:mm:ss K"
$commitMsg = "Site updated: ${dateTime}"

# Commit.
git commit -m $commitMsg

# Push source and build repos.
git push origin master

# Come back to the project root.
Set-Location .\..

Write-Host "The web page has been updated!" -ForegroundColor "Cyan"
```

### How to use script files
Execute "deploy.bat".  


That it! It's easy!  
Have a good blog life!!
