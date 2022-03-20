+++
author = "Koki"
categories = ["Google Drive", "Windows"]
date = 2022-02-19T19:53:40+09:00
description = "本記事では、WindowsでGoogle Driveをアンインストールする時に「Googleドライブが使用中です。終了してからアンインストールしてください」と言われた時の対処法を説明します。コマンド一発で対処する方法も載せています。"
images = [""]
linktitle = ""
title = "WindowsでGoogle Driveをアンインストールする時に「Googleドライブが使用中です。終了してからアンインストールしてください」と言われた時の対処法"
type = "post"

+++

この記事では、WindowsでGoogle Driveをアンインストールする時に「Googleドライブが使用中です。終了してからアンインストールしてください」と言われた時の対処法を説明します。

この記事の内容です。

- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[原因](#%E5%8E%9F%E5%9B%A0)</font>
- <font color="#1111cc">[Google Driveアプリを終了させる方法](#google-drive%E3%82%A2%E3%83%97%E3%83%AA%E3%82%92%E7%B5%82%E4%BA%86%E3%81%95%E3%81%9B%E3%82%8B%E6%96%B9%E6%B3%95)</font>
  - <font color="#1111cc">[手動で行う方法](#%E6%89%8B%E5%8B%95%E3%81%A7%E8%A1%8C%E3%81%86%E6%96%B9%E6%B3%95)</font>
  - <font color="#1111cc">[コマンド一発で行う方法](#%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E4%B8%80%E7%99%BA%E3%81%A7%E8%A1%8C%E3%81%86%E6%96%B9%E6%B3%95)</font>

## 対象読者

- WindowsでGoogle Driveをアンインストールする時にメッセージが表示され邪魔された方

## 環境

- Windows 10

## 前提条件

なし

## 原因

表示されるメッセージの通り、Google Driveアプリが起動されているせいです。  
~~空気を読んで、自分で自分を終了させてくれりゃいいのに。~~

## Google Driveアプリを終了させる方法
### 手動で行う方法

以下の流れで作業を行います。
1. ctrl, shift, escキーを同時押しし、タスクマネージャーを起動します。
2. 「プロセス」タブを開きます。
3. 「バックグラウンドプロセス」一覧から「Google Drive」を右クリックし、「タスクの終了」をクリックします。(表示されている複数のGoogle Driveに対して行います。)

### コマンド一発で行う方法
Windows Powershellを起動し、以下のコマンドを実行し、数秒待ちます。
```powershell
taskkill /F /IM GoogleDriveFS.exe
```

上記を行った後、Google Driveをアンインストールできるようになります。
