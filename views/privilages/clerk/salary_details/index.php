<?php 
    require_once('C:/xampp/htdocs/test/controllers/operations_salary_details.php'); 
    $db = new  operations_salary_details();
require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/admin/header.php');
?>

<head>

    <title>Add Salary Scheme Details</title>
</head>
<!-- Header -->
  <div class="w3-container" style="margin-top:80px ; margin-bottom:80px" id="showcase">
    <h1 class="w3-xxxlarge w3-text-black"><b>Add Salary Scheme Details</b></h1>
    <hr style="width:50px;border:5px solid green" class="w3-round">
  </div>
  

        <div class="row col-lg-6 m-auto card mt-5 card-body w3-text-black" style="margin-left:100px ; margin-top:0px ; margin-bottom:100px">

                        <?php $db->Store_Record(); ?>
                        
                            <form method="POST">
			
                                
                                 <input style="margin-bottom:30px" type="hidden" name="id" placeholder="Salary Detail ID" class="form-control mb-2" required >
                                
                                <label style="margin-bottom:10px" class = "card-footer">Payment</label>
                                <input style="margin-bottom:30px" type="text" name="payment" placeholder=" payment" class="form-control mb-2" required >
                                
                                <label style="margin-bottom:10px" class = "card-footer">Designation</label>
                                <input style="margin-bottom:30px" type="text" name="designation" placeholder="Designation" class="form-control mb-2" required >
					
                                
                                
                          <div class="card-footer" style=" margin-left:175px ; margin-top:100px ; margin-bottom:100px ">
                            <button class="btn btn-success btn-lg" name="submit" style=" margin-right:5px  "> Save </button>
                            <a class="btn btn-primary btn-lg" href="view.php">View</a>
                    </div>
                     
                                

                      
                        
                            </form>
                         
                    
                    
                
        </div>
    

<!-- End page content -->

<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>