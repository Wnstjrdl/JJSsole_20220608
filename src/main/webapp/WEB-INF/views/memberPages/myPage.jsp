
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-13
  Time: 오후 1:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>

<body>
<h2>myPage.jsp</h2>
<div class="container">







   프로필사진:<img src="${pageContext.request.contextPath}/upload/${member.memberFileName}"
         alt="" height="100" width="100"><br /><br />
        회원번호: ${member.id}<br />
    회원아이디: ${member.memberId}<br />
    회원비밀번호:  ${member.memberPassword}<br />
    회원이름: ${member.memberName}<br />
    회원이메일: ${member.memberEmail}<br />
    회원전화번호:${member.memberMobile}<br />

    <a href="/member/delete?id=${member.id}">회원탈퇴</a>
    <a href="/member/update?id=${member.id}">정보수정</a>
    <a href="/" >돌아가기</a>


</div>
</body>

</html>
