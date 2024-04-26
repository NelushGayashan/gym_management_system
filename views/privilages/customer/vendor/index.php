<?php 
    require_once('C:/xampp/htdocs/test/controllers/operations_vendor.php'); ;
    $db = new  operations_vendor();

    require_once('C:/xampp/htdocs/test/views/common/styles.php');

?>

<head>

    <title>Add Vendor Details</title>
</head>
<!-- Header -->
<div class="w3-container  w3-text-black card recent-sales row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-top:-1000px ; margin-bottom:10px " id="showcase" >
    
      <h1 class="w3-xxlarge "><b>Add Vendor Details</b></h1>
    
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div> 


<div class="pagetitle col-lg-12"  style="margin-top:10px ; margin-bottom:-50px; margin-left:0px ">
      
      <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/admin/dashboard.php">Dashboard</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/inventory_management.php">Inventory Management</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/vendor/view.php">View Vendor Details</a></li>
          <li class="breadcrumb-item active">Add Vendor Records</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->

  

        <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px">

                        <?php $db->Store_Record(); ?>
                        
                             <form method="POST" id="user_form">
				
                                
                                 
                                 
                                 
				<input style="margin-bottom:30px" type="hidden" name="id" placeholder=" Vendor ID" class="form-control mb-2" required >
                               
                                
                                 
                                 
                                 
                                 
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Name Of The Equipment" class="col-sm-2 col-form-label">Vendor Name</label>
                                <div class="col-sm-8">
                                <input style="margin-bottom:30px" type="text" name="name" placeholder="Vendor Name" class="form-control mb-2" required >
                                </div>
                                </div>
                                 
                                 
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Name Of The Equipment" class="col-sm-2 col-form-label">Equipments</label>
                                <div class="col-sm-8">
                                <textarea class="form-control" name="equipments" placeholder="Equipments" id="floatingTextarea" style="height: 100px;" class="form-control mb-2" required></textarea>
                                
                                </div>
                                </div>
                                
                                
				
                                
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Name Of The Equipment" class="col-sm-2 col-form-label">Remarks</label>
                                <div class="col-sm-8">
                                <textarea class="form-control" name="remarks" placeholder="Remarks" id="floatingTextarea" style="height: 100px;" class="form-control mb-2" required></textarea>
                                
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