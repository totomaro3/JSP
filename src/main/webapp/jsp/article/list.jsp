<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<Map<String, Object>> articleRows = (List<Map<String, Object>>) request.getAttribute("articleRows");
int cPage = (int) request.getAttribute("page");
int totalPage = (int) request.getAttribute("totalPage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 리스트</title>
</head>
<body>
	<div>
		<a href="../home/main">메인페이지로 이동</a>
	</div>
	<div>
		<a href="write">글쓰기</a>
	</div>

	<h1>게시물 리스트</h1>

	<table style="border-collapse: collapse; border-color: green" border="2px">

		<tr>
			<th>번호</th>
			<th>작성날짜</th>
			<th>제목</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<%
		for (Map<String, Object> articleRow : articleRows) {
		%>
		<tr style="text-align: center;">
			<td><%=articleRow.get("id")%></td>
			<td><%=articleRow.get("regDate")%></td>
			<td><a href="detail?id=<%=articleRow.get("id")%>"><%=articleRow.get("title")%></a></td>
			<td><a href="modify?id=<%=articleRow.get("id")%>">수정</a></td>
			<td><a href="doDelete?id=<%=articleRow.get("id")%>">삭제</a></td>
		</tr>
		<%
		}
		%>

	</table>

	<style type="text/css">
.page>a.red {
	color: red;
}
</style>

	<div class="page">
		<%
		int minPage = 1;
		int maxPage = 1;
		
		if(cPage-5 <= 1) minPage = 1;
		else minPage = cPage-5;
		
		if(cPage+5 >= totalPage) maxPage = totalPage;
		else maxPage = cPage+5;
		%>
		<%if(minPage != 1){%>
		<a href="list?page=<%=1%>">1</a> ...
		<%} else {}%>
		<%
		for (int i = minPage; i <= maxPage; i++) {
		%>
		<a class="<%=cPage == i ? "red" : ""%>" href="list?page=<%=i%>"><%=i%></a>
		<%
		}
		%>
		<%if(maxPage != totalPage){%>
		... <a href="list?page=<%=totalPage%>"><%=totalPage%></a>
		<%} else {}%>
	</div>

</body>
</html>