<%@page import="com.leeyunbo.biz.user.impl.UserDAO"%>
<%@page import="com.leeyunbo.biz.user.UserVO"%>
<%@page contentType="text/html; charset=EUC-KR"%>

<%
	// ����� �Է� ���� 
	String id = request.getParameter("id"); 
	String password = request.getParameter("password"); 
	
	// DB ���� ó�� 
	UserVO vo = new UserVO(); 
	vo.setId(id); 
	vo.setPassword(password);
	
	UserDAO userDAO = new UserDAO(); 
	UserVO user = userDAO.getUser(vo);
	
	// ȭ�� �׺���̼� 
	if(user != null) {
		response.sendRedirect("getBoardList.jsp"); 
	} else {
		response.sendRedirect("login.jsp");
	}	
%>
	