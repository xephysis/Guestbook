<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=utf-8"%>
<html>
<head>
	<title>Guestbook</title>
</head>
<body>
<h1>
	Hello Guestbook!!! 
</h1>
<br>
 
<input name="write" type="button" value="새글쓰기" class="inputb" onclick="javascript:location.href='/writeForm.do';" />
 
<table border="1" width="500" height="100"> <!-- 테이블 사이즈 -->
		<!-- for문 boardList 반복 -->
		<c:forEach var="row" items="${guestbooklist}">
			<tr>
				<td>작성자</td>
				<td colspan="2">${row.email}</td>
				<td><a href="/updateForm.do?seq=${row.seq}">수정하기</a></td>
			</tr>
			<tr>
				<td>작성시간</td>
				<td>${row.createtime}</td>
				<td>수정시간</td>
				<td>${row.modifiedtime}</td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea name="content" cols='70' rows='10' READONLY>${row.content}</textarea>
				</td>
			</tr>
			<tr class="blank_row">
				<td colspan="4">&nbsp;</td>
    		</tr>
		</c:forEach>
	</table>
	<br />
</body>
</html>
