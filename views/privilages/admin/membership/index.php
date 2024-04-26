<?php 
 require_once('C:/xampp/htdocs/test/controllers/operations_membership.php'); 
    $db = new  operations_membership();
require_once('C:/xampp/htdocs/test/views/common/styles.php');

?>

<head>

    <title>Add Membership Details</title>
</head>
<!-- Header -->
  <div class="w3-container  w3-text-black card recent-sales row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-top:-1000px ; margin-bottom:10px " id="showcase" >
    
      <h1 class="w3-xxlarge "><b>Add Membership Details</b></h1>
    
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div> 


<div class="pagetitle col-lg-12"  style="margin-top:10px ; margin-bottom:-50px; margin-left:0px ">
      
 <nav>
       <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/admin/dashboard.php">Dashboard</a></li>
         <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/customer_management.php">Customer Management</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/membership/view.php">View Membership Details</a></li>
          <li class="breadcrumb-item active">Add Membership Records</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->

  

        <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px">

                        <?php $db->Store_Record(); ?>
                        
                            <form method="POST" id="user_form">
				
        
                                
				<input style="margin-bottom:30px" type="hidden" name="id" placeholder="Membership ID" class="form-control mb-2" required>
                                
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Membership Name" class="col-sm-4 col-form-label">Membership Name</label>
                                <div class="col-sm-8">
                                <input style="margin-bottom:30px" type="text" name="name" placeholder="Membership Name" class="form-control mb-2" required >
                                </div>
                                </div>
                                
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Membership Description" class="col-sm-4 col-form-label">Membership Description</label>
                                <div class="col-sm-8">
                                <input style="margin-bottom:30px" type="text" name="description" placeholder="Membership Description" class="form-control mb-2" required >
                                </div>
                                </div>
                                
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Membership Fee" class="col-sm-4 col-form-label">Membership Fee</label>
                                <div class="col-sm-8">
                                <input style="margin-bottom:30px" type="number" name="fee" placeholder="Membership Fee" class="form-control mb-2" required >
                                </div>
                                </div>
                                
                                
                                
                     
                                
                                
                                
                                
                                <div  style=" margin-left:400px ; margin-top:50px ; margin-bottom:50px ">
                            <button id="btn-add" class="btn btn-success btn-lg" name="submit" style=" margin-right:5px  "> Save </button>
                        </div>
                     
                                

                      
                        
                            </form>
                         
        </div>    
                    
                
        
    

<!-- End page content -->

