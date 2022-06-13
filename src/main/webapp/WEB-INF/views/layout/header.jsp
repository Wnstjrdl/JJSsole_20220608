
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-09
  Time: 오후 1:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
    <header class="p-3 bg-info text-white ">
        <div class="container">
            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><button class="btn btn-warning" onclick="location.href='/'">초기화면으로 돌아가기</button></li>
                <c:if test="${sessionScope.loginMemberId != null}">
                <li><button class="btn btn-warning" onclick="location.href='/board/save'">글작성</button></li>
                </c:if>
                <li><button class="btn btn-warning" onclick="location.href='/notice/paging'">공지사항</button></li>
           <c:if test="${sessionScope.loginMemberId eq 'admin'}">
                    <li><button class="btn btn-warning" onclick="location.href='/notice/save'">공지작성</button></li>
           </c:if>

            </ul>

        </div>
    </header>


</body>
</html>
