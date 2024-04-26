<?php 
    require_once('C:/xampp/htdocs/test/controllers/operations_membership_payment.php'); 
    $db = new  operations_membership_payment();
require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/clerk/header.php');
?>

<head>

    <title>Add Membership Payment Details</title>
</head>
<!-- Header -->
  <div class="w3-container  w3-text-black card recent-sales row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-top:-1000px ; margin-bottom:10px " id="showcase" >
    
      <h1 class="w3-xxlarge "><b>Add Membership Payment Details</b></h1>
    
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div> 


<div class="pagetitle col-lg-12"  style="margin-top:10px ; margin-bottom:-50px; margin-left:0px ">
      
 <nav>
       <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/clerk/dashboard.php">Dashboard</a></li>
         <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/clerk/customer_management.php">Customer Management</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/clerk/membership_payment/view.php">View Membership Payment Details</a></li>
          <li class="breadcrumb-item active">Add Membership Payment Records</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->

  

        <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px">

                        <?php $db->Store_Record(); ?>
                        
                             <form method="POST" id="user_form">
				
        
                                                 
				<input style="margin-bottom:30px" type="hidden" name="id" placeholder="Gender ID" class="form-control mb-2" required >
                                
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ; margin-top:30px ">
                                <label for="Date Of Birth" class="col-sm-2 col-form-label">Date</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="date" name="date" placeholder="Date" class="form-control mb-2" required  >
                                </div>
                                <label for="Date Of Joined" class="col-sm-2 col-form-label">Amount</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="number" name="amount" placeholder="Amount" class="form-control mb-2" required  >
                                </div>
                                </div>
                                
                                
                                
                                
                                
                                
                                <div class="form-group row" style="margin-bottom:30px">
                                <label for="Payment Type" class="col-sm-3 col-form-label">Payment Type</label>
                                <div class="col-sm-4">
                                <select required class="custom-select mr-sm-2 " id="payment_payment_type_id" name="payment_payment_type_id" >
                                <option value="" selected>Please Select Payment Type...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `payment_type` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["id"];?>"><?php echo $category["payment_type_name"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                </div>
                                    
                            
                            
                            
                            
                            
                             
                        <div  style=" margin-left:400px ; margin-top:50px ; margin-bottom:50px ">
                            <button id="btn-add" class="btn btn-success btn-lg" name="submit" style=" margin-right:5px  "> Save </button>
                        </div>
                     
                                

                      
                        
                            </form>
                         
        </div>    
                    
                
        
    

<!-- End page content -->

