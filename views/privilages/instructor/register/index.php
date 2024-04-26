<?php 
    require_once('C:/xampp/htdocs/test/controllers/operations_register.php'); 
    $db = new  operations_register();
 require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/admin/header.php');
?>

<head>

    <title>Add Registration Details</title>
</head>
<!-- Header -->
  <div class="w3-container  w3-text-black card recent-sales row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-top:-1000px ; margin-bottom:10px " id="showcase" >
    
      <h1 class="w3-xxlarge "><b>Add Registration Details</b></h1>
    
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div> 


<div class="pagetitle col-lg-12"  style="margin-top:10px ; margin-bottom:-50px; margin-left:0px ">
      
 <nav>
       <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/admin/dashboard.php">Dashboard</a></li>
         <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/customer_management.php">Customer Management</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/register/view.php">View Registration Details</a></li>
          <li class="breadcrumb-item active">Add Registration Records</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->

  

        <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px">

                        <?php $db->Store_Record(); ?>
                        
                             <form method="POST" id="user_form">
				
        
                                      
                                
				<input style="margin-bottom:30px" type="hidden" name="id" placeholder=" Registration ID" class="form-control mb-2" required >
                                
                                
                                
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ; margin-top: 30px">
                                <label for="Customer ID" class="col-sm-2 col-form-label">Customer ID</label>
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
                                <label for="Payment ID" class="col-sm-1 col-form-label">Date</label>
                                <div class="col-sm-4">
                                <select required class="custom-select mr-sm-2 " id="date" name="date" >
                                <option value="" selected>Please Select Date...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `membership_payment` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["date"];?>"><?php echo $category["id"]." ".$category["date"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                <label for="Membership ID" class="col-sm-3 col-form-label">Registration Fee</label>
                                <div class="col-sm-4">
                                <select required class="custom-select mr-sm-2 " id="reg_fee" name="reg_fee" >
                                <option value="" selected>Please Select Registration Fee...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `membership` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["fee"];?>"><?php echo $category["id"]." ".$category["name"]." ".$category["fee"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                </div>
                                
                                
                                
                                
                                
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Date Of Birth" class="col-sm-2 col-form-label">Remarks</label>
                                <div class="col-sm-10">
                                <input style="margin-bottom:30px" type="text" name="remark" placeholder="Remarks" class="form-control mb-2" required  >
                                </div>
                                </div>
                                
                                
                                
                                
                                
                                
                                
                                <div class="form-group row" style="margin-bottom:30px; ">
                                <label for="Membership ID" class="col-sm-2 col-form-label">Membership ID</label>
                                <div class="col-sm-4">
                                <select required class="custom-select mr-sm-2 " id="membership_id" name="membership_id" >
                                <option value="" selected>Please Select Membership ID...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `membership` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["id"];?>"><?php echo $category["id"]." ".$category["name"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                <label for="Payment ID" class="col-sm-2 col-form-label">Payment ID</label>
                                <div class="col-sm-4">
                                <select required class="custom-select mr-sm-2 " id="membership_payment_id" name="membership_payment_id" >
                                <option value="" selected>Please Select Payment ID...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `membership_payment` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["id"];?>"><?php echo $category["id"]." ".$category["date"];?></option>
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

