
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-13
  Time: 오전 8:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">

</head>
<body>
<span class='text-warning'><h2> 공지 사항</h2></span>
    <span class='text-success'>  공지글번호:${notice.id}</span><br/>
    <span class='text-success'>  작성자 :${notice.noticeWriter}</span><br/>
    <span class='text-success'>공지사항:${notice.noticeTitle}</span><br/>
    <span class='text-success'>작성시간:<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
                                                    value="${notice.noticeCreatedDate}"></fmt:formatDate></span><br/>
    <span class='text-success'>조회수${notice.noticeHits}</span>

</body>
</html>
