<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/tour";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String Aid = request.getParameter("Aid");
String Aname =request.getParameter("Aname");
String Anic =request.getParameter("Anic");
String Aaddress=request.getParameter("Aaddress");
String Aemail=request.getParameter("Aemail");
String pNo=request.getParameter("pNo");



if(Aid != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(Aid);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update admin1 set Aid=?,Aname=?,Anic=?,Aaddress=?,Aemail=?,pNo=? where Aid="+personID;
ps = con.prepareStatement(sql);
ps.setInt(1, personID);
ps.setString(2,Aname);
ps.setString(3,Anic);
ps.setString(4,Aaddress);
ps.setString(5,Aemail);
ps.setString(6,pNo);


int i = ps.executeUpdate();
if(i > 0)
{
	

RequestDispatcher rd = request.getRequestDispatcher("AdminView.jsp");
rd.include(request, response);
}
else
{
out.print("There is a problem in updating Record.");

}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%> 