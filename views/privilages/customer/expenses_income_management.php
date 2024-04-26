<?php 

    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/clerk/header.php');
?>

<head>

    <title>Expenses And Income Management</title>
</head>
<!-- Header -->
  <div class="w3-container  w3-text-dark-green card recent-sales" style="margin-top:50px ; margin-bottom:20px " id="showcase" >
    <h1 class="w3-xxxlarge "><b>Expenses And Income Management</b></h1>
    <hr style="width:50px;border:5px solid green" class="w3-round">
  </div>
  <div class="pagetitle">
      
      <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/clerk/dashboard.php">Dashboard</a></li>
          <li class="breadcrumb-item active">Expenses And Income Management</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->
  
<div class="section dashboard col-xlg  col-12 card " style="margin-left:0px ; margin-top:00px ; margin-bottom:100px ; margin-right:000px">
    
    <h3 class="w3-xlarge w3-text-black" style="margin-left:20px ; margin-top:20px ;"><b>Expenses</b></h3>
     
     <div class="w3-row-padding" style="margin-left:20px ; margin-top:50px ; margin-bottom:50px">
         
    <div class="w3-half w3-margin-bottom">
      <ul class="w3-ul w3-center">
          <a href="http://localhost/test/views/privilages/clerk/expenses/view.php" ><li class="w3-blue-green  btn-lg w3-xlarge w3-padding-32">Expenses</li></a>
      </ul>
    </div>
        
    <div class="w3-half w3-margin-bottom">
      <ul class="w3-ul w3-light-grey w3-center">
        <a href="http://localhost/test/views/privilages/clerk/outstanding/view.php" ><li class="w3-blue-green  btn-lg w3-xlarge w3-padding-32">Outstanding</li></a>
          
      </ul>
    </div>
         
    
  </div>
  
    
    
    
    <h3 class="w3-xlarge w3-text-black" style="margin-left:20px ; margin-top:20px ;"><b>Income</b></h3>
     
     <div class="w3-row-padding" style="margin-left:20px ; margin-top:50px ; margin-bottom:50px">
         
   
         
         <div class="w3-half w3-margin-bottom">
      <ul class="w3-ul  w3-center">
         <a href="http://localhost/test/views/privilages/clerk/payment/view.php" ><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Payment</li></a>
        
      </ul>
    </div>
    
  </div>
    
    
    
    
    
    
</div>

        
    

<!-- End page content -->

<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>