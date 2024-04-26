<?php 
    require_once('C:/xampp/htdocs/test/controllers/operations_leave_process.php'); 
    $db = new  operations_leave_process();
require_once('C:/xampp/htdocs/test/views/common/styles.php');

?>
<head>

    <title>Add Accepted Leaves Details</title>
</head>
<!-- Header -->
  <div class="w3-container  w3-text-black card recent-sales row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-top:-1000px ; margin-bottom:10px " id="showcase" >
    
      <h1 class="w3-xxlarge "><b>Add Accepted Leave Details</b></h1>
    
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div> 


<div class="pagetitle col-lg-12"  style="margin-top:10px ; margin-bottom:-50px; margin-left:0px ">
      
      <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/clerk/dashboard.php">Dashboard</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/clerk/dashboard.php">Staff Management</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/clerk/leave_details/view.php">View Leave Details</a></li>
          <li class="breadcrumb-item active">Add Accepted Leaves Records</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->

  

        <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px">

                        <?php $db->Store_Record(); ?>
                        
                             <form method="POST" >
				
        
                                
                                
                                
                               
								
                               
                                <input style="margin-bottom:50px" type="hidden" name="id" placeholder=" Accepted Leaves ID" class="form-control mb-2" required >
                                
                                
                                
                                
                                
                                
                                
                                <div class="form-group row" style="margin-bottom:30px;">
                                <label for="Staff ID" class="col-sm-4 col-form-label">Staff ID</label>
                                <div class="col-sm-8">
                                <select required class="custom-select mr-sm-2 " id="staff_id" name="staff_id" >
                                <option value="" selected>Please Select Staff ID...</option>
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
                                <select required class="custom-select mr-sm-2 " id="staff_member_name" name="staff_member_name" >
                                <option value="" selected>Please Select Staff Member Name...</option>
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
                                <input style="margin-bottom:30px" type="date" name="date" placeholder="Date" class="form-control mb-2" required >
                                </div>
                                </div>
                                
                                
                                
                                
                               <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Remarks" class="col-sm-4 col-form-label">Remarks</label>
                                <div class="col-sm-8">
                                        <div class="col-sm-10">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="remark" id="remark1" value="Accepted" >
                                                <label class="form-check-label" for="gridRadios1">
                                                Accepted
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="remark" id="remark2" value="Declined">
                                                <label class="form-check-label" for="gridRadios2">
                                                Declined
                                                </label>
                                            </div>
                                        </div>
                                </div>
                                </div>
                                
                                
                                
                                
                                <div class="form-group row" style="margin-bottom:30px; margin-top:30px">
                                <label for="Staff ID" class="col-sm-4 col-form-label">Leave Process ID</label>
                                <div class="col-sm-8">
                                <select required class="custom-select mr-sm-2 " id="staff_id" name="staff_id" >
                                <option value="" selected>Please Select Leave Process ID...</option>
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
                                
                                
                                
                                
                                
                                
                                
                       					
                             
                                
                        <div  style=" margin-left:400px ; margin-top:50px ; margin-bottom:50px ">
                            <button class="btn btn-success btn-lg" name="submit" style=" margin-right:5px  "> Save </button>
                        </div>
                     
                                

                      
                        
                            </form>
                         
        </div>    
                    
                
        
    

<!-- End page content -->

<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");



// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

$(document).ready(function(){
  $("#myBtn").click(function(){
    $("#myModal").modal();
  });
});

</script>