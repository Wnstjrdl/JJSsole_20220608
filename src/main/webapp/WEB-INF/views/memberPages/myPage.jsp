
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

    <button class="btn btn-primary" onclick="memberUpdate()">수정</button>
    <button class="btn btn-danger" onclick="memberDelete()">회원탈퇴</button>
    <button class="btn btn-primary" onclick="back()">돌아가기</button>



</div>
</body>
<script>
    const  memberUpdate = () => {
      location.href="/member/passwordCheck?id=${member.id}";
    }

    const back = () => {
        location.href="/";

    }
    const  memberDelete = () => {
        location.href="/member/passwordCheckDelete?id=${member.id}";
    }

</script>
</html>
