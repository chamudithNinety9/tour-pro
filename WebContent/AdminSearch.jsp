<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "tour";
String userid = "root";
String password = "";
String search=request.getParameter("search");
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title>Search</title>
    <link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/style2.css">
	<link rel="stylesheet" type="text/css" href="css/viewtable.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta location="viewport" content="width=device-width, initial-scale=1.0">
  <style>     

.button1 {
  background-color: #008b8b;
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 10px;
  margin: 4px 2px;
  cursor: pointer;
}  
  </style>
   
   </head>
<body>
  <div class="sidebar">
  <img class="img" src="img\logo1.jpg" style="width:160px; top: 40px; margin:20px">
    <div class="logo-details">
      <i class='bx bxl-c-plus-plus'></i>
      <span class="logo_name">Tour Pro</span>
    </div>
      <ul class="nav-links">
         <li>
          <a href="AdminForm.jsp" >
            <i class='bx bx-grid-alt' ></i>
            <span class="links_name">Add Form</span>
          </a>
        </li>
        <li>
          <a href="AdminView.jsp">
            <i class='bx bx-box' ></i>
            <span class="links_name">View Details</span>
          </a>
        </li>
        <li>
          <a href="AdminSearch.jsp" class="active">
            <i class='bx bx-list-ul' ></i>
            <span class="links_name">Search</span>
          </a>
        </li>
        <li>
          <a href="AdminReport.jsp" >
            <i class='bx bx-list-ul' ></i>
            <span class="links_name">Report</span>
          </a>
        </li>
        
        <li class="log_out">
          <a href="Home.jsp">
            <i class='bx bx-log-out'></i>
            <span class="links_name">Log out</span>
          </a>
        </li>
      </ul>
  </div>
  <section class="home-section">
    <nav>
      <div class="sidebar-button">
        <i class='bx bx-menu sidebarBtn'></i>
        <span class="dashboard">Search</span>
      </div>
       <left><form class="form-inline" action="AdminSearch.jsp">
							  <input class="form-control mr-sm-2" type="search" placeholder=" Admin ID...." aria-label="Search" name="search">
							  <left><button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button></left>
							</form></left>
    </nav>

<br>
<br>
<br>
<br>
<br>
	
<div class="">
			  <center>
							
							<table id="mytable" class="content-table">
								 
								 <thead>
								 <th scope="col">Admin ID</th>
								 <th scope="col">Name</th>
								 <th scope="col">NIC</th>
								 <th scope="col">Address</th>
								  <th scope="col">Email</th>
								   <th scope="col">Phone No</th>

							   
								 </thead>	  
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from admin1 where Aid="+search+" ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
									
				  						<td bgcolor="#FFFFF0"><%=resultSet.getInt("Aid") %></td>
				  						<td><%=resultSet.getString("Aname") %></td>
				  						<td><%=resultSet.getString("Anic") %></td>
				  						<td><%=resultSet.getString("Aaddress") %></td>
				  						<td><%=resultSet.getString("Aemail") %></td>
				  						<td><%=resultSet.getString("pNo") %></td>

</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

 </center>

    </div>
  </section>

  <script>
   let sidebar = document.querySelector(".sidebar");
let sidebarBtn = document.querySelector(".sidebarBtn");
sidebarBtn.onclick = function() {
  sidebar.classList.toggle("active");
  if(sidebar.classList.contains("active")){
  sidebarBtn.classList.replace("bx-menu" ,"bx-menu-alt-right");
}else
  sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
}
 </script>

</body>
</html>
