<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: 오전 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <h2>로그인</h2>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
    body {

    background-color: #f5f5f5;
    }



    </style>
</head>
<body class="py-5 text-center">
        <form class="py-5" action="/member/login" method="post"  >
            <input  class=" form-floating "  type="text" name="memberId" placeholder="아이디를 입력하세요"><br />

            <input  class="form-floating "  type="text" name="memberPassword" placeholder="비밀번호를 입력하세요"><br />
            <br/>
            <input   class=" btn btn-primary" type="submit" value="로그인">
        </form>


</body>
</html>
