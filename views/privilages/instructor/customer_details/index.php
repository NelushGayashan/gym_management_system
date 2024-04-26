<?php 
    require_once('C:/xampp/htdocs/test/controllers/operations_customer_details.php'); 
    $db = new  operations_customer_details();
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/instructor/header.php');
?>

<head>

    <title>Add Customer Physical Measurement Details</title>
</head>
<!-- Header -->
  <div class="w3-container  w3-text-black card recent-sales row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-top:-1000px ; margin-bottom:10px " id="showcase" >
    
      <h1 class="w3-xxlarge "><b>Add Customer Physical Measurement Details</b></h1>
    
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div> 


<div class="pagetitle col-lg-12"  style="margin-top:10px ; margin-bottom:-50px; margin-left:0px ">
      
 <nav>
       <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/instructor/dashboard.php">Dashboard</a></li>
         <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/instructor/customer_management.php">Customer Management</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/instructor/customer_details/view.php">View Customer Physical Measurement Details</a></li>
          <li class="breadcrumb-item active">Add Customer Physical Measurement Records</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->

  

        <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px">

                        <?php $db->Store_Record(); ?>
                        
                             <form method="POST" id="user_form">
				
        
                                
				
                               
                                <input style="margin-bottom:30px" type="hidden" name="id" placeholder=" Customer Details ID " class="form-control mb-2" required >
                                
                               
                                
                                
                                
                                <div class="form-group row" style="margin-bottom:30px; margin-top:30px">
                                <label for="Customer's First Name" class="col-sm-3 col-form-label">Customer Name</label>
                                <div class="col-sm-4">
                                <select required class="custom-select mr-sm-2 " id="name" name="name" >
                                <option value="" selected>Please Select Customer Name...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `customer` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["fname"]." ".$category["lname"];?>"><?php echo $category["fname"]." ".$category["lname"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                <label for="Customer's First Name" class="col-sm-1 col-form-label">ID</label>
                                <div class="col-sm-4">
                                <select required class="custom-select mr-sm-2 " id="customer_id" name="customer_id" >
                                <option value="" selected>Please Select Customer ID...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `customer` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["id"];?>"><?php echo $category["id"]." ".$category["fname"]." ".$category["lname"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                </div>
                                
                                
                               
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Height" class="col-sm-1 col-form-label">Height</label>
                                <div class="col-sm-3">
                                <input style="margin-bottom:30px" type="decimal" name="height" placeholder="Height in cm" class="form-control mb-2" required>
                                </div>
                                <label for="Age" class="col-sm-1 col-form-label">Age </label>
                                <div class="col-sm-3">
                                <input style="margin-bottom:30px" type="number" name="age" placeholder="Age" class="form-control mb-2" required>
                                </div>
                                <label for="Weight" class="col-sm-1 col-form-label">Weight</label>
                                <div class="col-sm-3">
                                <input style="margin-bottom:30px" type="decimal" name="weight" placeholder="Weight in kg" class="form-control mb-2" required >
                                </div>
                                
                                </div>
                                
                                
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Arm Sizes" class="col-sm-2 col-form-label">Arm Sizes</label>
                                <div class="col-sm-3">
                                <input style="margin-bottom:30px" type="decimal" name="arm_sizes" placeholder="Arm Sizes in inches" class="form-control mb-2" required >
                                </div>
                                <label for="Telephone Number" class="col-sm-2 col-form-label">Chest Size </label>
                                <div class="col-sm-3">
                                <input style="margin-bottom:30px" type="decimal" name="chest" placeholder="Chest in inches" class="form-control mb-2" required  >
                                </div>
                                </div>
                                
                                
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Issues" class="col-sm-2 col-form-label">Issues</label>
                                <div class="col-sm-10">
                                <input style="margin-bottom:30px" type="text" name="issues" placeholder="Issues" class="form-control mb-2" required >
                                </div>
                                </div>
                                
                                 
                               
                                
                                
                                
                                <div class="form-group row" style="margin-bottom:30px">
                                <label for="Customer's First Name" class="col-sm-3 col-form-label">Allocated Instructor</label>
                                <div class="col-sm-6">
                                <select required class="custom-select mr-sm-2 " id="staff_id" name="staff_id" >
                                <option value="" selected>Please Select Allocated Instructor...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `staff` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["id"];?>"><?php echo $category["fname"]." ".$category["lname"];?></option>
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

