<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-13
  Time: 오후 3:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <h2>passwordCheck.jsp</h2>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<form action="/member/delete" method="get">
    <label for="passwordConfirm">비밀번호를 입력해주세요</label>
    <input type="text" id="passwordConfirm"><br />
    <input class="btn btn-danger" type="button" onclick="passwordCheckDelete()" value="확인">
</form>
</body>
<script>
    const passwordCheckDelete = () => {
        const  passwordConfirm=document.getElementById("passwordConfirm").value;
        const  passwordDB='${member.memberPassword}';
        if(passwordConfirm == passwordDB){
            alert("삭제가완료되었습니다")
            location.href="/member/delete?id=${member.id}";
        }else {
            alert("비밀번호가 일치하지않습니다")
            location.href="/member/detail?id=${member.id}";
        }


    }



</script>
</html>
