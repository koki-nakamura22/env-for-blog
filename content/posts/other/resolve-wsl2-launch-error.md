+++
author = "Koki"
categories = ["WSL"]
tags = ["WSL"]
date = 2023-08-27T13:55:30+09:00
linktitle = ""
title = "What to do when an error message is displayed when launching WSL2 Ubuntu and it cannot be started"
description = "When installing Ubuntu for WSL2 through the Microsoft Store, you might encounter error messages upon startup. This article explains how to solve such issues."
type = "post"
+++
When you install Ubuntu for WSL2 via the Microsoft Store, there's a chance you might face error messages upon launch. This article provides guidance on how to address these issues.

Table of Contents here.
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[Target Audience](#target-audience)</font>
- <font color="#1111cc">[Environment](#environment)</font>
- <font color="#1111cc">[Prerequisites](#prerequisites)</font>
- <font color="#1111cc">[Issues with Microsoft Store Installation](#issues-with-microsoft-store-installation)</font>
- <font color="#1111cc">[How to Resolve the Issue](#how-to-resolve-the-issue)</font>
  - <font color="#1111cc">[1. Uninstalling Ubuntu on WSL2](#1-uninstalling-ubuntu-on-wsl2)</font>
  - <font color="#1111cc">[2. Installing Ubuntu on WSL2 via Command Line](#2-installing-ubuntu-on-wsl2-via-command-line)</font>
  - <font color="#1111cc">[Side Note: Checking Available Distributions](#side-note-checking-available-distributions)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## Target Audience
- Those encountering error messages when starting WSL2 Ubuntu

## Environment
- Windows 10 or newer versions
- A setup where WSL2 can be utilized

## Prerequisites
- Activation of the Windows Subsystem for Linux (WSL)


## Issues with Microsoft Store Installation

Upon installing Ubuntu for WSL2 via the Microsoft Store, you might see the following error messages, and Ubuntu on WSL2 might fail to start:  
```sh
Command not found.
Command not found.
Command not found.
Please press any key...
```

It appears that these issues can arise when installing through the store.  
Let's proceed to the next section to resolve this problem.  

## How to Resolve the Issue

### 1. Uninstalling Ubuntu on WSL2

First, uninstall Ubuntu on WSL2.  
You can do this either through command-line or via Settings → Apps → Installed Apps.  

### 2. Installing Ubuntu on WSL2 via Command Line

Use the command below to install Ubuntu on WSL2.  
In this example, we're installing Ubuntu 22.04.  

```sh
wsl --install -d Ubuntu-22.04
```

### Side Note: Checking Available Distributions

If you wish to see a list of available distributions, execute the following command:  

```sh
wsl --list --online
```
From the displayed NAME column, specify the name of the distribution you want after the -d flag to install it.
