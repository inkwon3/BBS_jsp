<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>

<%@ include file="/layout/header.jsp" %>
	<!-- userID세션값, 페이징 -->
	<%
		String userID = null;
		if (session.getAttribute("userID") != null){
				userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	 %>
	 <!-- 로그인 유무 확인 - 비로그인 시-->
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
			<br>
			</div>
	 <% 
	  	} else {
	 %>

	 <!-- 로그인 유무 확인 - 로그인 시 -->
		<div>
			<div style="padding-top: 20px;" align="center">
			<form method="post" action="loginAction.jsp"> </form>
			<h1 style="text-align: center;">게시판</h1>

			<p><button type = "button" onclick = "location.href = 'logoutAction.jsp';">로그아웃</button ></p>
			<br>
			</div>
	</div>
	 <%
	  	}
	 %>
	 <!-- 게시판 목록 나오기 -->
	 	<div align="center">
			<table border="1" style= "text-align: center;">
				<thead>
					<tr>
						<th style= "text-align: center;">번호</th>
						<th style= "text-align: center;">제목</th>
						<th style= "text-align: center;">작성자</th>
						<th style= "text-align: center;">작성일</th>
						
					</tr>
				</thead>
					<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for(int i = 0; i < list.size();i++) {
					%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll("\n", "<br>") %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"+ list.get(i).getBbsDate().substring(14, 16) + "분" %></td>
					</tr>
					<%
						}
					%>
					</tbody>
				</table>
				<!-- 페이징 -->
				<%
					if(pageNumber != 1) {
						
				%>
					<a href="bbs.jsp?pageNumber=<%=pageNumber -1 %>">이전</a>
				<%
					} if(bbsDAO.nextPage(pageNumber + 1)) {
				%>
					<a href="bbs.jsp?pageNumber=<%=pageNumber +1 %>">다음</a>
				<%
					}
				%>
				<a href="write.jsp">글쓰기</a>
			</div>
	<%@ include file="/layout/footer.jsp" %>