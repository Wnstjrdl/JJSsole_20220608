<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-09
  Time: 오후 1:48
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

        <form action="/member/update" method="post" name="updateForm">
            회원번호:<input type="text" name="id" value="${memberUpdate.id}" class="form-control" readonly><br />
            아이디:<input type="text" name="memberId" value="${memberUpdate.memberId}" class="form-control" readonly ><br />
            비밀번호:<input type="text" name="memberPassword" value="${memberUpdate.memberPassword}" class="form-control" ><br />
            이름:<input type="text" name="memberName" value="${memberUpdate.memberName}" class="form-control" readonly><br />
            이메일:<input type="text" name="memberEmail" value="${memberUpdate.memberEmail}" class="form-control" readonly><br />
            전화번호:<input type="text" name="memberMobile" value="${memberUpdate.memberMobile}" class="form-control" ><br />
            <button class="btn btn-warning  "  onclick=" updateAlert()" >수정하기</button>
        </form>



    </div>
</div>



</body>
<script>
    const memberUpdate = () => {
        const passwordConfirm= document.getElementById("passwordConfirm").value;
        const  passwordDB='${memberUpdate.memberPassword}';
        if(passwordConfirm == passwordDB){
            updateForm.submit();

        }else {
            alert("비밀번호가 일치하지않습니다")
        }
    }
    const memberDelete = () => {
        const passwordConfirm= document.getElementById("passwordConfirm").value;
        const  passwordDB='${member.memberPassword}';
        if(passwordConfirm == passwordDB){
            deleteForm.submit();
        }else {
            alert("비밀번호가 일치하지않습니다")
        }
    }
    const updateAlert = () => {
        alert("수정이완료되었습니다")
      location.href="/member/update"

    }

</script>
</html>
