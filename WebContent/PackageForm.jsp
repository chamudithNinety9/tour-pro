<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title>Add Form</title>
    <link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/style2.css">
	<link rel="stylesheet" type="text/css" href="viewtable.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta location="viewport" content="width=device-width, initial-scale=1.0">

<script>
function validateForm() {
  
  var b = document.forms["AddPackage"]["Pname"].value;
  if (b == "") {
	    alert("Tour Name cannot be Empty!!");
	    return false;
	  }
   
  var c = document.forms["AddPackage"]["NoOfper"].value;
  if (c == "") {
	    alert("No Of Person cannot be Empty!!");
	    return false;
	  }
  
  var d= document.forms["AddPackage"]["Pdate"].value;
  if (d == "") {
	    alert("Date cannot be Empty!!");
	    return false;
	  }
  
  var x = document.forms["AddPackage"]["NoOfDay"].value;
  if (x == "") {
	    alert("No Of Days cannot be Empty!!");
	    return false;
	  }
  
  var z = document.forms["AddPackage"]["Vdetails"].value;
  if (z == "") {
	    alert("Vehicle Details cannot be Empty!!");
	    return false;
	  }

}

</script>  	

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
        <span class="dashboard">Add Form</span>
      </div>
    </nav>


	  

    <div class="testbox">
   <form name="AddPackage" onsubmit="return validateForm()" action="PackageServlet" method="post">
      <div class="banner">
     <h1>Package and Costing Form</h1>
      </div>
      <br/>
      <fieldset>
        <legend>Package and Costing Details</legend>
        <div class="columns">
        
          <div class="item">
            <label for="event">Tour Name<span>*</span></label>
            <input id="Pname" type="text" name="Pname" >
          </div>
          <div class="item">
            <label for="venue">No Of Person<span>*</span></label>
            <input id="NoOfper" type="text" name="NoOfper" >
          </div>
          <div class="item">
            <label for="type">Date<span>*</span></label>
            <input id="Pdate" type="date"   name="Pdate" >
          </div>
          <div class="item">
            <label for="food">No Of Days<span>*</span></label>
            <input id="NoOfDay" type="text"   name="NoOfDay" >
            <i class="fas fa-calendar-alt"></i>
          </div>
		   <div class="item">
		  <label for="Vdetails">Vehicle Details<span>*</span></label>
		  <input id="Vdetails" type="text" name="Vdetails"  >	
		  </div>
      </fieldset>
      <br/>
      <div class="btn-block">
      <button type="submit" value="Submit">Submit</button>
      </div>
      
    </form>
    </div>


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
