<?php
    require_once('C:/xampp/htdocs/test/controllers/operations_equipment_purchases.php'); 
    $db = new  operations_equipment_purchases();
require_once('C:/xampp/htdocs/test/views/common/styles.php');

?>

<head>

    <title>Add Equipment Purchases Details</title>
</head>
<!-- Header -->
<div class="w3-container  w3-text-black card recent-sales row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-top:-1000px ; margin-bottom:10px " id="showcase" >
    
      <h1 class="w3-xxlarge "><b>Add Equipment Purchases Details</b></h1>
    
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div> 


<div class="pagetitle col-lg-12"  style="margin-top:10px ; margin-bottom:-50px; margin-left:0px ">
      
      <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/clerk/dashboard.php">Dashboard</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/clerk/inventory_management.php">Inventory Management</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/clerk/equipment_purchases/view.php">View Equipment Purchases Details</a></li>
          <li class="breadcrumb-item active">Add Equipment Purchases Records</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->

  

        <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px">

                        <?php $db->Store_Record(); ?>
                        
                              <form method="POST" id="user_form">
                                
                            <input style="margin-bottom:30px" type="hidden" name="id" placeholder=" Equipment Purchase ID" class="form-control mb-2" required >
                            
                            
                            
                                
                            
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Name Of The Equipment" class="col-sm-4 col-form-label">Name Of The Equipment</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="text" name="name" placeholder="Name Of The Equipment" class="form-control mb-2" required >
                                </div>
                                <label for="Quantity" class="col-sm-2 col-form-label">Quantity</label>
                                <div class="col-sm-2">
                                <input style="margin-bottom:30px" type="number" name="quantity" placeholder="Quantity" class="form-control mb-2" required >
                                </div>
                                </div>
                            
                            
                                
                            
                            
                            
                            
                            
                                <div class="form-group row" style="margin-bottom:30px">
                                   
                                
                                <label for="Cost Of The Equipment" class="col-sm-4 col-form-label">Cost Of The Equipment</label>
                                <div class="col-sm-8">
                                <select  class="custom-select mr-sm-2 " id="cost" name="cost" >
                               <option value="" selected>Please Select Cost Of The Equipment...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `payment` where status = 'equipment' ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["amount"];?>"><?php echo $category["id"]."-".$category["amount"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                </div>
                            
                            
                            
                            
                                <div class="form-group row" style="margin-bottom:30px">
                                <label for="Purchased Date" class="col-sm-4 col-form-label">Purchased Date</label>
                                <div class="col-sm-4">
                                <select  type="date" class="custom-select mr-sm-2 " id="purchased_date" name="purchased_date" >
                                <option value="" selected>Please Select Cost Of Purchased Date...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `payment` where status = 'Equipment' ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["date"];?>"><?php echo $category["id"]."-".$category["date"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                </div>
                                
                            
                                
                            
                            
                                
                                <div class="form-group row" style="margin-bottom:30px">
                                <label for="Status Of The Equipment" class="col-sm-4 col-form-label">Status Of The Equipment</label>
                                <div class="col-sm-4">
                                <div class="col-sm-10">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="status" id="Active" value="Active" required>
                                        <label class="form-check-label" for="Active">
                                             Active
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="status" id="Deactive" value="Deactive" required>
                                        <label class="form-check-label" for="Deactive">
                                            De-active
                                        </label>
                                    </div>
                                </div>
                                </div> 
                                </div> 
                            
                            <input style="margin-bottom:30px" type="hidden" name="remark" placeholder=" Equipment Purchase ID" class="form-control mb-2" required >
                            
                           
                            
                                
                            
                                <div class="form-group row" style="margin-bottom:30px">
                                <label for="Vendor ID" class="col-sm-2 col-form-label">Vendor ID</label>
                                <div class="col-sm-4">
                                <select  class="custom-select mr-sm-2 " id="vendor_id" name="vendor_id" >
                               <option value="" selected>Please Select Vendor ID...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `vendor` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["id"];?>"><?php echo $category["id"]."-".$category["name"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                <label for="Vendor Name" class="col-sm-2 col-form-label">Vendor Name</label>
                                <div class="col-sm-4">
                                <select  class="custom-select mr-sm-2 " id="vendor_name" name="vendor_name" >
                               <option value="" selected>Please Select Vendor Name...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `vendor` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["name"];?>"><?php echo $category["name"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                </div>
                            
                            
                            
                            
                                
                            
                            
                                
                            
                            
                                <div class="form-group row" style="margin-bottom:30px">
                                 <label for="Payment ID" class="col-sm-2 col-form-label">Payment ID</label>
                                <div class="col-sm-4">
                                <select  class="custom-select mr-sm-2 " id="payment_id" name="payment_id" >
                               <option value="" selected>Please Select Payment ID...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `payment` where status = 'equipment' ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["id"];?>"><?php echo $category["id"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                <label for="Payment Type ID" class="col-sm-2 col-form-label">Payment Type </label>
                                <div class="col-sm-4">
                                <select  class="custom-select mr-sm-2 " id="payment_payment_type_id" name="payment_payment_type_id" >
                               <option value="" selected>Please Select Payment Type ID...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `payment` where status = 'Equipment' ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["payment_type_id"];?>"><?php echo $category["id"]."-".$category["payment_type_id"];?></option>
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