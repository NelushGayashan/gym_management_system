<?php 
    require_once('C:/xampp/htdocs/test/controllers/operations_declined_leaves.php'); 
    $db = new  operations_declined_leaves();
    $db->update();
    $id = $_GET['U_ID'];
    $result = $db->get_record($id);
    $data = mysqli_fetch_assoc($result);
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/clerk/header.php');
?>

<head>
    <title> Edit Declined Leaves Details </title>
</head>
<!-- Header -->
  <div class="w3-container  col-lg-12 w3-text-black card recent-sales row  m-auto card mt-5 card-body w3-text-black" style="margin-top:-1000px ; margin-bottom:10px " id="showcase" >
   
    <h1 class="w3-xxxlarge w3-text-black"><b>Edit Declined Leaves Details</b></h1>
    <hr style="width:50px;border:5px solid green" class="w3-round">
  </div>


<div class="pagetitle col-lg-12"  style="margin-top:10px ; margin-bottom:-50px; margin-left:0px ">
      
      <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/clerk/dashboard.php">Dashboard</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/clerk/dashboard.php">View Declined Leave Details</a></li>
          <li class="breadcrumb-item active">Edit Declined Leaves Details</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->
  

        <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px">
            
                        <?php $db->Store_Record(); ?>
            
                        
                            
                            <form method="POST">
                               
                               
                               <input style="margin-bottom:30px" type="hidden" name="id" placeholder=" Accepted Leaves ID" class="form-control mb-2" required value="<?php echo $data['id']; ?>">
                                
                                
                                
                                
                                <div class="form-group row" style="margin-bottom:30px; margin-top:30px">
                                <label for="Staff ID" class="col-sm-4 col-form-label">Staff ID</label>
                                <div class="col-sm-8">
                                <select  class="custom-select mr-sm-2 " id="staff_id" name="staff_id" >
                                <option value="<?php echo $data['staff_id']; ?>" selected><?php echo $data['staff_id']; ?></option>
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
                                </div>
                                
                                
                                <div class="form-group row" style="margin-bottom:30px">
                                <label for="Staff Member Name" class="col-sm-4 col-form-label">Staff Member Name</label>
                                <div class="col-sm-8">
                                <select  class="custom-select mr-sm-2 " id="staff_member_name" name="staff_member_name" >
                                <option value="<?php echo $data['staff_member_name']; ?>" selected><?php echo $data['staff_member_name']; ?></option>
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
                               
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Date" class="col-sm-4 col-form-label">Date</label>
                                <div class="col-sm-8">
                                <input style="margin-bottom:30px" type="date" name="date" placeholder="Date" class="form-control mb-2" required value="<?php echo $data['date']; ?>" >
                                </div>
                                </div>
                                
                                
                                
                                
                                <div class="form-group row" style="margin-bottom:30px">
                                <label for="Staff Member Name" class="col-sm-4 col-form-label">Leave Details ID</label>
                                <div class="col-sm-8">
                                <select  class="custom-select mr-sm-2 " id="leave_process_id" name="leave_process_id" >
                                <option value="<?php echo $data['leave_process_id']; ?>" selected><?php echo $data['leave_process_id']; ?></option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `leave_process` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["id"];?>"><?php echo $category["id"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                </div>
                                
                                
                                
                                
                        <div class="card-footer" style=" margin-left:400px ; margin-top:100px ; margin-bottom:100px">
                                    <button class="btn btn-success btn-lg" name="btn_update"> Update </button>
                                </div>

                             </form>
                
        </div>
<!-- End page content -->

<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>