
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: 오전 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    const paging = () => {
      location.href="/board/paging"
    }
    const admin = () => {
      location.href="/member/admin"
    }
    const gallery = () => {
      location.href="/board/gallery"
    }

</script>
<body class="  text-white bg-primary">

<header>
 <h1>메인 화면</h1>
 <nav>
  <ul>
   <button class="btn btn-warning  "  onclick="saveForm()" >회원가입</button>
   <button class="btn btn-warning   " onclick="loginForm()">로그인</button>
   <button class="btn btn-warning   " onclick="paging()">게시판</button>
   <button class="btn btn-warning  " onclick="gallery()">포토게시판으로</button>

   <c:if test="${sessionScope.loginMemberId eq 'admin'}">
   <button class="btn btn-danger   " onclick="admin()">관리자 페이지로이동</button>
   </c:if>
  </ul>
 </nav>
 <form action="/board/search" method="get" class="d-flex" role="search">
  <select name="searchType">
   <option value="boardTitle">제목</option>
   <option value="boardWriter">작성자</option>
  </select>
  <input class="form-control me-2" name="q" type="search" placeholder="Search" aria-label="Search">
  <button class="btn btn-outline-success" type="submit">Search</button><br />


 </form>
</header>




</body>


</html>
