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
  
  var b = document.forms["AddCus"]["Cname"].value;
  if (b == "") {
	    alert("Customer Name cannot be Empty!!");
	    return false;
	  }
   
  var c = document.forms["AddCus"]["nation"].value;
  if (c == "") {
	    alert("Nationality  cannot be Empty!!");
	    return false;
	  }
  
  var d= document.forms["AddCus"]["cEmail"].value;
  if (d == "") {
	    alert("Email cannot be Empty!!");
	    return false;
	  }
  
  var x = document.forms["AddCus"]["Adate"].value;
  if (x == "") {
	    alert("Date cannot be Empty!!");
	    return false;
	  }
  
  var z = document.forms["AddCus"]["Ddate"].value;
  if (z == "") {
	    alert("Date cannot be Empty!!");
	    return false;
	  }
  
  var z = document.forms["AddCus"]["NoD"].value;
  if (z == "") {
	    alert("No of Days cannot be Empty!!");
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
          <a href="CustomerForm.jsp" class="active">
            <i class='bx bx-grid-alt' ></i>
            <span class="links_name">Add Form</span>
          </a>
        </li>
        <li>
          <a href="CustomerView.jsp">
            <i class='bx bx-box' ></i>
            <span class="links_name">View Details</span>
          </a>
        </li>
        <li>
          <a href="CustomerSearch.jsp">
            <i class='bx bx-list-ul' ></i>
            <span class="links_name">Search</span>
          </a>
        </li>
        <li>
          <a href="CustomerReport.jsp">
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
   <form name="AddCus" onsubmit="return validateForm()" action="CustomerServlet" method="post">
      <div class="banner">
     <h1>Customer Requirement Form</h1>
      </div>
      <br/>
      <fieldset>
        <legend>Customer Details</legend>
        <div class="columns">
        
          <div class="item">
            <label for="event">Customer Name<span>*</span></label>
            <input id="Cname" type="text" name="Cname" >
          </div>
          <div class="item">
            <label for="venue">Nationality<span>*</span></label>
            <input id="nation" type="text" name="nation" >
          </div>
          <div class="item">
            <label for="type">Email<span>*</span></label>
            <input id="cEmail" type="text"   name="cEmail" >
          </div>
          <div class="item">
            <label for="food">Arrived Date<span>*</span></label>
            <input id="Adate" type="date"   name="Adate" >
            <i class="fas fa-calendar-alt"></i>
          </div>
		   <div class="item">
		  <label for="Ddate">Departure Date<span>*</span></label>
		  <input id="Ddate" type="date" name="Ddate" >
	
		  </div>
          <div class="item">
            <label for="guests">No of Days<span>*</span></label>
            <input id="NoD" type="text"   name="NoD" >
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
