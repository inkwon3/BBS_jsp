<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ include file="/layout/header.jsp" %>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null){
				userID = (String) session.getAttribute("userID");
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") !=null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
	 %>
	 
	 <%
	  	if(userID == null) {
	 %>
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
	 <% 
	  	} else {
	 %>
			<div style="padding-top: 20px;" align="center">
			<form method="post" action="loginAction.jsp"> </form>
			
			<p><button type = "button" onclick = "location.href = 'logoutAction.jsp';">로그아웃</button ></p>
			</div>
	 <%
	  	}
	 %>
	 <div align="center">
		<table style="text-align: center;" border="1">
			<tbody>
				<tr>
					<td style="width: 20%">글 제목</td>
					<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll("\n", "<br>") %></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td colspan="2"><%= bbs.getUserID() %></td>
				</tr>
				<tr>
					<td>작성일자</td>
					<td colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시"+ bbs.getBbsDate().substring(14, 16) + "분" %></td>
				</tr>	
				<tr>
					<td>내용</td>
					<td colspan="2" style="min-height: 200px; text-align: center;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll("\n", "<br>") %></td>
				</tr>		
			</tbody>
		</table>
		
		<a href="bbs.jsp">목록</a>
		<a href="update.jsp?bbsID=<%= bbsID %>">수정</a>
		<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>">삭제</a>
	</div>
<%@ include file="/layout/footer.jsp" %>