<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	String Gid = request.getParameter("Gid");
	int no = Integer.parseInt(Gid);
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tour","root","");
	Statement stat = conn.createStatement();
	stat.executeUpdate("delete from guide1 where Gid ='" +Gid+"'");
	response.sendRedirect("GuideView.jsp");
	%>