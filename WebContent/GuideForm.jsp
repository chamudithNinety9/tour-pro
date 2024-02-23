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
  
  var b = document.forms["AddGuide"]["Gname"].value;
  if (b == "") {
	    alert("Name cannot be Empty!!");
	    return false;
	  }
   
  var c = document.forms["AddGuide"]["Gaddress"].value;
  if (c == "") {
	    alert("Address cannot be Empty!!");
	    return false;
	  }
  
  var d= document.forms["AddGuide"]["Gnic"].value;
  if (d == "") {
	    alert("NIC cannot be Empty!!");
	    return false;
	  }
  
  var x = document.forms["AddGuide"]["Gemail"].value;
  if (x == "") {
	    alert("Email cannot be Empty!!");
	    return false;
	  }
  
  var z = document.forms["AddGuide"]["Gpno"].value;
  if (z == "") {
	    alert("Phone No cannot be Empty!!");
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
          <a href="GuideForm.jsp" class="active">
            <i class='bx bx-grid-alt' ></i>
            <span class="links_name">Add Form</span>
          </a>
        </li>
        <li>
          <a href="GuideView.jsp">
            <i class='bx bx-box' ></i>
            <span class="links_name">View Details</span>
          </a>
        </li>
        <li>
          <a href="GuideSearch.jsp">
            <i class='bx bx-list-ul' ></i>
            <span class="links_name">Search</span>
          </a>
        </li>
        <li>
          <a href="GuideReport.jsp">
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
   <form name="AddGuide" onsubmit="return validateForm()" action="GuideServlet" method="post">
      <div class="banner">
     <h1>Guide Register Form</h1>
      </div>
      <br/>
      <fieldset>
        <legend>Guide Details</legend>
        <div class="columns">
        
          <div class="item">
            <label for="event">Name<span>*</span></label>
            <input id="Gname" type="text" name="Gname" >
          </div>
          <div class="item">
            <label for="venue">Address<span>*</span></label>
            <input id="Gaddress" type="text" name="Gaddress" >
          </div>
          <div class="item">
            <label for="type">NIC<span>*</span></label>
            <input id="Gnic" type="text"   name="Gnic" >
          </div>
          <div class="item">
            <label for="food">Email<span>*</span></label>
            <input id="Gemail" type="text"   name="Gemail" >
            <i class="fas fa-calendar-alt"></i>
          </div>
		   <div class="item">
		  <label for="Gpno">Phone No<span>*</span></label>
		  <input id="Gpno" type="text" name="Gpno"  >	
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
