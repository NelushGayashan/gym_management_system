<?php 
     require_once('C:/xampp/htdocs/test/controllers/operations_privilages.php');
    $db = new operations_privilages();
require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/admin/header.php');
?>

<head>

    <title>Add Privilages Details</title>
</head>
<!-- Header -->
  <div class="w3-container" style="margin-top:80px ; margin-bottom:80px" id="showcase">
    <h1 class="w3-xxxlarge w3-text-black"><b>Add Privilages Details</b></h1>
    <hr style="width:50px;border:5px solid green" class="w3-round">
  </div>
  

        <div class="row col-lg-6 m-auto card mt-5 card-body w3-text-black" style="margin-left:100px ; margin-top:0px ; margin-bottom:100px">

                        <?php $db->Store_Record(); ?>
                        
                            <form method="POST">
				
                                
				<input style="margin-bottom:30px" type="hidden" name="id" placeholder="Privilage ID" class="form-control mb-2" required>
                                
                                <label class="card-footer" style="margin-bottom:10px"> Privilage Name </label>
                                <input style="margin-bottom:30px" type="text" name="name" placeholder=" Privilage Name" class="form-control mb-2" required>
                                
                                <label class="card-footer" style="margin-bottom:10px"> Create </label>
                                <input style="margin-bottom:30px" type="text" name="create" placeholder=" Create " class="form-control mb-2" required>
                                
                                <label class="card-footer" style="margin-bottom:10px"> Update </label>
                                <input style="margin-bottom:30px" type="create" name="update" placeholder=" Update" class="form-control mb-2" required>
				
                                <label class="card-footer" style="margin-bottom:10px"> View </label>
                                <input style="margin-bottom:30px" type="text" name="view" placeholder=" View" class="form-control mb-2" required>
                                
                                <label class="card-footer" style="margin-bottom:10px"> Delete </label>
                                <input style="margin-bottom:30px" type="text" name="delete" placeholder=" Delete " class="form-control mb-2" required>
                                
                                <label class="card-footer" style="margin-bottom:10px"> Module ID </label>
                                <input style="margin-bottom:30px" type="text" name="module_id" placeholder="  Module ID" class="form-control mb-2" required>
                                
                                <label class="card-footer" style="margin-bottom:10px"> Role ID </label>
                                <input style="margin-bottom:30px" type="text" name="role_id" placeholder=" Issues " class="form-control mb-2" required>
                                
                                
                                
                               
                                
                                
                                
                                <div class="card-footer" style=" margin-left:175px ; margin-top:100px ; margin-bottom:100px ">
                            <button class="btn btn-success btn-lg" name="submit" style=" margin-right:5px  "> Save </button>
                            <a class="btn btn-primary btn-lg" href="view.php">View</a>
                    </div>
                     
                                

                      
                        
                            </form>
                         
                    
                    
                
        </div>
    

<!-- End page content -->

<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>