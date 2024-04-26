<?php 
    require_once('C:/xampp/htdocs/test/controllers/operations_leave_process.php'); 
    $db = new  operations_leave_process();
require_once('C:/xampp/htdocs/test/views/common/styles.php');
   
?>

<head>

    <title>Add Leave Process Details</title>
</head>
<!-- Header -->
  <div class="w3-container  col-lg-12 w3-text-black card recent-sales row  m-auto card mt-5 card-body w3-text-black" style="margin-top:-1000px ; margin-bottom:10px " id="showcase" >
    
      <h1 class="w3-xxlarge "><b>Add Leave Process Details</b></h1>
    
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div> 


<div class="pagetitle col-lg-12"  style="margin-top:10px ; margin-bottom:-50px; margin-left:0px ">
      
      <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/admin/dashboard.php">Dashboard</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/dashboard.php">Staff Management</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/leave_process_details/view.php">View Leave Process Details</a></li>
          <li class="breadcrumb-item active">Add Leave Process Records</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->

        <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px">

                        <?php $db->Store_Record(); ?>
                        
                             <form method="POST" id="user_form">
                                
                                
				<input type="hidden" name="id" placeholder="Leave Process ID" class="form-control mb-2" required>
				
                                
                                <div class="form-group row" style="margin-bottom:30px; margin-top:30px">
                                <label for="Staff ID" class="col-sm-4 col-form-label">Staff ID</label>
                                <div class="col-sm-8">
                                <select required class="custom-select mr-sm-2 " id="staff_id" name="staff_id" >
                                <option value="" selected>Please Select Staff ID...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `staff`";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["id"];?>"><?php echo $category["id"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                </div>
                                
                                
                                
                                <div class="form-group row" style="margin-bottom:30px">
                                <label for="Staff Member Name" class="col-sm-4 col-form-label">Staff Member Name</label>
                                <div class="col-sm-8">
                                <select required class="custom-select mr-sm-2 " id="staff_member_name" name="staff_member_name" >
                                <option value="" selected>Please Select Staff Member Name...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `staff`";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["fname"]." ".$category["lname"];?>"><?php echo $category["fname"]." ".$category["lname"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                </div>
                                
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Date" class="col-sm-4 col-form-label">Date</label>
                                <div class="col-sm-8">
                                <input style="margin-bottom:30px" type="date" name="date" placeholder="Date" class="form-control mb-2" required >
                                </div>
                                </div>
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Date" class="col-sm-4 col-form-label">Date</label>
                                <div class="col-sm-8">
                                <input style="margin-bottom:30px" type="text" name="remark" placeholder="Remarks" class="form-control mb-2" required >
                                </div>
                                </div>
                                
                                
                                
                                
                                <div class="form-group row" style="margin-bottom:30px; margin-top:30px">
                                <label for="Leave Details ID" class="col-sm-4 col-form-label">Leave Details ID</label>
                                <div class="col-sm-8">
                                <select required class="custom-select mr-sm-2 " id="leave_details_id" name="leave_details_id" >
                                <option value="" selected>Please Select Leave Details ID...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `leave_details`";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["id"];?>"><?php echo $category["id"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                </div>
                                				
                  
                        <div  style=" margin-left:400px ; margin-top:50px ; margin-bottom:50px ">
                            <button class="btn btn-success btn-lg" name="submit" style=" margin-right:5px  "> Save </button>
                        </div>
                     
                                

                      
                        
                            </form>
                         
                    
                    
                
        </div>
    

<!-- End page content -->




