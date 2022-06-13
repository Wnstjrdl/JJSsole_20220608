
<%--
  Created by IntelliJ IDEA.
  User: adwin21-175
  Date: 2022-06-10
  Time: 오후 7:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="//code.jquery.com/jquery.min.js"></script>

    <style>
        span {
            font-weight: bold;
            font-size: 2em;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<h2>공지사항</h2>
<div class="container mb-3">
    <form action="/notice/search" method="get">
        <select name="searchType">
            <option value="noticeTitle">공지사항</option>
        </select>
            <input type="text" name="q" placeholder="검색어 입력">
            <input type="submit" value="검색">
    </form>
</div>

    <div class="container mt-5">
        <table class="table">
            <tr>
                <td>공지글번호</td>
                <td>작성자</td>
                <td>공지사항</td>
                <td>작성시간</td>
                <td>조회수</td>

            </tr>
            <c:forEach items="${noticeList}" var="notice">
                <tr>
                    <td>${notice.id}</td>
                 <td>${notice.noticeWriter}</td>
                    <td><a href="/notice/detail?page=${paging.page}&id=${notice.id}">${notice.noticeTitle}</a></td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
                                        value="${notice.noticeCreatedDate}"></fmt:formatDate></td>
                    <td>${notice.noticeHits}</td>



                </tr>
            </c:forEach>
        </table>
    </div>
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
                        <a class="page-link" href="/notice/paging?page=${paging.page-1}">[이전]</a>
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
                            <a class="page-link" href="/notice/paging?page=${i}">${i}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
                <c:when test="${paging.page>=paging.maxPage}">
                    <li class="page-item disabled">
                        <a class="page-link">[다음]</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/notice/paging?page${paging.page+1}">[다음]</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</body>
</html>
