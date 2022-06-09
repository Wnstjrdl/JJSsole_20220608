
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-09
  Time: 오전 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
    <h2>detail.jsp</h2>
    <img src="${pageContext.request.contextPath}/upload/${board.boardFileName}"
         alt="" height="100" width="100"><br /><br />


    글번호:${board.id}<br />
    작성자:${board.boardWriter}<br />
     제목:${board.boardTitle}<br />
     내용:${board.boardContents}<br />
    조회수:${board.boardHits}<br />
    작성시간:${board.boardCreatedDate}<br />




</body>
<c:if test="${sessionScope.loginMemberId eq board.boardWriter}">
  <button class="btn btn-danger" onclick="location.href='/board/delete?id=${board.id}'">삭제</button>
    <button class="btn btn-danger" onclick="location.href='/board/update?id=${board.id}'">수정</button>

</c:if>

</html>