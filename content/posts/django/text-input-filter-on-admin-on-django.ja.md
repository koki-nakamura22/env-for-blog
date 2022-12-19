+++
author = "Koki"
categories = ["Django"]
tags = ["Django"]
date = 2022-12-19T20:54:54+09:00
linktitle = ""
title = "DjangoのAdmin内リストページで入力テキストでデータを絞るフィルターを実装する"
description = ""
type = "post"
+++

この記事では、DjangoのAdmin内リストページで入力テキストでデータを絞るフィルターを実装する方法を説明します。

この記事の内容です。
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[対象読者](#%E5%AF%BE%E8%B1%A1%E8%AA%AD%E8%80%85)</font>
- <font color="#1111cc">[環境](#%E7%92%B0%E5%A2%83)</font>
- <font color="#1111cc">[前提条件](#%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6)</font>
- <font color="#1111cc">[何故、参考にしたページの内容ではダメだったのか？](#%E4%BD%95%E6%95%85%E5%8F%82%E8%80%83%E3%81%AB%E3%81%97%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8%E3%81%AE%E5%86%85%E5%AE%B9%E3%81%A7%E3%81%AF%E3%83%80%E3%83%A1%E3%81%A0%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%8B)</font>
- <font color="#1111cc">[DjangoのAdmin内リストページで入力テキストでデータを絞るフィルターを実装](#django%E3%81%AEadmin%E5%86%85%E3%83%AA%E3%82%B9%E3%83%88%E3%83%9A%E3%83%BC%E3%82%B8%E3%81%A7%E5%85%A5%E5%8A%9B%E3%83%86%E3%82%AD%E3%82%B9%E3%83%88%E3%81%A7%E3%83%87%E3%83%BC%E3%82%BF%E3%82%92%E7%B5%9E%E3%82%8B%E3%83%95%E3%82%A3%E3%83%AB%E3%82%BF%E3%83%BC%E3%82%92%E5%AE%9F%E8%A3%85)</font>
  - <font color="#1111cc">[1. Admin内リストページのテンプレート作成](#1-admin%E5%86%85%E3%83%AA%E3%82%B9%E3%83%88%E3%83%9A%E3%83%BC%E3%82%B8%E3%81%AE%E3%83%86%E3%83%B3%E3%83%97%E3%83%AC%E3%83%BC%E3%83%88%E4%BD%9C%E6%88%90)</font>
  - <font color="#1111cc">[2. Filterで使用するテンプレート作成](#2-filter%E3%81%A7%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%E3%83%86%E3%83%B3%E3%83%97%E3%83%AC%E3%83%BC%E3%83%88%E4%BD%9C%E6%88%90)</font>
  - <font color="#1111cc">[3. フィルタークラス作成](#3-%E3%83%95%E3%82%A3%E3%83%AB%E3%82%BF%E3%83%BC%E3%82%AF%E3%83%A9%E3%82%B9%E4%BD%9C%E6%88%90)</font>
  - <font color="#1111cc">[4. Adminに対しフィルター適用](#4-admin%E3%81%AB%E5%AF%BE%E3%81%97%E3%83%95%E3%82%A3%E3%83%AB%E3%82%BF%E3%83%BC%E9%81%A9%E7%94%A8)</font>
- <font color="#1111cc">[参考にしたページ](#%E5%8F%82%E8%80%83%E3%81%AB%E3%81%97%E3%81%9F%E3%83%9A%E3%83%BC%E3%82%B8)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## 対象読者

- DjangoのAdmin内リストページで入力テキストでデータを絞るフィルターが必要な方


## 環境

- Django (version 3.2.16)


## 前提条件

なし


## 何故、参考にしたページの内容ではダメだったのか？

参考にしたページの内容だと動作が以下の通りだった。
1. 複数項目を並べても単一項目でしかデータを絞り込めなかった。
2. 1の動作のためか、複数項目入力すると最後に入力したデータのみしか復元されなかった。
3. フィルタリングを行うにはテキストボックスでEnterを押すしかなく、普段からPC操作に慣れていないユーザにはフレンドリーではないと感じたため。

上記から、それらの問題を解決するために参考にしたページで紹介されていたコードを改造し独自のフィルターを実装した。

## DjangoのAdmin内リストページで入力テキストでデータを絞るフィルターを実装

### 1. Admin内リストページのテンプレート作成

今回は複数条件を元にANDでフィルタリングを行いたかったため、全項目をformタグで囲っている。  
また、各項目の横に [適用] ボタンを配置するとくどいと感じたため、フィルターリストの一番上と一番下に [適用] ボタンを配置し、それをクリックすることで入力されたテキストを元にフィルタリングを行うようにしている。  
勿論、テキストボックスで入力をした後にEnterを押してもformのsubmit処理が走るため、フィルタリングが行われる。

```html:testapp_hoge_change_list.html
{% extends "admin/base_site.html" %}
{% load i18n admin_urls static admin_list %}

{% block extrastyle %}
  {{ block.super }}
  <link rel="stylesheet" type="text/css" href="{% static "admin/css/changelists.css" %}">
  {% if cl.formset %}
    <link rel="stylesheet" type="text/css" href="{% static "admin/css/forms.css" %}">
  {% endif %}
  {% if cl.formset or action_form %}
    <script src="{% url 'admin:jsi18n' %}"></script>
  {% endif %}
  {{ media.css }}
  {% if not actions_on_top and not actions_on_bottom %}
    <style>
      #changelist table thead th:first-child {width: inherit}
    </style>
  {% endif %}
{% endblock %}

{% block extrahead %}
{{ block.super }}
{{ media.js }}
{% endblock %}

{% block bodyclass %}{{ block.super }} app-{{ opts.app_label }} model-{{ opts.model_name }} change-list{% endblock %}

{% if not is_popup %}
{% block breadcrumbs %}
<div class="breadcrumbs">
<a href="{% url 'admin:index' %}">{% translate 'Home' %}</a>
&rsaquo; <a href="{% url 'admin:app_list' app_label=cl.opts.app_label %}">{{ cl.opts.app_config.verbose_name }}</a>
&rsaquo; {{ cl.opts.verbose_name_plural|capfirst }}
</div>
{% endblock %}
{% endif %}

{% block coltype %}{% endblock %}

{% block content %}
  <div id="content-main">
    {% block object-tools %}
        <ul class="object-tools">
          {% block object-tools-items %}
            {% change_list_object_tools %}
          {% endblock %}
        </ul>
    {% endblock %}
    {% if cl.formset and cl.formset.errors %}
        <p class="errornote">
        {% if cl.formset.total_error_count == 1 %}{% translate "Please correct the error below." %}{% else %}{% translate "Please correct the errors below." %}{% endif %}
        </p>
        {{ cl.formset.non_form_errors }}
    {% endif %}
    <div class="module{% if cl.has_filters %} filtered{% endif %}" id="changelist">
      <div class="changelist-form-container">
        {% block search %}{% search_form cl %}{% endblock %}
        {% block date_hierarchy %}{% if cl.date_hierarchy %}{% date_hierarchy cl %}{% endif %}{% endblock %}

        <form id="changelist-form" method="post"{% if cl.formset and cl.formset.is_multipart %} enctype="multipart/form-data"{% endif %} novalidate>{% csrf_token %}
        {% if cl.formset %}
          <div>{{ cl.formset.management_form }}</div>
        {% endif %}

        {% block result_list %}
          {% if action_form and actions_on_top and cl.show_admin_actions %}{% admin_actions %}{% endif %}
          {% result_list cl %}
          {% if action_form and actions_on_bottom and cl.show_admin_actions %}{% admin_actions %}{% endif %}
        {% endblock %}
        {% block pagination %}{% pagination cl %}{% endblock %}
        </form>
      </div>
      {% block filters %}
        {% if cl.has_filters %}
          <div id="changelist-filter">
            <h2>{% translate 'Filter' %}</h2>
            <form method="GET">
              <input class="btn btn-info" type="submit" value="{% trans '適用' %}">
              {% if cl.has_active_filters %}<h3 id="changelist-filter-clear">
                <a href="{{ cl.clear_all_filters_qs }}">&#10006; {% translate "Clear all filters" %}</a>
              </h3>{% endif %}
              {% for spec in cl.filter_specs %}{% admin_list_filter cl spec %}{% endfor %}
              <input class="btn btn-info" type="submit" value="{% trans '適用' %}">
            </form>
          </div>
        {% endif %}
      {% endblock %}
    </div>
  </div>
{% endblock %}
```


### 2. Filterで使用するテンプレート作成

以下のファイル名、内容でテンプレートファイルを作成する。  
既に適用済みテキストの復元も併せて対応している。

```html:templates/admin/input_filter.html
{% load i18n %}

<h3>{% blocktrans with filter_title=title %} By {{ filter_title }} {% endblocktrans %}</h3>
<ul>
    <li>
        {% with choices.0 as all_choice %}
            <input type="text" name="{{ spec.parameter_name }}" value="{{ spec.used_parameters|get_item:spec.parameter_name|default_if_none:"" }}"/>
            {% if spec.used_parameters|get_item:spec.parameter_name|default_if_none:"" %}
                <button
                    type="button"
                    class="btn btn-info clear-button button"
                    onclick="location.href='{{ all_choice.query_string }}'"
                    >
                    Clear
                </button>
            {% endif %}
        {% endwith %}
    </li>
</ul>
```

### 3. フィルタークラス作成

アプリのルートディレクトリに、以下のフィルタークラスを実装するためのファイルを作成する。

```python:filters.py
from django.contrib import admin
from django.db.models import Q
from django.template.defaulttags import register

from .models import Hoge


@register.filter
def get_item(dictionary, key):
    return dictionary.get(key)


# ベースクラス
# このクラスを元に各フォーム項目のフィルタークラスを作成する。
class InputTextFilter(admin.SimpleListFilter):
    template = 'admin/input_filter.html'

    def lookups(self, request, model_admin):
        # Dummy, required to show the filter.
        return ((),)

    def choices(self, changelist):
        query_params = changelist.get_filters_params()
        query_params.pop(self.parameter_name, None)
        all_choice = next(super().choices(changelist))
        all_choice['query_params'] = query_params
        yield all_choice

    def queryset(self, request, queryset):
        value = self.value()
        if value:
            q = Q(**{"%s__icontains" % self.parameter_name: value})
            return queryset.filter(q)


class HogeFilters:
    class NameFilter(SchoolFilters):
        parameter_name = Hoge.name.field.name
        title = Hoge.name.field.verbose_name

    # 以降、上記のNameFilterの形で対象の項目数フィルタークラスを実装する。

```

### 4. Adminに対しフィルター適用

```python:admin.py
from django.contrib import admin

from .filters import HogeFilters
from .models import Hoge


@admin.register(User)
class HogeAdmin(admin.ModelAdmin):
    change_list_template = 'testapp_hoge_change_list.html'

    # 省略

    list_filter = [
      HogeFilters.NameFilter,
      # 以降、使用するフィルターを設定する。
    ]

    # 省略
```


## 参考にしたページ

<a href="https://codelab.website/django-admin-add-text-filter/" target="_blank" rel="noopener noreferrer" style="all: unset; cursor: pointer;" >
<div style="width: 100%; max-width: 36rem; height: 9rem; border-width: 1px; border-style: solid; border-color: rgb(209, 213, 219); display: flex; background-color: rgb(255, 255, 255);" onMouseOut="this.style.background='rgb(255, 255, 255)'" onMouseOver="this.style.background='rgb(243, 244, 246)'">
  <div style="padding: 0.75rem; width: 75%; display: flex; flex-direction: column; justify-content: space-between;">
    <div>
      <div style="color: rgb(31, 41, 55); font-size: 1.0rem; line-height: 1.5rem; max-height: 3.0rem; overflow: hidden;">[Django]管理サイトに絞り込みのテキストボックスを追加する | CodeLab</div>
      <div style="font-size: 0.8rem; line-height: 1.25rem; max-height: 2.5rem; color: rgb(107, 114, 128); overflow: hidden; text-overflow: ellipsis;">Djangoの管理サイトを構築するときに「search_fields」を使用してテキストボックスで検索条件を入</div>
    </div>
    <div style="font-size: 0.75rem; line-height: 1rem; color: rgb(31, 41, 55);">codelab.website</div>
  </div>
  <div style="border-left-width: 1px; width: 25%;">
    <img src=https://codelab.website/wp-content/uploads/2020/04/django-logo-negative.png alt="No Image" style="object-fit: cover; width: 100%; height: 100%; background-color: rgb(209, 213, 219);" loading="lazy" />
  </div>
</div></a>
