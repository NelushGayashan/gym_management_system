<?php 
    require_once('C:/xampp/htdocs/test/controllers/operations_vendor.php'); ;
    $db = new  operations_vendor();
    $db->update();
    $id = $_GET['U_ID'];
    $result = $db->get_record($id);
    $data = mysqli_fetch_assoc($result);
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/admin/header.php');
?>

<head>
    <title>Edit Vendor Details</title>
</head>
<!-- Header -->
<!-- Header -->
  <div class="w3-container  col-lg-12 w3-text-black card recent-sales row  m-auto card mt-5 card-body w3-text-black" style="margin-top:-1000px ; margin-bottom:10px " id="showcase" >
   
    <h1 class="w3-xxlarge w3-text-black"><b> Edit Equipment Purchases Details</b></h1>
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div>


<div class="pagetitle col-lg-12"  style="margin-top:10px ; margin-bottom:-50px; margin-left:0px ">
      
     <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/admin/dashboard.php">Dashboard</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/inventory_management.php">Inventory Management</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/vendor/view.php">View Vendor Details</a></li>
          <li class="breadcrumb-item active">Edit Vendor Records</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->
  

        <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px">
            
                        <?php $db->Store_Record(); ?>
            
                        
                            
                        
                        
                            
                            <form method="POST">
                               
                               
                                <input style="margin-bottom:30px" type="hidden" name="id" placeholder=" Vendor ID" class="form-control mb-2" required value="<?php echo $data['id']; ?>">
                               
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Name Of The Equipment" class="col-sm-2 col-form-label">Vendor Name</label>
                                <div class="col-sm-8">
                                <input style="margin-bottom:30px" type="text" name="name" placeholder="Vendor Name" class="form-control mb-2" required value="<?php echo $data['name']; ?>" >
                                </div>
                                </div>
                                 
                                 
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Name Of The Equipment" class="col-sm-2 col-form-label">Equipments</label>
                                <div class="col-sm-8">
                                    <textarea style="margin-bottom:30px" type="text" name="equipments" placeholder="Equipments" class="form-control mb-2" required value="<?php echo $data['equipments']; ?>" ><?php echo $data['equipments']; ?></textarea>
                               
                                </div>
                                </div>
                                
                                
				
                                
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Name Of The Equipment" class="col-sm-2 col-form-label">Remarks</label>
                                <div class="col-sm-8">
                                    <textarea style="margin-bottom:30px" type="text" name="remarks" placeholder="Remarks" class="form-control mb-2" required value="<?php echo $data['remarks']; ?>" ><?php echo $data['remarks']; ?></textarea>
                                
                                 
                                </div>
                                </div>
                                 
                                
                                
                                
                                
                                
                                
                            
                                     
                       <div  style=" margin-left:400px ; margin-top:100px ; margin-bottom:100px">
                                    <button class="btn btn-success btn-lg" name="btn_update"> Update </button>
                                </div>

                             </form>
                
        </div>
<!-- End page content -->

<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>