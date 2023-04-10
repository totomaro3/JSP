<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
</head>
<body>
	<div>
		<a href="../home/main">메인페이지로 이동</a>
	</div>

	<h1>게시물 작성</h1>

	<form method="post" action="doJoin">
		<div>
			제목 : <input autocomplete="off" type="text" placeholder="아이디를 입력해 주세요" name="loginId" />
		</div>
		<div>
			내용 :
			<textarea type="text" placeholder="비밀번호를 입력해 주세요" name="loginPw"></textarea>

		</div>
		<button type="submit">글쓰기</button>

	</form>
</body>
</html>