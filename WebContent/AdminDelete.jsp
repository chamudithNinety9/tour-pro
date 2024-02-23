<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	String Aid = request.getParameter("Aid");
	int no = Integer.parseInt(Aid);
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tour","root","");
	Statement stat = conn.createStatement();
	stat.executeUpdate("delete from admin1 where Aid ='" +Aid+"'");
	response.sendRedirect("AdminView.jsp");
	%>