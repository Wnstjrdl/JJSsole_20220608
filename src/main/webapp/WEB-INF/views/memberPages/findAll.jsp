
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-13
  Time: 오후 1:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>findAll.jsp</h2>
<div class="container">
    <table class="table">
        <tr>
            <td>회원번호</td>
            <td>회원아이디</td>
            <td>회원비밀번호</td>
            <td>회원이름</td>
            <td>회원이메일</td>
            <td>회원전화번호</td>
        </tr>
        <c:forEach items="${memberList}" var="member">
            <tr>
                <td>${member.id}</td>
                <td>${member.memberId}</td>
                <td>${member.memberPassword}</td>
                <td>${member.memberName}</td>
                <td>${member.memberEmail}</td>
                <td>${member.memberMobile}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>