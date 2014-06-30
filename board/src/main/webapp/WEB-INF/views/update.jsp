<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
function check(){
	var str2 = document.getElementById('passwd');
	var str3 = document.getElementById('content');
	
	if(str2.value == '' || str2.value == null){
		alert('패스워드를 입력하세요');
		return false;
	}
	if(str3.value == '' || str3.value == null){
		alert('내용을 입력하세요');
		return false;
	} 	
	return save();
};

function save(){
	var str4 = document.getElementById('modifier');
	str4.submit(); 
}

function checkpasswd(incorrectpasswd){
	if(incorrectpasswd){
		alert('잘못된 패스워드입니다.');	
	}
}

</script>
<title>수정하기</title>
</head> 

<body>
	<script type="text/javascript">
		checkpasswd('${incorrectpasswd}');
	</script>

	<form id="modifier" action="/update.do" method="post">
		<input type="hidden" name="seq" value="${guestbook_data.seq}" />
		<input type="hidden" id="org_passwd" value="${guestbook_data.passwd}" />
		<table border="1">
			<tr>
				<td width='50px' align='center'>이메일</td>
				<td width='450px'>${guestbook_data.email}</td>
			</tr>
			<tr>
				<td width='50px' align='center'>패스워드</td>
				<td width='450px'><input type ="password" name="passwd" size='70' maxlength="40" id="passwd" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" cols='70' rows='20' id="content">${guestbook_data.content}</textarea>
				</td>
			</tr>
		</table>
	</form>
	<input name="modify" type="button" value="수정"
			onclick="javascript:check();" />
	<input name="list" type="button" value="취소" class="inputb"
			onclick="javascript:location.href='/list.do';" />
</body>
</html> 
