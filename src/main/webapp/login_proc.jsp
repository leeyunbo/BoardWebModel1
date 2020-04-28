<%@page import="com.leeyunbo.biz.user.impl.UserDAO"%>
<%@page import="com.leeyunbo.biz.user.UserVO"%>
<%@page contentType="text/html; charset=EUC-KR"%>

<%
	// 사용자 입력 추출 
	String id = request.getParameter("id"); 
	String password = request.getParameter("password"); 
	
	// DB 연동 처리 
	UserVO vo = new UserVO(); 
	vo.setId(id); 
	vo.setPassword(password);
	
	UserDAO userDAO = new UserDAO(); 
	UserVO user = userDAO.getUser(vo);
	
	// 화면 네비게이션 
	if(user != null) {
		response.sendRedirect("getBoardList.jsp"); 
	} else {
		response.sendRedirect("login.jsp");
	}	
%>
	