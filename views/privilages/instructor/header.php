<?php 
ob_start();
    if(!isset($_SESSION['id'])){
        
        
        ?><!DOCTYPE html><html><title>Login Here</title><body onload="alert('<?php echo 'You must login first! '; ?>')"> <?php
        
        echo "<script>window.location.href='http://localhost/test/views/common/login/login.php';</script>";
        echo'<script>alert("You must login first! ")</script>';

       
    }
else{
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/instructor/header.php');}

?>
<style>

body {font-size:16px;}

</style>
<nav class="navbar navbar-expand-lg" >
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header ">
      <button type="button" class=" navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a href="http://localhost/test/views/common/homepage.php" class="logo d-flex align-items-center">
        
        <span class="d-none d-lg-block navbar-left w3-text-white" style="margin-top: 0px;margin-left: -30px;margin-right: -300px;">
            <img src="http://localhost/test/views/common/assets/img/favicon.ico" href="http://localhost/test/views/common/homepage.php">Fitness For Everyone</span>
      </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="myNavbar" style="margin-left: 100px">

     
      <ul class="nav navbar-nav navbar-right " style="margin-left: 825px ">
        
        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0 w3-light-green" href="#" data-bs-toggle="dropdown" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            
            <span class="d-none d-md-block dropdown-toggle ps-2 " style=" letter-spacing: 0px; font-size: 20px;"><i class="bi bi-file-person-fill"></i> Manage Account</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            

              <li>
              <a class="dropdown-item d-flex align-items-center w3-light-green12 w3-text-black" href="http://localhost/test/views/privilages/instructor/edit.php?U_ID=<?php echo $_SESSION['id'];  ?>">
                <i class="bi bi-gear"></i>
                <span class="w3-text-light-green " style=" letter-spacing: 0px; font-size: 15px;">Account Settings</span>
              </a>
                  </li>
            
            <li>
              <hr class="dropdown-divider">
            </li>

           
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center w3-text-light-green w3-light-green12" href="http://localhost/test/views/common/login/logout.php">
                <i class="bi bi-box-arrow-right"></i>
                <span class="w3-text-light-green" style=" letter-spacing: 0px;font-size: 15px;">Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<body >

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-light-green w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:280px;font-weight:bold;position: fixed;" id="mySidebar"><br>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft w3-light-green12" style="width:100%;font-size:22px">Close Menu</a>
  <div class="w3-container" style="margin-top: -100px;position: relative;">
      <h3 class="w3-padding-64"></h3>
  </div>
  <ul class="sidebar-nav " id="sidebar-nav" >

      <li class="nav-item">
        <a class="nav-link collapsed" href="http://localhost/test/views/privilages/instructor/dashboard.php">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->

      
      <li class="nav-item">
        <a class="nav-link collapsed"  href="http://localhost/test/views/privilages/instructor/attendance/view.php">
        <i class="bi bi-calendar-check"></i>
            <span>Attendance Details</span>
         
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link collapsed"  href="http://localhost/test/views/privilages/instructor/leave_details/view.php">
           <i class="bi bi-calendar-day"></i>
          <span>Leave Apply</span>
        </a>
      </li> 
      
      <li class="nav-item">
        <a class="nav-link collapsed"  href="http://localhost/test/views/privilages/instructor/salary/view.php">
            <i class="bi bi-cash-stack"></i>
          <span>Salary Details</span>
        </a>
      </li>
        

      <li class="nav-item">
        <a class="nav-link collapsed"  href="http://localhost/test/views/privilages/instructor/customer_management.php">
          <i class="bi bi-person-lines-fill"></i>
          <span>Customer Management</span>
        </a>
          </li>
        
    
  </ul>       
          
</nav>

<!-- Top menu on small screens -->
<header class="w3-container w3-top  w3-neon-green w3-xlarge w3-padding">
  <a href="javascript:void(0)" class="w3-button w3-light-green12 w3-margin-right" onclick="w3_open()">☰</a>
  
</header>
<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large " onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
<script>
// Script to open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}
</script>



<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:340px;margin-right:40px">

