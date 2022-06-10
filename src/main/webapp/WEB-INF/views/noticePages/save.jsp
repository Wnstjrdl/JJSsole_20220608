<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: 오후 3:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>save.jsp</h2>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<div class="container">

    <form action="/notice/save" method="post" enctype="multipart/form-data">
        <input class="form-control mb-2" type="text" name="noticeTitle" placeholder="공지사항">
        <input class="form-control mb-2" type="text" name="noticeWriter" value="${loginMemberId}"  placeholder="작성자" readonly>
        <textarea class="form-control" name="noticeContents" rows="5" cols="10"></textarea>
        첨부파일<input type="file" name="noticeFile">
        <input class="btn btn-primary" type="submit" value="전송">

    </form>

</div>
</body>
</html>
