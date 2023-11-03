+++
author = "Koki"
categories = ["Django"]
tags = ["Django", "Python"]
date = 2023-11-03T20:54:42+09:00
linktitle = ""
title = "Djangoで大量データをループでテストする"
description = ""
type = "post"
draft = true
+++
このページでは、Djangoで大量データをループでテストする方法を説明します。

## TL;DR

[大量データをループでテスト](#大量データをループでテスト)のコードをコピペし、状況に合わせて手を入れてお使いください。

## 何が嬉しいのか

例えば、チケット価格で11枚目以降は以下のように謎の値引きが行われることがあるとします。
11枚目: 9500円
12枚目: 9300円
13枚目: 9200円
14枚目: 9000円
15枚目: 8700円
...以降、1枚ずつの値段設定が続く

このテストコードを真面目に書くと、以下のように似通ったコードをひたすら書くことになり、可読性が悪くなります。
保守性も悪くなり、手を入れる際に事故が発生しやすくもなります。
```python
from app.services.ticket_fee_calc_service import TicketFeeCalcService
from django.test import TestCase

class Test(TestCase):
    def test_ticket_price_calc_11(self):
        service = TicketFeeCalcService()
	self.assertEqual(service.calc(11), 9500)

    def test_ticket_price_calc_12(self):
        service = TicketFeeCalcService()
	self.assertEqual(service.calc(12), 9300)
	
    def test_ticket_price_calc_13(self):
        service = TicketFeeCalcService()
	self.assertEqual(service.calc(13), 9200)
# 以降、似たコードがひたすら続く
```

その時、dictやlistを元に1つのテストケース内で完結できれば、わかりやすくなります。

## 大量データをループでテスト

では、本題のデータを元に1つのテストケース内で簡潔させるにはどうしたらよいか？についてです。
コードは以下のようになります。

```python
# チケット料金を計算するためのクラス
from app.services.ticket_fee_calc_service import TicketFeeCalcService
from django.test import TestCase

# データ部分
ticket_prices = {
    11: 9500,
    12: 9300,
    13: 9200,
    14: 9000,
    15: 8700,
    # 以降、テストデータが続く
}

# テスト部分
class Test(TestCase):
    def test_ticket_fees_calc(self):
        service = TicketFeeCalcService()
	failures = list()
        for number_of_tickets, expected_price in ticket_prices.items():
	    calculated_price = service.calc(number_of_tickets)
	    try:
	        self.assertEqual(calculated_price, expected_price)
	    except AssertionError as e:
	        failures.append(
                    (f"チケット枚数: {number_of_tickets}", str(e))
		)
        if 0 < len(failures):
            error_messages = [
                f"Data: {data}, Error: {error}" for data, error in failures]
            combined_message = "\n" + "\n".join(error_messages)
            self.fail(combined_message)
```

内容は、データをループで回しつつテストを行い、テスト結果がNGだったものをfailuresにため、最後にfailuresが空で無ければ内容を一気に出力しテストを失敗させます。
failuresが空であれば、テストは成功します。

こうすることで、保守で金額を変更したりチケットが10枚の時など新たなパターンを入れる時に、テストケースではなくデータにフォーカスすることでミスが発生する確率を低くし、かつすぐ対応できるようになります。

## 最後に
本記事ではdictを使用したケースだけ記述していますが、ExcelやCSVを読み込んで一気にテストを行うのもアリだと思います。
特にお客さんから
「現状はExcelやGoogle Spreadsheetで大量に対応しているので、それらが答えです！システムの計算結果がExcelやGoogle Spreadsheetと同じ結果になるようにお願いします！」
という話を聞くこともあると思うので、そういった時に本記事の内容が猛威をふるうと思います。

また、本記事ではDjangoでの話をしていますが、素のPythonやDjango REST Frameworkにも応用できると思います。
