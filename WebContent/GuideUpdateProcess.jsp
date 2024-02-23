<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/tour";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String Gid = request.getParameter("Gid");
String Gname =request.getParameter("Gname");
String Gaddress =request.getParameter("Gaddress");
String Gnic=request.getParameter("Gnic");
String Gemail=request.getParameter("Gemail");
String Gpno=request.getParameter("Gpno");



if(Gid != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(Gid);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update guide1 set Gid=?,Gname=?,Gaddress=?,Gnic=?,Gemail=?,Gpno=? where Gid="+personID;
ps = con.prepareStatement(sql);
ps.setInt(1, personID);
ps.setString(2,Gname);
ps.setString(3,Gaddress);
ps.setString(4,Gnic);
ps.setString(5,Gemail);
ps.setString(6,Gpno);


int i = ps.executeUpdate();
if(i > 0)
{
	

RequestDispatcher rd = request.getRequestDispatcher("GuideView.jsp");
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