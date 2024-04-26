<?php 

    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/clerk/header.php');
?>

<head>

    <title>Reports</title>
</head>
<!-- Header -->
  <div class="w3-container w3-text-dark-green card recent-sales" style="margin-top:50px ; margin-bottom:20px " id="showcase" >
    <h1 class="w3-xxxlarge "><b>Reports</b></h1>
    <hr style="width:50px;border:5px solid green" class="w3-round">
  </div>
  <div class="pagetitle">
      
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/clerk/dashboard.php">Dashboard</a></li>
          <li class="breadcrumb-item active">Reports</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->
  
<div class="section dashboard col-xlg  col-12 card " style="margin-left:0px ; margin-top:00px ; margin-bottom:100px ; margin-right:000px">
    
    <h3 class="w3-xlarge w3-text-black" style="margin-left:20px ; margin-top:20px ;"><b>Staff Member</b></h3>
     
     <div class="w3-row-padding " style="margin-left:20px ; margin-top:50px ; margin-bottom:50px">
         
    <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
          <a href="http://localhost/test/views/privilages/clerk/reports/staff/staff_members.php" ><li class="w3-blue-green  btn-lg w3-xlarge w3-padding-32">All Staff Members</li></a>
      </ul>
    </div>
        
    <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
        <a href="http://localhost/test/views/privilages/clerk/reports/leaves/leaves.php" ><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Overall Leaves</li></a>
          
      </ul>
    </div>
         
     <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
         <a href="http://localhost/test/views/privilages/clerk/reports/staff/salary.php" ><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Staff Salary</li></a>
        
      </ul>
    </div>
    
  
  </div>
  
    
    
    
    <h3 class="w3-xlarge w3-text-black" style="margin-left:20px ; margin-top:20px ;"><b>Customer</b></h3>
     
     <div class="w3-row-padding" style="margin-left:20px ; margin-top:50px ; margin-bottom:50px">
         
    <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
        <a href="http://localhost/test/views/privilages/clerk/reports/customer/members.php" ><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">All<br>Customers</li></a>
          
      </ul>
    </div>
        
    <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
        <a href="http://localhost/test/views/privilages/clerk/reports/customer/register.php" ><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Registration<br>&#8205;</li></a>
          
      </ul>
    </div>
         
     <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
         <a href="http://localhost/test/views/privilages/clerk/reports/customer/membership_register.php" ><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Membership<br>Registration</li></a>
        
      </ul>
    </div>
    
         <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
         <a href="http://localhost/test/views/privilages/clerk/reports/customer/instructor_allocation.php" ><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Instructor<br>Allocation</li></a>
        
      </ul>
    </div>
         
    
  </div>
    
    
     <h3 class="w3-xlarge w3-text-black" style="margin-left:20px ; margin-top:20px ;"><b>Income & Expenses</b></h3>
     
     <div class="w3-row-padding" style="margin-left:20px ; margin-top:50px ; margin-bottom:50px">
         
         
         <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
         <a href="http://localhost/test/views/privilages/clerk/reports/income_expense/membership_payment.php" ><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Membership<br>Payment</li></a>
        
      </ul>
    </div>
         
    <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
        <a href="http://localhost/test/views/privilages/clerk/reports/income_expense/expense.php" ><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Expense<br>Handling</li></a>
          
      </ul>
    </div>
        
 
         
    
    
         
         
    
  </div>
     
      <h3 class="w3-xlarge w3-text-black" style="margin-left:20px ; margin-top:20px ;"><b>Equipments Purchases</b></h3>
     
     <div class="w3-row-padding" style="margin-left:20px ; margin-top:50px ; margin-bottom:50px">
         
    <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
        <a href="http://localhost/test/views/privilages/clerk/reports/equipments/overall_equipments.php" ><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Overall Equipments</li></a>
          
      </ul>
    </div>
        
    <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
        <a href="http://localhost/test/views/privilages/clerk/reports/equipments/equipments_in_use.php" ><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Equipments In Use</li></a>
          
      </ul>
    </div>
         
     <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
         <a href="http://localhost/test/views/privilages/clerk/reports/equipments/equipments_not_in_use.php" ><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Equipments Not In Use</li></a>
        
      </ul>
    </div>
    
    
         
    
  </div>
    
    
    
    
</div>
        
    
    
    
    
    
    
    

<!-- End page content -->

<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>