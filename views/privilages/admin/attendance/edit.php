<?php

require_once('C:/xampp/htdocs/test/controllers/operations_attendance.php'); 
$db = new  operations_attendance();
$db->update();
$id = $_GET['U_ID'];
$result = $db->get_record($id);
$data = mysqli_fetch_assoc($result);

require_once('C:/xampp/htdocs/test/views/common/styles.php');
require_once('C:/xampp/htdocs/test/views/privilages/admin/header.php');

?>

<head>
    <title>Edit Attendance Details</title>
</head>
<!-- Header -->
  <div class="w3-container  col-lg-12 w3-text-black card recent-sales row  m-auto card mt-5 card-body w3-text-black" style="margin-top:-1000px ; margin-bottom:10px " id="showcase" >
   
    <h1 class="w3-xxlarge w3-text-black"><b> Edit Attendance Details</b></h1>
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div>


<div class="pagetitle col-lg-12"  style="margin-top:10px ; margin-bottom:-50px; margin-left:0px ">
      
      <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/admin/dashboard.php">Dashboard</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/dashboard.php">Staff Management</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/attendance/view.php">View Attendance Details</a></li>
          <li class="breadcrumb-item active">Edit Attendance Records</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->
  

        <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px">
            
                        <?php $db->Store_Record(); ?>
            
                        
                            
                            <form method="POST">
            
                                <input style="margin-bottom:30px" type="hidden" name="id" placeholder=" Attendance ID" class="form-control mb-2" required value="<?php echo $data['id']; ?>">
                                
                                    
                                    
                                    
                                <div class="form-group row" style="margin-bottom:30px; margin-top:30px">
                                <label for="Staff ID" class="col-sm-1 col-form-label">Staff ID</label>
                                <div class="col-sm-4">
                                <select required class="custom-select mr-sm-2 " id="staff_id" name="staff_id" >
                                <option required value="<?php echo $data['staff_id']; ?>" selected><?php echo $data['staff_id']; ?></option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `staff` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["id"];?>"><?php echo $category["id"]."-".$category["fname"]." ".$category["lname"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                <label for="Staff Member Name" class="col-sm-3 col-form-label">Staff Member Name</label>
                                <div class="col-sm-4">
                                <select required class="custom-select mr-sm-2 " id="staff_member_name" name="staff_member_name" >
                                <option required value="<?php echo $data['staff_member_name']; ?>" selected><?php echo $data['staff_member_name']; ?></option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `staff` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["fname"]." ".$category["lname"];?>"><?php echo $category["fname"]." ".$category["lname"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                </div>    
                                    
                                    
                                    
                                
                                    
                                <div class="form-group row" style="margin-bottom:30px;">
                                <label for="Staff ID" class="col-sm-3 col-form-label">Staff Designation ID</label>
                                <div class="col-sm-4">
                                <select required class="custom-select mr-sm-2 " id="staff_designation_id" name="staff_designation_id" >
                                <option required value="<?php echo $data['staff_designation_id']; ?>" selected><?php echo $data['staff_designation_id']; ?></option>
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
                                <label for="Date" class="col-sm-1 col-form-label">Date</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="date" name="date" placeholder="Date" class="form-control mb-2" required value="<?php echo $data['date']; ?>" >
                                </div>
                                </div>
                               
                                    
                                <div class="form-group row" style="margin-bottom:30px; ">    
                                <label for="In Time" class="col-sm-2 col-form-label">In Time</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="time" name="intime" placeholder="In Time" class="form-control mb-2" required value="<?php echo $data['intime']; ?>" >
                                </div>
                                <label for="Out Time" class="col-sm-2 col-form-label">Out Time</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="time" name="outtime" placeholder="In Time" class="form-control mb-2" required value="<?php echo $data['outtime']; ?>" >
                                </div>
                                </div>
                                
                                
                                
                                
                                
                                
                                <div  style=" margin-left:400px ; margin-top:100px ; margin-bottom:100px">
                                    <button  class="btn btn-success btn-lg" name="btn_update" onclick="myFunction()" id="myBtn"> Update </button>
                                </div>
                            
                            
                            <script>
                            function myFunction() {
                                
                            var a = document.getElementById("intime").value;
                            var b = document.getElementById("outtime").value;
                                if(b<=a){
                                    alert("Check intime & outtime again.\n Try again. ");
                                    return false;
                                }
                            }
                            </script>
                            
                            
                            
                            
                            
                             </form>
                
        </div>
<!-- End page content -->

<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>


