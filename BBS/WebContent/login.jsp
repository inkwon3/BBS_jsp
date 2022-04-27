<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp" %>
			<div style="padding-top: 50px;" align="center">	
				<form method="post" action="loginAction.jsp">
					<fieldset style="width: 200px;">
						<legend>로그인</legend>
							<input type="text" placeholder="아이디" name="userID" maxlength="20" >
							<input type="password" placeholder="비밀번호" name="userPassword" maxlength="20">
						<p><input type="submit" value="로그인"></p>
						<p><button type = "button" onclick = "location.href = 'join.jsp';">회원가입</button></p>
					</fieldset>
				</form>
			</div>
<%@ include file="/layout/footer.jsp" %>