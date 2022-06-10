
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-09
  Time: 오전 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    글번호:${board.id}</span><br />
    작성자:${board.boardWriter}<br />
     제목:${board.boardTitle}<br />
     내용:${board.boardContents}<br />
    조회수:${board.boardHits}<br />
    작성시간:${board.boardCreatedDate}<br />

    <div class="container mt-5">
        <div id="comment-write" class="input-group mb-3">
            <div class="form-floating">
                <input type="text" id="commentWriter" class="form-control" value="${loginMemberId}"  placeholder="작성자" readonly>
                <label for="commentWriter">작성자</label>
            </div>
            <div class="form-floating">
                <input type="text" id="commentContents" class="form-control" >
                <label for="commentContents">내용</label>
            </div>
    <button id="comment-write-btn" class="btn btn-primary">작성</button>
        </div>
</div>

    <div id="comment-list">
        <table class="table">
            <tr>
                <td>댓글번호</td>
                <td>작성자</td>
                <td>작성내용</td>
                <td>작성시간</td>
            </tr>
           <c:forEach items="${commentList}" var="comment">
               <tr>
                   <td>${comment.id}</td>
                   <td>${comment.commentWriter}</td>
                   <td>${comment.commentContents}</td>
                   <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${comment.commentCreatedDate}"></fmt:formatDate></td>
               </tr>
           </c:forEach>
        </table>
    </div>


</body>
<c:if test="${sessionScope.loginMemberId eq board.boardWriter}">
  <button class="btn btn-danger" onclick="location.href='/board/delete?id=${board.id}'">삭제</button>
    <button class="btn btn-danger" onclick="location.href='/board/update?id=${board.id}'">수정</button>

</c:if>

    <script>
        $("#comment-write-btn").click(function (){
            const cWriter = document.getElementById("commentWriter").value;
            const cContents = $("#commentContents").val();
            const boardId = '${board.id}';
            $.ajax({
                type:'post',
                 url:"/comment/save",
                data:{
                    "commentWriter":cWriter,
                    "commentContents":cContents,
                    "boardId":boardId
                },
                dataType:"json",
                success:function (result){
                    console.log(result);
                    let output ="<table class= 'table'>";
                    output +="<tr><td>댓글번호</td>";
                    output +="<tr><td>작성자</td>";
                    output +="<tr><td>작성내용</td>";
                    output +="<tr><td>작성시간</td></tr>";
                    for(let i in result){
                        output += "<tr>";
                        output += "<td>"+result[i].id+"</td>";
                        output += "<td>"+result[i].commentWriter+"</td>";
                        output += "<td>"+result[i].commentContents+"</td>";
                        output += "<td>"+moment(result[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
                        output += "</tr>";
                    }
                    output += "</table>";
                    document.getElementById('comment-list').innerHTML = output;
                    document.getElementById('commentWriter').value='';
                    document.getElementById('commentContents').value='';
                },
            });
        });
;



    </script>
</html>