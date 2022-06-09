<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-09
  Time: 오전 8:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>Title</title>
      <h2>pagingList</h2>
  </head>
  <body>
  <link rel="stylesheet" href="/resources/css/bootstrap.min.css">

    <div class="container">
      <table class="table">
        <tr>
          <td>글번호</td>
          <td>작성자</td>
          <td>제목</td>
          <td>내용</td>
          <td>조회수</td>
        </tr>





        </tr>

      </table>
        <div class="container">
        <ul class="pagination justify-content-center">
        <c:choose>
          <c:when test="${paging.page<=1}">
            <li class="page-item disabled">
              <a class="page-link">[이전]</a>
            </li>
        </c:when>
          <c:otherwise>
            <li class="page-item">
              <a class="page-link" href="/board/paging?page=${paging.page-1}">[이전]</a>
            </li>
          </c:otherwise>
        </c:choose>
          <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
          <c:choose>
              <c:when test="${i eq paging.page}">
                <li class="page-item active">
                    <a class="page-link">${i}</a>
                </li>
              </c:when>
              <c:otherwise>
                <li class="page-item">
                  <a class="page-link" href="/board/paging?page=${i}">${i}</a>
                </li>
              </c:otherwise>
          </c:choose>
          </c:forEach>
          <c:choose>
            <c:when test=" ${paging.page>=paging.maxPage}">
                <li class="page-item disabled">
                    <a class="page-link">[다음]</a>
                </li>
            </c:when>
              <c:otherwise>
                <li class="page-item">
                  <a class="page-link" href="/board/paging?page${paging.page+1}">[다음]</a>
                </li>
              </c:otherwise>

          </c:choose>


        </ul>
        </div>
    </div>
          <a href="/board/save">글등록</a>
  </body>
</html>
