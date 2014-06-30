<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=utf-8"%>
<html>
<head>
	<title>view</title>
</head>
<body>
<table border="1">
		<tr>	
				<td width='50px' align='center'>글번호</td>
				<td width='50px'>${board_data.seq}</td>
			</tr>
			<tr> 
				<td width='50px' align='center'>제목</td>
				<td width='450px'size='70' maxlength="40">${board_data.subject}</td>
			</tr>
			<tr>
				<td colspan="2" cols='70' rows='20'>${board_data.content}</td>
			</tr>
		</table>
	<input name="list" type="button" value="목록보기" class="inputb" onclick="javascript:location.href='/list.do';" />
	<input name="retrive" type="button" value="수정" onclick="javascript:location.href='/updateForm.do?seq=${board_data.seq}'"/>
	<input name="delete" type="button" value="삭제" onclick="javascript:location.href='/delete.do?seq=${board_data.seq}'"/>

</body>
</html>
