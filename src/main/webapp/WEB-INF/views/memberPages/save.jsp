<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: 오전 11:43
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
    <h2 class="display-4 fw-normal">save.jsp</h2>
    <div class="py-5 text-center">

        <form action="/member/save" method="post" enctype="multipart/form-data">
            <input class="form-control mb-2" type="text"  name="memberId" placeholder="아이디">
            <input class="form-control mb-2" type="text"  name="memberPassword" placeholder="비밀번호를 입력하세요">
            <input class="form-control mb-2" type="text" name="memberName" placeholder="이름를 입력하세요">
            <input class="form-control mb-2" type="text" name="memberEmail" placeholder="이메일를 입력하세요">
            <input class="form-control mb-2" type="text"  name="memberMobile" placeholder="전화번호를 입력하세요">
            프로필사진을 등록해주세요:<input type="file" name="memberFile">
            <input class="btn btn-danger" type="submit" value="회원가입">
        </form>
    </div>
</div>
</body>

</body>
</html>
