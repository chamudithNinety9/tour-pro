<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Time"%>
<%@page import="customer.DatabaseConnecter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Customer Requirement Report Preview</title>
	
<link href="css/Report.css" rel="stylesheet">
	
		
<style>
    tab1 { padding-left: 16em; }
    </style>
    
</head>
<body>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>

 		<%
	String Cid = request.getParameter("Cid");
	String driverName = "com.mysql.jdbc.Driver";
	String ConnectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "tour";
	String UserId="root";
	String password = "";
	
	try{
		Class.forName(driverName);
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
	
	Connection connection = null;
	Statement statement = null;
	ResultSet resultset = null;
	
	String Rid = request.getParameter("rID");
	String Rname = request.getParameter("rName");

%>

<div class="A4" style="border:1px solid black; padding:20px; height:39.7cm; ">

	<div class="content">
	<table width="100%">
<tr>
<td><img src="img/logo1.jpg" width="650px" heigth="900px"></td>


</tr>
	</div>
	</table>
<hr>
<br>
<p><tab1><b><u><font size="+2" color="886C65">Customer Requirement REPORT</b></u></font></tab1></p>

<center><h1 class="font-weight-bold"><%=Rname%> </h1></center>
<left><p class="font-weight"><%=Rid%> </p></left>
<%
try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tour","root","");
Statement st=con.createStatement();
String strQuery = "SELECT COUNT(*) FROM customer1";
ResultSet rs = st.executeQuery(strQuery);
String Countrow="";
while(rs.next()){
Countrow = rs.getString(1);
out.println("Customer  :" +Countrow);
}
}
catch (Exception e){
e.printStackTrace();
}
%>

  		<table class="table table-striped" cellspacing="18" align="center">
									<thead>
									  <tr>
										 <th scope="col">Customer ID</th>
								 <th scope="col">Customer Name</th>
								 <th scope="col">Nationality</th>
								 <th scope="col">Email</th>
								  <th scope="col">Arrived Date</th>
								   <th scope="col">Departure Date</th>
								   <th scope="col">No of Days</th>
									  </tr>
									  
									
										<%
											try{
												connection = DriverManager.getConnection(ConnectionUrl+dbName,UserId,password);
												statement=connection.createStatement();
												String sql ="SELECT * from customer1";
												
												resultset = statement.executeQuery(sql);
												while(resultset.next()){
													
												
											
										
									%>
									<tr>
									 <td><%=resultset.getInt("Cid") %></td>
									  <td><%=resultset.getString("Cname") %></td>
									  <td><%=resultset.getString("nation") %></td>
									  <td><%=resultset.getString("cEmail") %></td>
									  <td><%=resultset.getString("Adate") %></td>
									  <td><%=resultset.getString("Ddate") %></td>
									  <td><%=resultset.getString("NoD") %></td>
									</tr>
									<%
												}
											connection.close();	
											} catch(Exception e){
												e.printStackTrace();
											}
											
									%>
									
									
								  </table>
<br><br><br><br><br><br><br><br><br><br><br><br>
								  
<footer>
<p align="center"><b>PAGE NO:: 01<b></p>
<p align="center"><i><b>----------------------------CREATED BY:: TOUR MANAGE----------------------------</i><b></p>
</footer>

</div>

        
     


      <script>
        window.print();
      </script>



	
	
</body>
</html>