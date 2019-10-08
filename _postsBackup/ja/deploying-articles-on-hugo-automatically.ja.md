+++
author = "Koki"
categories = ["Hugo"]
date = 2019-10-08T22:33:13+11:00
description = "Hugoブログの記事を自動デプロイする方法について説明します"
images = [""]
linktitle = ""
title = "Hugoブログの記事を自動デプロイする方法"
type = "post"

+++
この記事では、Hugoブログの記事を自動デプロイする方法を説明します。

この記事の内容です。

- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[自動デプロイの仕組みを作る](#%E8%87%AA%E5%8B%95%E3%83%87%E3%83%97%E3%83%AD%E3%82%A4%E3%81%AE%E4%BB%95%E7%B5%84%E3%81%BF%E3%82%92%E4%BD%9C%E3%82%8B)</font>
  - <font color="#1111cc">[batファイルを作成](#bat%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92%E4%BD%9C%E6%88%90)</font>
  - <font color="#1111cc">[PowerShellスクリプトファイルを作成](#powershell%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%97%E3%83%88%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92%E4%BD%9C%E6%88%90)</font>
  - <font color="#1111cc">[スクリプトファイルの使い方](#%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%97%E3%83%88%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%81%AE%E4%BD%BF%E3%81%84%E6%96%B9)</font>

<br>
---

# 対象読者
- Hugoでブログを作成しておりかつ自動でデプロイしたい方

<br>
---

# 環境
- Windows 10 (1903)
- Command Prompt
- Power Shell (5.1.18362.145)
- Hugo (0.57.2)
- Hugo-extended (0.58.2)

<br>
---

# 前提条件
- GitHub上でHugoのブログ記事を管理している
- GitHub上のブログリポジトリを"public"ディレクトリとしてクローン済

<br>
---

# 自動デプロイの仕組みを作る
スクリプトファイルを作成し、それを実行することで自動デプロイを行います。  
今回はbatファイルとPowerShellのスクリプトファイルの両方を使います。  
batファイルを使用する理由は、PowerShellスクリプトファイルを実行するのが楽になるからです。

## batファイルを作成
"deploy.bat"というファイルをブログのルートディレクトリに作成し、下記のコードをペーストします。
```bat
powershell -NoProfile -ExecutionPolicy Unrestricted .\deploy.ps1
```

## PowerShellスクリプトファイルを作成
"deploy.ps1"というファイルをブログのルートディレクトリに作成し、下記のコードをペーストします。
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

## スクリプトファイルの使い方
"deploy.bat"を実行するだけです。
<br>
---
Hugoのブログ記事を自動デプロイする仕組みについては以上です。  
良いブログライフを！
