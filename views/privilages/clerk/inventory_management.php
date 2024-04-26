<?php 

    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/clerk/header.php');
?>

<head>

    <title>Inventory Management</title>
</head>
<!-- Header -->
  <div class="w3-container  w3-text-dark-green card recent-sales" style="margin-top:50px ; margin-bottom:20px " id="showcase" >
    <h1 class="w3-xxxlarge "><b>Inventory Management</b></h1>
    <hr style="width:50px;border:5px solid green" class="w3-round">
  </div>
  <div class="pagetitle">
      
      <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/clerk/dashboard.php">Dashboard</a></li>
          <li class="breadcrumb-item active">Inventory Management</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->
  
<div class="section dashboard col-xlg  col-12 card " style="margin-left:0px ; margin-top:00px ; margin-bottom:100px ; margin-right:000px">
    
    <h3 class="w3-xlarge w3-text-black" style="margin-left:20px ; margin-top:20px ;"><b>Equipment Details</b></h3>
     
     <div class="w3-row-padding" style="margin-left:20px ; margin-top:50px ; margin-bottom:50px">
         
    <div class="w3-third w3-margin-bottom">
      <ul class="w3-ul w3-center">
          <a href="http://localhost/test/views/privilages/clerk/equipment_purchases/view.php" ><li class="w3-blue-green  btn-lg w3-xlarge w3-padding-32">Equipment Purchases</li></a>
      </ul>
    </div>
        
    <div class="w3-third w3-margin-bottom">
      <ul class="w3-ul  w3-center">
        <a href="http://localhost/test/views/privilages/clerk/equipments_in_use/view.php" ><li class="w3-blue-green  btn-lg w3-xlarge w3-padding-32">Equipments In Use</li></a>
          
      </ul>
    </div>
         
     <div class="w3-third w3-margin-bottom">
      <ul class="w3-ul  w3-center">
         <a href="http://localhost/test/views/privilages/clerk/equipments_not_in_use/view.php" ><li class="w3-blue-green  btn-lg w3-xlarge w3-padding-32">Equipments Not In Use</li></a>
        
      </ul>
    </div>
    
    
  </div>
  
    
    
    
    <h3 class="w3-xlarge w3-text-black" style="margin-left:20px ; margin-top:20px ;"><b>Vendor Management</b></h3>
     
     <div class="w3-row-padding" style="margin-left:20px ; margin-top:50px ; margin-bottom:50px">
         
    <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul w3-blue-green  btn-lg w3-center">
          <a href="http://localhost/test/views/privilages/clerk/vendor/view.php" ><li class="w3-blue-green  btn-lg w3-xlarge w3-padding-32">Vendor Details</li></a>
      </ul>
    </div>
        
    
  </div>
    
    
    
    
    
    
</div>

        
    

<!-- End page content -->

<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>