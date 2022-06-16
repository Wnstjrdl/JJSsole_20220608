<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: 오전 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.98.0">
    <title>Signin Template · Bootstrap v5.2</title>

    <link rel="canonical" href="/resources/css/bootstrap.min.css/https://getbootstrap.com/docs/5.2/examples/sign-in/">





    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">

    <style>
        body {
            height: 100%;
        }

        body {
            display: flex;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            max-width: 330px;
            padding: 15px;
        }

        .form-signin .form-floating:focus-within {
            z-index: 2;
        }

        .form-signin input[type="text"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        .form-signin input[type="text"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }

    </style>


    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">
</head>
<body class="text-center">

<main class="form-signin w-100 m-auto">
    <form class="py-5" action="/member/login" method="post"  >
        <img class="mb-4" src="https://w1.pngwing.com/pngs/616/690/png-transparent-black-circle-user-user-profile-computer-software-login-user-space-black-and-white.png" alt="" width="72" height="57">
        <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

        <div class="form-floating">
            <input type="text" class="form-control" name="memberId" id="memberId" placeholder="아이디를입력하세요">
            <label for="memberId">아이디를입력하세요</label>
        </div>
        <div class="form-floating">
            <input type="text" class="form-control" name="memberPassword" id="memberPassword" placeholder="Password">
            <label for="memberPassword">비밀번호를 입력하세요</label>
        </div>

        <div class="checkbox mb-3">

        </div>
        <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
        <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
    </form>
</main>



</body>
</html>
