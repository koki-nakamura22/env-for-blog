+++
author = "Koki"
categories = ["Django"]
tags = ["Django"]
date = 2023-09-03T17:54:18+09:00
linktitle = ""
title = "CSRF Token Authentication in Django REST framework"
description = "A guide on how to implement CSRF token authentication in Web APIs using Django REST framework."
type = "post"
+++
This article explains how to implement CSRF token authentication in Web APIs using Django REST framework..

The following lists are the table of contents about this article.
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- <font color="#1111cc">[Target Audience](#target-audience)</font>
- <font color="#1111cc">[Environment](#environment)</font>
- <font color="#1111cc">[Prerequisites](#prerequisites)</font>
- <font color="#1111cc">[How to Implement CSRF Token Authentication](#how-to-implement-csrf-token-authentication)</font>
  - <font color="#1111cc">[Why Implement CSRF Token Authentication?](#why-implement-csrf-token-authentication)</font>
  - <font color="#1111cc">[Implementing an API to Return CSRF Tokens](#implementing-an-api-to-return-csrf-tokens)</font>
  - <font color="#1111cc">[Creating the Authentication Class](#creating-the-authentication-class)</font>
  - <font color="#1111cc">[Setting APIView](#setting-apiview)</font>
  - <font color="#1111cc">[Points to Note for Testing](#points-to-note-for-testing)</font>

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## Target Audience
- Those developing REST APIs using Django REST framework.
- Individuals interested in mechanisms to prevent data tampering.
- Those with basic knowledge of CSRF token authentication.

## Environment
Here is the environment in which the author confirmed the operation:
- Python 3.11
- Django 4.2.2
- Django REST framework 3.14.0

## Prerequisites
- Django and Django REST framework should be installed.
- A Django project should already be set up.
- Familiarity with the basic concepts of REST APIs.

## How to Implement CSRF Token Authentication

### Why Implement CSRF Token Authentication?
Even in REST API development, there may be a need to introduce mechanisms to prevent tampering of form submission data.  
By implementing CSRF token authentication, you can include the CSRF token in the header when sending requests such as POST, PUT, PATCH, and DELETE to the server.  
This allows you to verify and detect/block tampered form submission data.  
However, note that this goes against the best practices of REST APIs, which prohibit maintaining state.

### Implementing an API to Return CSRF Tokens

First, we need to implement an API that issues and returns a CSRF token.  
Implement the following code in the file where you're building your Web API, and register it in `urls.py` to make it externally accessible.  
In this case, we'll create an `apis.py` file under the directory where `models.py` and `views.py` are located.

```python
from typing import Self
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.views import APIView

class CSRFTokens(APIView):
    def get(self: Self, request: Request) -> Response:
        return Response({"token": get_token(request)})
```

### Creating the Authentication Class

Next, we'll implement the code for CSRF token authentication.  
Create an authentications.py file under the directory where models.py and views.py are located and add the following code.

```python
from rest_framework.authentication import SessionAuthentication

class CSRFOnlySessionAuthentication(SessionAuthentication):
    def authenticate(self, request):
        self.enforce_csrf(request)
        return None
```

### Setting APIView

Then, setting the authentication class you've created in your APIView. Below is a sample code:

```python
from rest_framework.views import APIView
from .authentications import CSRFOnlySessionAuthentication

class SampleResources(APIView):
    authentication_classes = [CSRFOnlySessionAuthentication]

    # Other methods such as  get or post
```

### Points to Note for Testing

When testing this authentication method in test code, if you don't pass enforce_csrf_checks=True when initializing the APIClient, CSRF token authentication will be ignored. If you're testing for the presence or verification of the CSRF token, always initialize the APIClient with the parameter enforce_csrf_checks=True as shown below:

```python
from rest_framework.test import APIClient

client = APIClient(enforce_csrf_checks=True)
```
