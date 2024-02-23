<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String PLid = request.getParameter("PLid");
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
String sql ="select * from place1 where PLid="+PLid;
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
          <a href="PlaceForm.jsp" class="active">
            <i class='bx bx-grid-alt' ></i>
            <span class="links_name">Add Form</span>
          </a>
        </li>
        <li>
          <a href="PlaceView.jsp">
            <i class='bx bx-box' ></i>
            <span class="links_name">View Details</span>
          </a>
        </li>
        <li>
          <a href="PlaceSearch.jsp">
            <i class='bx bx-list-ul' ></i>
            <span class="links_name">Search</span>
          </a>
        </li>
        <li>
          <a href="PlaceReport.jsp">
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
   <form action="PlaceUpdateProcess.jsp" method="post">
      <div class="banner">
     <h1>Place Form</h1>
      </div>
      <br/>
      <fieldset>
        <legend>Place Details</legend>
        <div class="columns">
        
          <div class="item">
            <label for="event">Place ID<span>*</span></label>
            <input id="PLname" type="number" name="PLid" readonly  value="<%=resultSet.getInt("PLid") %>">
          </div>    
          <div class="item">
            <label for="event">Place Name<span>*</span></label>
            <input id="PLname" type="text" name="PLname" value="<%=resultSet.getString("PLname") %>">
          </div>
          <div class="item">
            <label for="venue">City of the Place<span>*</span></label>
            <input id="CofPl" type="text" name="CofPl" value="<%=resultSet.getString("CofPl") %>">
          </div>
          <div class="item">
            <label for="type">Entrance Fee<span>*</span></label>
            <input id="EnFee" type="text"   name="EnFee" value="<%=resultSet.getString("EnFee") %>">
          </div>
          <div class="item">
            <label for="food">Rules & Regulation<span>*</span></label>
            <input id="rules" type="text"   name="rules" value="<%=resultSet.getString("rules") %>">
            <i class="fas fa-calendar-alt"></i>
          </div>
		   <div class="item">
		  <label for="PLdesc">Description<span>*</span></label>
		  <input id="PLdesc" type="text" name="PLdesc" value="<%=resultSet.getString("PLdesc") %>">
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
