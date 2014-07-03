<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<script type="text/javascript">
		function check(){
			var str = document.getElementById('email');
			var str2 = document.getElementById('passwd');
			var str3 = document.getElementById('content');
			
			if(str.value == '' || str.value == null){
				alert('이메일을 입력하세요');
				return false;
			}
			if(!validateEmail(str.value)){
				alert('잘못된 이메일 형식입니다');
				return false;
			}
			
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
			var str4 = document.getElementById('writer');
			str4.submit(); 
		}
		
		function validateEmail(email) {
		    var rex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;   
		    return rex.test(email);
		} 
	</script>
	<title>write</title>
</head>

<body>
	<form id="writer" action="/write.do" method="post">
		<table border="1">
			<tr>
				<td width='50px' align='center'>E-mail</td>
				<td width='450px'><input type='text' size='70' maxlength="40"
					id="email" name='email' /></td>
			</tr>
			<tr>
				<td width='50px' align='center'>Password</td>
				<td width='450px'><input type='password' size='70' maxlength="40"
					id="passwd" name='passwd' /></td>
			</tr>
			<tr>
				<td colspan="2"><textarea cols='70' rows='20' id="content"
						name='content'></textarea></td>
			</tr>
		</table>
	</form>
	<input name="write" type="button" value="저장"
		onclick="javascript:check();" />
	<input name="list" type="button" value="목록보기" class="inputb"
		onclick="javascript:location.href='/list.do';" />
</body>
</html>
