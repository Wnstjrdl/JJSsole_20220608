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
<style>
 h1 {
  display: inline-block;
 }

 nav {
  display: inline-block;
 }
 nav{
  float: right;
 }
</style>
<script>
    const saveForm = () => {
        location.href="/member/save";
    }
    const loginForm = () => {
        location.href="/member/login";
    }
</script>
<body class="  text-white bg-primary">

<header>
 <h1>index</h1>
 <nav>
  <ul>
   <button class="btn btn-warning  "  onclick="saveForm()" >회원가입</button>
   <button class="btn btn-warning   " onclick="loginForm()">로그인</button>
  </ul>
 </nav>
 <form class="d-flex" role="search">
  <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
  <button class="btn btn-outline-success" type="submit">Search</button>
  <a href="/board/save">ㄴㄴ</a>
 </form>
</header>

</body>


</html>
