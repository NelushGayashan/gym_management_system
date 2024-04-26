<?php 

    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/clerk/header.php');
?>

<head>

    <title>Customer Management</title>
</head>
<!-- Header -->
  <div class="w3-container  w3-text-dark-green card recent-sales" style="margin-top:50px ; margin-bottom:20px " id="showcase" >
    <h1 class="w3-xxxlarge "><b>Customer Management</b></h1>
    <hr style="width:50px;border:5px solid green" class="w3-round">
  </div>
  <div class="pagetitle">
      
      <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/clerk/dashboard.php">Dashboard</a></li>
          <li class="breadcrumb-item active">Customer Management</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->
<div class="section dashboard col-xlg  col-12 card " style="margin-left:0px ; margin-top:00px ; margin-bottom:100px ; margin-right:000px">
    
    <h3 class="w3-xlarge w3-text-black" style="margin-left:20px ; margin-top:20px ;"><b>Fitness Management</b></h3>
     
     <div class="w3-row-padding " style="margin-left:20px ; margin-top:50px ; margin-bottom:50px">
         
    <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
          <a href="http://localhost/test/views/privilages/clerk/customer/view.php" ><li class="w3-blue-green  btn-lg w3-xlarge w3-padding-32">Customer</li></a>
      </ul>
    </div>
        
    <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
        <a href="http://localhost/test/views/privilages/clerk/customer_details/view.php" ><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Customer Details</li></a>
          
      </ul>
    </div>
         
     <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
         <a href="http://localhost/test/views/privilages/clerk/schedule_details/view.php" ><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Schedule Details</li></a>
        
      </ul>
    </div>
    
    <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
        <a href="http://localhost/test/views/privilages/clerk/customer_progress/view.php" ><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Customer Progress</li></a>

      </ul>
    </div>
  </div>
  
    
    
    
    <h3 class="w3-xlarge w3-text-black" style="margin-left:20px ; margin-top:20px ;"><b>Payment Management</b></h3>
     
     <div class="w3-row-padding" style="margin-left:20px ; margin-top:50px ; margin-bottom:50px">
         
    <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
        <a href="http://localhost/test/views/privilages/clerk/membership/view.php" ><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Membership Plans</li></a>
          
      </ul>
    </div>
        
    <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
        <a href="http://localhost/test/views/privilages/clerk/register/view.php" ><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Registration</li></a>
          
      </ul>
    </div>
         
     
    
         <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
         <a href="http://localhost/test/views/privilages/clerk/membership_payment/view.php" ><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Membership Payment</li></a>
        
      </ul>
    </div>
         
    
  </div>
    
    
    
    
    
    
</div>

        
    

<!-- End page content -->

<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>