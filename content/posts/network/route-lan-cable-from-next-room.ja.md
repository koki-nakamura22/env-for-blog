+++
author = "Koki"
categories = ["Network"]
tags = ["Network"]
date = 2022-06-23T15:12:24+09:00
linktitle = ""
title = "隣の部屋のモデムからドアや引き戸を超えてLANケーブルを引っ張る方法を考えてみた"
description = "この記事では、隣の部屋のモデムからドアや引き戸を超えてLANケーブルを引っ張る方法を考えてみた結果を書いています。"
type = "post"
+++
この記事では、隣の部屋のモデムからドアや引き戸を超えてLANケーブルを引っ張る方法を考えてみた結果を書いています。  
ネット回線を契約したのはいいものの、ネット接続をメインで使用する部屋に直接ネット回線をひけなかった結果、有線環境を構築できていない方向けです。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[必要なもの](#%E5%BF%85%E8%A6%81%E3%81%AA%E3%82%82%E3%81%AE)</font>
- <font color="#1111cc">[配線](#%E9%85%8D%E7%B7%9A)</font>
- <font color="#1111cc">[LANケーブルのカテゴリ互換性の壁](#lan%E3%82%B1%E3%83%BC%E3%83%96%E3%83%AB%E3%81%AE%E3%82%AB%E3%83%86%E3%82%B4%E3%83%AA%E4%BA%92%E6%8F%9B%E6%80%A7%E3%81%AE%E5%A3%81)</font>
- <font color="#1111cc">[もし引き戸やドアの下などに広めのすき間がある場合](#%E3%82%82%E3%81%97%E5%BC%95%E3%81%8D%E6%88%B8%E3%82%84%E3%83%89%E3%82%A2%E3%81%AE%E4%B8%8B%E3%81%AA%E3%81%A9%E3%81%AB%E5%BA%83%E3%82%81%E3%81%AE%E3%81%99%E3%81%8D%E9%96%93%E3%81%8C%E3%81%82%E3%82%8B%E5%A0%B4%E5%90%88)</font>
- <font color="#1111cc">[今回考えてみて](#%E4%BB%8A%E5%9B%9E%E8%80%83%E3%81%88%E3%81%A6%E3%81%BF%E3%81%A6)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## 前提条件
- 隣室のモデムから自室のルータまでの配線を想定
- LANケーブルのカテゴリは6を想定  
(今契約しているネット回線の速度上限が1Gbpsな関係でカテゴリ6で充分なため。)


## 必要なもの
- 適当なカテゴリ6のLANケーブル  
まずは何はともあれLANケーブル。  
LANケーブルはカテゴリさえ合っていれば、ここらへんの安いのを適当に買ってしまっていいと思います。  
本数は2本必要です。  
<font color="#1111cc"><a href="https://www.amazon.co.jp/ELECOM-LAN%E3%82%B1%E3%83%BC%E3%83%96%E3%83%AB-LD-GPT-BU1-RS/dp/B00B5LOO96/ref=sr_1_1?__mk_ja_JP=%E3%82%AB%E3%82%BF%E3%82%AB%E3%83%8A&crid=3A7UKSGF2QOZP&keywords=LD-GPT%2FBU1%2FRS&qid=1655967052&s=electronics&sprefix=ld-gpt%2Fbu1%2Frs%2Celectronics%2C162&sr=1-1&th=1" target="_blank">エレコム LANケーブル CAT6 3m ツメが折れない 爪折れ防止コネクタ cat6対応 簡易パッケージ RoHS指令準拠 ブルー LD-GPT/BU3/RS</a></font>

- 延長コネクタ  
次に、LANケーブルの延長コネクタです。  
これは、上記のLANケーブルと、後述する隙間を通すためのすき間用LANケーブルを接続するために使用します。  
個数は2個必要です。  
<font color="#1111cc"><a href="https://www.amazon.co.jp/dp/B000I8O9EW/?coliid=IPJ4HYB8Q6ZN3&colid=1G0717BXWNOHR&ref_=lv_ov_lig_dp_it&th=1" target="_blank">エレコム CAT6中継コネクタ LD-RJ45JJ6Y2</a></font>

- すき間用LANケーブル  
最後に、ドアの下や引き戸の隙間を通すためのすき間用LANケーブルです。  
これは、個数は1個で大丈夫です。  
<font color="#1111cc"><a href="https://www.amazon.co.jp/dp/B09QW1WQR6/?coliid=I3AH461TRRDG6R&colid=1G0717BXWNOHR&ref_=lv_ov_lig_dp_it&th=1" target="_blank">エレコム LANケーブル 0.4m 隙間 CAT6A準拠 シルバー LD-VAPF6A/SV04</a></font>


## 配線
以下の流れで、モデムからルータまで接続します。  
モデム→  
LANケーブル→  
延長コネクタ→  
すき間用LANケーブル (ここで隣の部屋へ繋ぐ)→  
延長コネクタ→  
LANケーブル→  
ルータ


## LANケーブルのカテゴリ互換性の壁
ここまで読んだ方の中から、「今回、カテゴリ6と6Aのものを組み合わせて使用しているが互換性は大丈夫なの？」という心配の声があると思います。  
大丈夫です。  
エレコムに問い合わせたところ、6と6Aは互換性があり、性能が6に引っ張られるが問題なく使用することができるとのことでした。


## もし引き戸やドアの下などに広めのすき間がある場合
もし引き戸やドアの下などに広めのすき間がある場合は、今まで説明した商品などを組み合わせるのではなく、以下のようなフラットタイプのLANケーブルを1本長いのを購入し、直接モデムとルータを接続する方がいいかなと思います。  
<font color="#1111cc"><a href="https://www.amazon.co.jp/dp/B00AXTV2P0/?coliid=IH004JWCWA4YQ&colid=1G0717BXWNOHR&ref_=lv_ov_lig_dp_it&th=1" target="_blank">サンワサプライ LANケーブル CAT6 フラットタイプ 1Gbps/250MHz ギガビット イーサネットケーブル RJ45コネクタ ツメ折れ防止 (15m) ホワイト LA-FL6-15W</a></font>


## 今回考えてみて
ここまで考えてみて、正直、無線LANで運用していて問題無ければ、無理して有線環境を構築する必要はないかなと思いました。  
というのもお金と手間が掛かりますし、何か問題が発生したら "どのケーブルで問題が発生しているのか？" という問題調査が面倒くさいですし。  
というわけで、私は問題が発生しない限りは無線LANを使用しつづけることに決めました。(これが、"実践してみた" ではなく "考えてみた" というタイトルになった理由。)
