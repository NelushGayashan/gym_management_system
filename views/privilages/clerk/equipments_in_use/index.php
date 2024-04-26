<?php 
    require_once('C:/xampp/htdocs/test/controllers/operations_equipments_in_use.php');  
    $db = new  operations_equipments_in_use();

    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/clerk/header.php');
?>

<head>

    <title>Add Equipments In Use Details</title>
</head>
<!-- Header -->
  <div class="w3-container" style="margin-top:80px ; margin-bottom:80px" id="showcase">
    <h1 class="w3-xxxlarge w3-text-black"><b>Add Equipments In Use Details</b></h1>
    <hr style="width:50px;border:5px solid green" class="w3-round">
  </div>
  

        <div class="row col-lg-6 m-auto card mt-5 card-body w3-text-black" style="margin-left:100px ; margin-top:0px ; margin-bottom:100px">

                        <?php $db->Store_Record(); ?>
                        
                            <form method="POST">
				
                                
                                
				<input style="margin-bottom:30px" type="hidden" name="id" placeholder=" Equipment ID" class="form-control mb-2" required >
                                
                                <label style="margin-bottom:10px" class = "card-footer">Equipment Name</label>
                                <input style="margin-bottom:30px" type="text" name="name" placeholder=" Equipment Name" class="form-control mb-2" required >
                                
                                <label style="margin-bottom:10px" class = "card-footer">Vendor Name</label>
                                <input style="margin-bottom:30px" type="text" name="vendor_name" placeholder=" Vendor Name " class="form-control mb-2" required >
				
                                <label style="margin-bottom:10px" class = "card-footer"> Equipment Details ID </label>
                                <input style="margin-bottom:30px" type="text" name="equipment_purchases_id" placeholder=" Equipment Details IDEquipment Details ID" class="form-control mb-2" required >
                                
                                
                                <label style="margin-bottom:10px" class = "card-footer">Quantity</label>
                                <input style="margin-bottom:30px" type="text" name="quantity" placeholder=" Quantity" class="form-control mb-2" required >
                       
                                
                                <label style="margin-bottom:10px" class = "card-footer">Status</label>
                                <input style="margin-bottom:30px" type="text" name="status" placeholder=" Status" class="form-control mb-2" required >
                       
                                
                                <div class="card-footer" style=" margin-left:175px ; margin-top:100px ; margin-bottom:100px ">
                            <button class="btn btn-success btn-lg" name="submit" style=" margin-right:5px  "> Save </button>
                            <a class="btn btn-primary btn-lg" href="view.php">View</a>
                    </div>
                     
                                

                      
                        
                            </form>
                         
                    
                    
                
        </div>
    

<!-- End page content -->

<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>