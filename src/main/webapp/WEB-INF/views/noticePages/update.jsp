<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-13
  Time: 오전 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="display-4 fw-normal">update.jsp</h2>
    <div class="py-5 text-center">
        <form action="/notice/update" method="post"  name="updateForm">
            공지번호:<input type="text" name="id" value="${noticeUpdate.id}" class="form-control" readonly><br />
            작성자:<input type="text" name="noticeWriter" value="${noticeUpdate.noticeWriter}" class="form-control" readonly><br />
            제목:<input type="text" name="noticeTitle" value="${noticeUpdate.noticeTitle}" class="form-control"><br />
            내용:<textarea name="noticeContents" cols="70" rows="10" >${noticeUpdate.noticeContents}</textarea>

            <button class="btn btn-primary" onclick="location.href='/notice/update'">수정하기</button>
        </form>
    </div>
</div>
</body>
<script>
    const noticeUpdate = () => {
    location.href="/notice/update";
    }
</script>

</html>
