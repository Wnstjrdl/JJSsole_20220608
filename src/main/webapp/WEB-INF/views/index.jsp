<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: 오전 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<html>
<head>

</head>
<script>
    const saveForm = () => {
        location.href="/member/save";
    }
    const loginForm = () => {
        location.href="/member/login";
    }
</script>
<body class="  text-white bg-primary">


 <h2> index.jsp</h2>

    <button class="btn btn-warning py-1 px-0" onclick="saveForm()">회원가입</button>
    <button class="btn btn-warning py-1 px-0" onclick="loginForm()">로그인</button>

</body>


</html>
