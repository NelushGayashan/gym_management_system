<?php 

    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/admin/header.php');
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
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/admin/dashboard.php">Dashboard</a></li>
          <li class="breadcrumb-item active">Reports</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->
  
<div class="section dashboard col-xlg  col-12 card " style="margin-left:0px ; margin-top:00px ; margin-bottom:100px ; margin-right:000px">
    
    <h3 class="w3-xlarge w3-text-black" style="margin-left:20px ; margin-top:20px ;"><b>Staff Member</b></h3>
     
     <div class="w3-row-padding " style="margin-left:20px ; margin-top:50px ; margin-bottom:50px">
         
    <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
          <a href="http://localhost/test/views/privilages/admin/reports/staff/staff_members.php" title="Staff Member Employment Details"><li class="w3-blue-green  btn-lg w3-xlarge w3-padding-32 ">All Staff Members</li></a>
      </ul>
    </div>
        
    <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
        <a href="http://localhost/test/views/privilages/admin/reports/leaves/leaves.php" title="Staff Member Leave Details"><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Overall Leaves</li></a>
          
      </ul>
    </div>
         
     <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
         <a href="http://localhost/test/views/privilages/admin/reports/staff/salary.php" title="Staff Member Salary & Wages"><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Staff Salary</li></a>
        
      </ul>
    </div>
    
  
  </div>
  
    
    
    
    <h3 class="w3-xlarge w3-text-black" style="margin-left:20px ; margin-top:20px ;"><b>Customer</b></h3>
     
     <div class="w3-row-padding" style="margin-left:20px ; margin-top:50px ; margin-bottom:50px">
         
    <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
        <a href="http://localhost/test/views/privilages/admin/reports/customer/members.php" title="New Customer Registrations"><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">All<br>Customers</li></a>
          
      </ul>
    </div>
        
    <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
        <a href="http://localhost/test/views/privilages/admin/reports/customer/register.php" title="All Customer Registrations"><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Registration<br>&#8205;</li></a>
          
      </ul>
    </div>
         
     <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
         <a href="http://localhost/test/views/privilages/admin/reports/customer/membership_register.php" title="Customer Registrations By Memberships"><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Membership Registration</li></a>
        
      </ul>
    </div>
    
         <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
         <a href="http://localhost/test/views/privilages/admin/reports/customer/instructor_allocation.php" title="Instructor Allcoation To The Cuctomers"><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Instructor Allocation</li></a>
        
      </ul>
    </div>
         
    
  </div>
    
    
     <h3 class="w3-xlarge w3-text-black" style="margin-left:20px ; margin-top:20px ;"><b>Income & Expenses</b></h3>
     
     <div class="w3-row-padding" style="margin-left:20px ; margin-top:50px ; margin-bottom:50px">
         
         
         <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
         <a href="http://localhost/test/views/privilages/admin/reports/income_expense/membership_payment.php" title="Customer Membership Payments"><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Membership Payment</li></a>
        
      </ul>
    </div>
         
    <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
        <a href="http://localhost/test/views/privilages/admin/reports/income_expense/expense.php" title="Monthly Expenses"><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Expense<br>Handling</li></a>
          
      </ul>
    </div>
        
    <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
        <a href="http://localhost/test/views/privilages/admin/reports/income_expense/income_comparison.php" title="Monthly Income Vs Expenses"><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Income Comparison</li></a>
          
      </ul>
    </div>
         
    
    
         
         
    
  </div>
     
      <h3 class="w3-xlarge w3-text-black" style="margin-left:20px ; margin-top:20px ;"><b>Equipments Purchases</b></h3>
     
     <div class="w3-row-padding" style="margin-left:20px ; margin-top:50px ; margin-bottom:50px">
         
    <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
        <a href="http://localhost/test/views/privilages/admin/reports/equipments/overall_equipments.php" title="All Equipments"><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Overall Equipments</li></a>
          
      </ul>
    </div>
        
    <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
        <a href="http://localhost/test/views/privilages/admin/reports/equipments/equipments_in_use.php" title="Equipments In Use"><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Equipments In Use</li></a>
          
      </ul>
    </div>
         
     <div class="w3-quarter w3-margin-bottom">
      <ul class="w3-ul  w3-center">
         <a href="http://localhost/test/views/privilages/admin/reports/equipments/equipments_not_in_use.php" title="Equipments Not In Use"><li class="w3-blue-green btn-lg w3-xlarge w3-padding-32">Equipments Not In Use</li></a>
        
      </ul>
    </div>
    
    
         
    
  </div>
    
    
    
    
</div>
        
    
    
    
    
    
    
    

<!-- End page content -->

<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>