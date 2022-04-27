<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/layout/header.jsp" %>
	<div style="padding-top: 20px;" align="center">
		<form method="post" action="joinAction.jsp">
			<fieldset style="width: 200px;">
				<legend>회원가입</legend>
					<input type="text" placeholder="아이디" name="userID" maxlength="20" >
					<input type="password" placeholder="비밀번호" name="userPassword" maxlength="20">
					<input type="text" placeholder="이름" name="userName" maxlength="20">
					<label><input type="radio" name= "userGender" autocomplete="on" value="남자" checked>남자</label>
					<label><input type="radio" name= "userGender" autocomplete="off" value="여자" checked>여자</label>
					<input type="email" placeholder="이메일" name="userEmail" maxlength="20">
					<p><input type="submit" value="회원가입"></p>
			</fieldset>
		</form>
	</div>
<%@ include file="/layout/footer.jsp" %>