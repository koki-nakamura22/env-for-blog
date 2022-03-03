+++
author = "Koki"
categories = ["Android", "Windows"]
date = 2022-03-03T20:49:15+09:00
description = "この記事では、Google Play ストアからダウンロードしたAndroidアプリのログを取得する方法について説明します。"
images = [""]
linktitle = ""
title = "Google Play ストアからダウンロードしたAndroidアプリのログを取得 (Windows使用)"
type = "post"

+++
この記事では、Google Play ストアからダウンロードしたAndroidアプリのログを取得する方法について説明します。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[ログを取得できるようにするための準備を行う](#%E3%83%AD%E3%82%B0%E3%82%92%E5%8F%96%E5%BE%97%E3%81%A7%E3%81%8D%E3%82%8B%E3%82%88%E3%81%86%E3%81%AB%E3%81%99%E3%82%8B%E3%81%9F%E3%82%81%E3%81%AE%E6%BA%96%E5%82%99%E3%82%92%E8%A1%8C%E3%81%86)</font>
  - <font color="#1111cc">[AndroidデバイスのUSBデバッグを有効にする](#android%E3%83%87%E3%83%90%E3%82%A4%E3%82%B9%E3%81%AEusb%E3%83%87%E3%83%90%E3%83%83%E3%82%B0%E3%82%92%E6%9C%89%E5%8A%B9%E3%81%AB%E3%81%99%E3%82%8B)</font>
  - <font color="#1111cc">[Android Debug Bridge (ADB) をダウンロードし使用可能な状態にする](#android-debug-bridge-adb-%E3%82%92%E3%83%80%E3%82%A6%E3%83%B3%E3%83%AD%E3%83%BC%E3%83%89%E3%81%97%E4%BD%BF%E7%94%A8%E5%8F%AF%E8%83%BD%E3%81%AA%E7%8A%B6%E6%85%8B%E3%81%AB%E3%81%99%E3%82%8B)</font>
- <font color="#1111cc">[ログを取得する](#%E3%83%AD%E3%82%B0%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B)</font>
- <font color="#1111cc">[注意点](#%E6%B3%A8%E6%84%8F%E7%82%B9)</font>
- <font color="#1111cc">[そもそも、何故こんなことをしようと思ったのかの経緯 (余談)](#%E3%81%9D%E3%82%82%E3%81%9D%E3%82%82%E4%BD%95%E6%95%85%E3%81%93%E3%82%93%E3%81%AA%E3%81%93%E3%81%A8%E3%82%92%E3%81%97%E3%82%88%E3%81%86%E3%81%A8%E6%80%9D%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%8B%E3%81%AE%E7%B5%8C%E7%B7%AF-%E4%BD%99%E8%AB%87)</font>
- <font color="#1111cc">[参考にしたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%97%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者
- 何かしらの理由でGoogle Play ストアからダウンロードしたアプリのログを取得したい方


## 環境
- Pixel 6 (Android 12, Build. SQ1D.220205.004)
- Windows 10 (Ver. 21H2, Build. 19044.1526)


## 前提条件
なし


## ログを取得できるようにするための準備を行う

### AndroidデバイスのUSBデバッグを有効にする
1. [設定] > [デバイス情報]に移動し、一番下にある **ビルド番号** を開発者向けオプションがオンになるまで連打する。
2. [設定] > [システム] > [開発者向けオプション]に移動し、 **USB デバッグ** をオンにする。

### Android Debug Bridge (ADB) をダウンロードし使用可能な状態にする
1. <font color="#1111cc"><a href="https://developer.android.com/studio/releases/platform-tools" target="_blank">SDK Platform-Tools リリースノート</a></font> の  **SDK Platform-Tools for Windows をダウンロード** をクリックする。
2. 表示される利用規約に同意した後に **ダウンロードする: Android SDK Platform-Tools (Windows用)** をクリックし、任意の場所にzipファイルをダウンロードする。
3. 2でダウンロードしたzipファイルを解凍する。
4. コマンドプロンプトを開き、3で解凍してできたフォルダ内のplatform-toolsフォルダへ移動する。
5.  *adb devices* を実行し、以下の内容が表示され正常に動作していることを確認する。 
```cmd
* daemon not running; starting now at tcp:5037
* daemon started successfully
List of devices attached
```

## ログを取得する
1. Windows PCとAndroidスマホをUSB Type-Cケーブルなどで接続する。
2. Windows PC側でコマンドプロンプトから **"Android Debug Bridge (ADB) をダウンロードし使用可能な状態にする"の4と5** を実行し、何かしらのデバイス情報が表示されることを確認しておく。
3. 続けて *adb logcat \*:#* を実行し、コマンドプロンプト上でログがリアルタイムで流れることを確認する。  
上記の *#* は、以下のいずれかを指定する。

|  値  |  説明  |
| ---- | :-- |
| V | Verbose (すべてのログ、デフォルト値) |
| D | Debug (デバッグログ) |
| I | Info (情報ログ) |
| W | Warn (エラーレベルではない警告ログ) |
| E | Error (致命的ではないエラーのログ) |
| F | Fatal (致命的なエラーのログ) |  

ここでもしログが流れなかったら、Androidスマホ側で **USB デバッグを許可しますか？** というダイアログが表示されていないか確認し、表示されていたら右下の **許可** をタップする。

## 注意点
Android側でUSB デバッグをオンにしっぱなしにしていると、アプリによっては正常に動作しないことがあるのでログ取得が終わったらオフにした方がいいです。


## そもそも、何故こんなことをしようと思ったのかの経緯 (余談)
購入した有料アプリがPixel 6で起動時に勝手に終了される問題について、リリース元にこちらの環境情報とセットで問い合わせた結果
- 「こちらの同じ環境では再現しない。」「原因がわからず対応できない。」と回答がきた。
- 正常に動作しているエビデンスが欲しいと問い合わせてもスルーされた。


といったところから、「これ、Pixel 6もしくはOS依存の問題に思えるけど、ちゃんと調査していないのでは？」と疑い始めたのがキッカケです。  
ちなみに実際にログを確認したところ、アプリ起動時のファイルアクセスに失敗しFatal errorを吐いてアプリが落ちていました。

## 参考にしたページ
<font color="#1111cc"><a href="https://kb.vmware.com/s/article/2960948?lang=ja" target="_blank">Collecting Logs from Android Devices (2960948)</a></font>
