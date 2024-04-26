<?php
    require_once('C:/xampp/htdocs/test/controllers/operations_staff.php'); 
    $db = new  operations_staff();
require_once('C:/xampp/htdocs/test/views/common/styles.php');

?>

<head>

    <title>Add Staff Details</title>
</head>
<!-- Header -->
  <div class="w3-container  w3-text-black card recent-sales row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-top:-1000px ; margin-bottom:10px " id="showcase" >
    
      <h1 class="w3-xxlarge "><b>Add Staff Details</b></h1>
    
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div> 


<div class="pagetitle col-lg-12"  style="margin-top:10px ; margin-bottom:-50px; margin-left:0px ">
      
      <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/admin/dashboard.php">Dashboard</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/dashboard.php">Staff Management</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/staff/view.php">View Staff Details</a></li>
          <li class="breadcrumb-item active">Add Staff Records</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->

  

        <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px">

                        <?php $db->Store_Record(); ?>
            
                        
                            
                            <form method="POST" id="user_form">
                                
                            <input style="margin-bottom:30px" type="hidden" name="id" placeholder=" Staff Member ID" class="form-control mb-2" required ">
                            
                            
                            
                            
                            
                            
                            
                                <div class="form-group row" style="margin-bottom:30px">
                                <label for="Staff Member First Name" class="col-sm-4 col-form-label">Staff Member First Name</label>
                                <div class="col-sm-8">
                                <select required class="custom-select mr-sm-2 " id="fname" name="fname" >
                                <option value="" selected>Please Enter Staff Member's First Name...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `useraccount` where role_id='R-00001' or role_id='R-00002' or role_id='R-00003' ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["fname"];?>"><?php echo $category["fname"]." ".$category["lname"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                </div>
                            
                            
                            
                                <div class="form-group row" style="margin-bottom:30px">
                                <label for="Staff Member Last Name" class="col-sm-4 col-form-label">Staff Member Last Name</label>
                                <div class="col-sm-8">
                                <select required class="custom-select mr-sm-2 " id="lname" name="lname" >
                                <option value="" selected>Please Enter Staff Member's Last Name...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `useraccount` where role_id='R-00001' or role_id='R-00002' or role_id='R-00003' ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["lname"];?>"><?php echo $category["lname"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                </div>
                            
                            
                            
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Address" class="col-sm-2 col-form-label">Address</label>
                                <div class="col-sm-4">
                                    <textarea style="margin-bottom:30px" type="text" name="address" placeholder="Address" class="form-control mb-2" required  ></textarea>
                               
                                </div>
                                <label for="Description" class="col-sm-2 col-form-label">Description</label>
                                <div class="col-sm-4">
                                    <textarea style="margin-bottom:30px" type="text" name="description" placeholder="Description" class="form-control mb-2" required ></textarea>
                               
                                </div>
                                </div>
                            
                                
                            
                            
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Telephone Number" class="col-sm-2 col-form-label">Telephone </label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" name="telephone" type="tel"  placeholder="0771231234" pattern="[0-9]{10}" class="form-control mb-2" required  >
                                </div>
                                <label for="Email" class="col-sm-2 col-form-label">Email</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="email" name="email" placeholder="Email" class="form-control mb-2" required  >
                                </div>
                                </div>
                            
                            
                            
                          
                            
                            
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Date Of Birth" class="col-sm-2 col-form-label">Date Of Birth</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="date" name="dob" placeholder="Date Of Birth" class="form-control mb-2" required  >
                                </div>
                                <label for="Date Of Joined" class="col-sm-2 col-form-label">Date Of Joined</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="date" name="doj" placeholder="Date Of Joined" class="form-control mb-2" required  >
                                </div>
                                </div>
                            
                            
                                
                            
                                <div class="form-group row " style="margin-bottom:30px ">
                                    
                                <label for="Gender ID" class="col-sm-2 col-form-label">Gender</label>
                                <div class="col-sm-4">
                                <select required class="custom-select mr-sm-2 " id="gender_id" name="gender_id" >
                                <option value="" selected>Please Enter Gender...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `gender` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["id"];?>"><?php echo $category["gender"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                
                                
                                <label for="Designation ID" class="col-sm-2 col-form-label">Designation ID</label>
                                <div class="col-sm-4">
                                <select required class="custom-select mr-sm-2 " id="designation_id" name="designation_id" >
                                <option value="" selected>Please Enter Designation...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `designation` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["id"];?>"><?php echo $category["id"]."-".$category["name"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                
                                </div>
                                
                            
                            
                            
                            
                            
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="User Account Role ID" class="col-sm-2 col-form-label">Role ID</label>
                                <div class="col-sm-4">
                                <select required class="custom-select mr-sm-2 " id="useraccount_role_id" name="useraccount_role_id" >
                                <option value="" selected>Please Enter Role...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `role` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["id"];?>"><?php echo $category["id"]."-".$category["name"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                
                                
                                
                                <label for="User Account ID" class="col-sm-2 col-form-label">User ID</label>
                                <div class="col-sm-4">
                                <select required class="custom-select mr-sm-2 " id="useraccount_id" name="useraccount_id" >
                                <option value="" selected>Please Enter User Account ID...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `useraccount` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["id"];?>"><?php echo $category["id"]."-".$category["user_name"];?></option>
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

