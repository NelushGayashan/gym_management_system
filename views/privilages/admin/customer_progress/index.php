<?php 
    require_once('C:/xampp/htdocs/test/controllers/operations_customer_progress.php'); 
    $db = new  operations_customer_progress();

    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/admin/header.php');
?>

<head>

    <title>Add Customer Progress Details</title>
</head>
<!-- Header -->
  <div class="w3-container  w3-text-black card recent-sales row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-top:-1000px ; margin-bottom:10px " id="showcase" >
    
      <h1 class="w3-xxlarge "><b>Add Customer Progress Details</b></h1>
    
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div> 


<div class="pagetitle col-lg-12"  style="margin-top:10px ; margin-bottom:-50px; margin-left:0px ">
      
 <nav>
       <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/admin/dashboard.php">Dashboard</a></li>
         <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/customer_management.php">Customer Management</a></li>
         <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/customer_progress/view.php">View Customer Progress Details</a></li>
          
          <li class="breadcrumb-item active">Add Customer Progress Records</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->

  

        <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px">

                        <?php $db->Store_Record(); ?>
                        
                             <form method="POST" id="user_form">
				
				
                                
								
                               
                                <input style="margin-bottom:30px" type="hidden" name="id" placeholder="Customer Progress ID" class="form-control mb-2" required >
                                
                                
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ; margin-top:30px ">
                                <label for="Address" class="col-sm-3 col-form-label">Progress Details</label>
                                <div class="col-sm-9">
                                    <textarea style="margin-bottom:30px" type="text" name="progress_details" placeholder="Progress Details" class="form-control mb-2" required ></textarea>
                                </div>
                                </div>
                                
                                
                                
                                
                                <div class="form-group row" style="margin-bottom:30px; ">
                                <label for="Schedule Detail ID" class="col-sm-3 col-form-label">Schedule Details ID</label>
                                <div class="col-sm-6">
                                <select required class="custom-select mr-sm-2 " id="schedule_details_id" name="schedule_details_id" >
                                <option value="" selected>Please Select Schedule Details ID...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `schedule_details` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["id"];?>"><?php echo $category["id"]." ".$category["customer_details_id"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                </div>
                                
                                
                                
                                
                                
                                
                                <div class="form-group row" style="margin-bottom:30px; ">
                                <label for="Customer's First Name" class="col-sm-3 col-form-label">Customer Details ID</label>
                                <div class="col-sm-6">
                                <select required class="custom-select mr-sm-2 " id="customer_details_id" name="customer_details_id" >
                                <option value="" selected>Please Select Customer Detail ID...</option>
                                 <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `schedule_details` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["customer_details_id"];?>"><?php echo $category["customer_details_id"];?></option>
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