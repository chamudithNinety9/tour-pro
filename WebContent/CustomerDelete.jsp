<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	String Cid = request.getParameter("Cid");
	int no = Integer.parseInt(Cid);
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tour","root","");
	Statement stat = conn.createStatement();
	stat.executeUpdate("delete from customer1 where Cid ='" +Cid+"'");
	response.sendRedirect("CustomerView.jsp");
	%>