+++
author = "Koki"
categories = ["Python", "Docker", "docker-compose"]
tags = ["Python", "Docker", "docker-compose"]
date = 2022-12-26T17:23:18+09:00
linktitle = ""
title = "docker-composeのbuild時、Dockerfile内のpip installでNewConnectionError Failed to establish a new connectionが発生した時の対処法"
description = "この記事では、docker-composeのbuild時、Dockerfile内のpip installでNewConnectionError Failed to establish a new connectionが発生した時の対処法方法を説明します。"
type = "post"
+++

この記事では、docker-composeのbuild時、Dockerfile内のpip installでNewConnectionError Failed to establish a new connectionが発生した時の対処法方法を説明します。


この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[NewConnectionErrorの対処法](#newconnectionerror%E3%81%AE%E5%AF%BE%E5%87%A6%E6%B3%95)</font>
- <font color="#1111cc">[参考にしたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%97%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者

- Dockerコンテナ内でpip installを実行したい方


## 環境

- Docker
- docker-compose


## 前提条件

docker-compose使用


## NewConnectionErrorの対処法

docker-compose build時に

```
WARNING: Retrying (Retry(total=4, connect=None, read=None, redirect=None, status=None)) after connection broken by 'NewConnectionError('<pip._vendor.urllib3.connection.HTTPSConnection object at 0x7f8275464590>: Failed to establish a new connection: [Errno -3] Temporary failure in name resolution')': /simple/django/
```

が発生した場合は、docker-compose.yml内のpip installを行っているコンテナ部分、buildセクションを以下の通り書き換える。  
<br>
書き換え前
```yml
# 省略
services:
  web:
    container_name: python-app-container
    build: .
# 省略
```
書き換え後
```yml
# 省略
services:
  web:
    container_name: python-app-container
    build:
      context: .
      network: host
# 省略
```

本記事のエラーは、コンテナがネットワークに接続できないのが原因で発生している。  
なので、コンテナのネットワークをホストのものを使用するように指定することでネットワークに接続できるようにしている。


## 参考にしたページ

<a href="https://stackoverflow.com/questions/47074457/how-to-specify-docker-build-network-host-mode-in-docker-compose-at-the-time" target="_blank" rel="noopener noreferrer" style="all: unset; cursor: pointer;" >
<div style="width: 100%; max-width: 36rem; height: 9rem; border-width: 1px; border-style: solid; border-color: rgb(209, 213, 219); display: flex; background-color: rgb(255, 255, 255);" onMouseOut="this.style.background='rgb(255, 255, 255)'" onMouseOver="this.style.background='rgb(243, 244, 246)'">
  <div style="padding: 0.75rem; width: 75%; display: flex; flex-direction: column; justify-content: space-between;">
    <div>
      <div style="color: rgb(31, 41, 55); font-size: 1.0rem; line-height: 1.5rem; max-height: 3.0rem; overflow: hidden;">How to Specify $docker build --network="host" mode in docker-compose at the time of build</div>
      <div style="font-size: 0.8rem; line-height: 1.25rem; max-height: 2.5rem; color: rgb(107, 114, 128); overflow: hidden; text-overflow: ellipsis;">While building docker image like docker build -t name:tag --network="host" so it will Set the networking mode for the RUN instructions during build (default "default")

So I am trying to build Docker </div>
    </div>
    <div style="font-size: 0.75rem; line-height: 1rem; color: rgb(31, 41, 55);">stackoverflow.com</div>
  </div>
  <div style="border-left-width: 1px; width: 25%;">
    <img src=https://cdn.sstatic.net/Sites/stackoverflow/Img/apple-touch-icon@2.png?v=73d79a89bded alt="No Image" style="object-fit: cover; width: 100%; height: 100%; background-color: rgb(209, 213, 219);" loading="lazy" />
  </div>
</div></a>
