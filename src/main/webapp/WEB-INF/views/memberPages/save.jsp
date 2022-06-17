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
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <style>

    body {
    display: flex;
    align-items: center;
    padding-top: 40px;
    padding-bottom: 40px;
    background-color: #f5f5f5;
    }

    .form-signin {
    max-width: 330px;
    padding: 15px;
    }

    .form-signin .form-floating:focus-within {
    z-index: 2;
    }
    </style>


</head>
<body>
<div class="container">
    <h2 class="display-4 fw-normal">회원가입</h2>
    <div class="py-5 text-center">
        <form action="/member/save" method="post" enctype="multipart/form-data">
            <div class="form-floating">
            <input class="form-control mb-2" type="text"  onblur="duplicateCheck()" id="memberId" name="memberId" placeholder="아이디를 입력하세요">
                <label for="memberId">아이디를 입력하세요</label>
            <span id="dup-check-result"></span>
            </div>
            <div class="form-floating">
            <input class="form-control mb-2"  type="text"  id="memberPassword" name="memberPassword" placeholder="비밀번호를 입력하세요">
            <div  id="pwCheck"></div>
                <label for="memberPassword">비밀번호를 입력하세요</label>
            </div>
            <div class="form-floating">
            <input class="form-control mb-2" type="text" id="memberName" name="memberName" placeholder="이름을 입력하세요">
                <label for="memberName">이름을 입력하세요</label>

            </div>
            <div class="form-floating">
            <input class="form-control mb-2" type="text" id="memberEmail" name="memberEmail" placeholder="이메일를 입력하세요">
                <label for="memberEmail">이메일을 입력하세요</label>

            </div>
            <div class="form-floating">
            <input class="form-control mb-2" type="text" id="memberMobile" name="memberMobile" placeholder="전화번호를 입력하세요">
            <div id="mobileCheck"></div>
                <label for="memberMobile">전화번호를 입력하세요</label>

            </div>


            프로필사진을 등록해주세요:<input class="form-control" type="file" name="memberFile" >
                                                                                                <br />
            <label><input type="radio" name="gender" value="남" >남자</label> &nbsp;
            <label><input type="radio" name="gender" value="여" >여자</label><br>


            <input class="btn btn-danger" type="submit" value="회원가입">
        </form>
    </div>
</div>

</body>
<script>
    const duplicateCheck = () => {
        const memberId=document.getElementById("memberId").value;
        const checkResult=document.getElementById("dup-check-result");
        $.ajax({
            type:"post",
            url: "/member/duplicate-check",
            data:{"memberId":memberId},
            dataType:"text",
            success:function (result){
                if(result == "ok"){
                    checkResult.innerHTML="사용가능합니다.";
                    checkResult.style.color="green";
                }else{
                    checkResult.innerHTML="중복된 아이디 값입니다";
                    checkResult.style.color="red";
                }
            }
        });



    }

    const pwJ= /^[A-Za-z0-9]{4,12}$/;
    $('#memberPassword').blur(function (){
        if(pwJ.test($('#memberPassword').val())) {
            console.log("true");
            $('#pwCheck').text("ok");
            $('#pwCheck').css('color','green');
        }else{
            console.log('false');
            $('#pwCheck').text('숫자 문자로만4~12자리입력');
            $('#pwCheck').css('color','red');
        }
    })

    const mobileJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
     $('#memberMobile').blur(function () {
         if(mobileJ.test($('#memberMobile').val())){
             console.log("true");
             $('#mobileCheck').text('ok');
             $('#mobileCheck').css('color','green');
         }else {
             console.log("false");
             $('#mobileCheck').text('잘못된 입력 방식입니다');
             $('#mobileCheck').css('color','red');
         }
     })
</script>
</html>
