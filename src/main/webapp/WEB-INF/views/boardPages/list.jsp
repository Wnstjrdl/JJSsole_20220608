
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-09
  Time: 오후 3:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<h2>searchList</h2>
<div class="container">
    <table class="table">
        <tr>
            <td>글번호</td>
            <td>작성자</td>
            <td>제목</td>
            <td>조회수</td>
        </tr>
        <c:forEach items="${boardList}" var="board">
            <tr>
                <td>${board.id}</td>
                <td>${board.boardWriter}</td>
                <td><a href="/board/detail?page=${paging.page}&id=${board.id}">${board.boardTitle}</a></td>
                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
                                    value="${board.boardCreatedDate}"></fmt:formatDate></td>
                <td>${board.boardHits}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>


