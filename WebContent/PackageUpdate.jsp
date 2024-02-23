<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String Pid = request.getParameter("Pid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "tour";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from pack1 where Pid="+Pid;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title>Update</title>
    <link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/style2.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta location="viewport" content="width=device-width, initial-scale=1.0">
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
          <a href="PackageForm.jsp" class="active">
            <i class='bx bx-grid-alt' ></i>
            <span class="links_name">Add Form</span>
          </a>
        </li>
        <li>
          <a href="PackageView.jsp">
            <i class='bx bx-box' ></i>
            <span class="links_name">View Details</span>
          </a>
        </li>
        <li>
          <a href="PackageSearch.jsp">
            <i class='bx bx-list-ul' ></i>
            <span class="links_name">Search</span>
          </a>
        </li>
        <li>
          <a href="PackageReport.jsp">
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
        <span class="dashboard">Update</span>
      </div>
    </nav>


	  

    <div class="testbox">
   <form action="PackageUpdateProcess.jsp" method="post">
      <div class="banner">
     <h1>Package and Costing Form</h1>
      </div>
      <br/>
      <fieldset>
        <legend>Package and Costing Details</legend>
        <div class="columns">
        
          <div class="item">
            <label for="event">Package ID<span>*</span></label>
            <input id="Pid" type="number" name="Pid" readonly  value="<%=resultSet.getInt("Pid") %>">
          </div>    
          <div class="item">
            <label for="event">Tour Name<span>*</span></label>
            <input id="Pname" type="text" name="Pname" value="<%=resultSet.getString("Pname") %>">
          </div>
          <div class="item">
            <label for="venue">No Of Person<span>*</span></label>
            <input id="NoOfper" type="text" name="NoOfper" value="<%=resultSet.getString("NoOfper") %>">
          </div>
          <div class="item">
            <label for="type">Date<span>*</span></label>
            <input id="Pdate" type="date"   name="Pdate" value="<%=resultSet.getString("Pdate") %>">
          </div>
          <div class="item">
            <label for="food">No Of Days<span>*</span></label>
            <input id="NoOfDay" type="text"   name="NoOfDay" value="<%=resultSet.getString("NoOfDay") %>">
            <i class="fas fa-calendar-alt"></i>
          </div>
		   <div class="item">
		  <label for="Vdetails">Vehicle Details<span>*</span></label>
		  <input id="Vdetails" type="text" name="Vdetails" value="<%=resultSet.getString("Vdetails") %>">
		  <i class="fas fa-calendar-alt"></i>
		  </div>
      </fieldset>
      <br/>
      <div class="btn-block">
      <button type="submit" value="Submit">Update</button>
      </div>
      
    </form>
    </div>


    </div>
  </section>

<% 
 }
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

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
