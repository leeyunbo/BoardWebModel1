<%@page import="java.util.List"%>
<%@page import="com.leeyunbo.biz.board.impl.BoardDAO"%>
<%@page import="com.leeyunbo.biz.board.BoardVO"%>
<%@page contentType="text/html; charset=EUC-KR"%>

<% 
	// DB 연동 처리
	BoardDAO boardDAO = new BoardDAO();
	List<BoardVO> boardList = boardDAO.getBoardList();
	
	// 응답 화면 구성
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>글 목록</title>
</head>
<body>
<center>
<h1>글 목록</h1>
<h3>테스트님 환영합니다 <a href="logout_proc.jsp">Log-out</a></h3>

<!-- 검색 기능 -->
<form action="getBoardList.jsp" method="post">
<table border="1" cellpadding="0" cellspacing="0" width="700">
	<tr>
		<td align="right">
			<select name="searchCondition">
			<option value="TITLE">
			<option value="CONTENT"> 
			</select>
			<input name="searchKeyword" tpye="text"/> 
			<input type="submit" value="검색"/> 
		</td>
	</tr>
</table>
</form>

<!-- 게시글 정보 -->
<table border="1" cellpadding="0" cellspacing="0" width="700">
<tr>
	<th bgcolor="orange" width="100">번호</th>
	<th bgcolor="orange" width="200">제목</th>
	<th bgcolor="orange" width="150">작성자</th>
	<th bgcolor="orange" width="150">등록일</th>
	<th bgcolor="orange" width="100">조회수</th>
</tr>

<%for(BoardVO board : boardList) { %>
<tr> 
	<td><%= board.getSeq() %></td>
	<td align="left"><a href="getBoard.jsp?seq=<%=board.getSeq()%>"> <%=board.getTitle() %></a></td>
	<td><%=board.getWriter() %></td>
	<td><%=board.getRegDate() %></td>
	<td><%=board.getCnt() %></td>
</tr>
<% } %>
</table>
<br>
<a href="insertBoard.jsp">새글 등록</a>
</center>
</body>
</html>