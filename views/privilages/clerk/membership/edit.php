<?php 
 require_once('C:/xampp/htdocs/test/controllers/operations_membership.php'); 
    $db = new  operations_membership();
   $db->update();
    $id = $_GET['U_ID'];
    $result = $db->get_record($id);
    $data = mysqli_fetch_assoc($result);
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/clerk/header.php');
?>
       
<head>
    <title>Edit Membership Details</title>
</head>
<!-- Header -->
  <div class="w3-container  col-lg-12 w3-text-black card recent-sales row  m-auto card mt-5 card-body w3-text-black" style="margin-top:-1000px ; margin-bottom:10px " id="showcase" >
   
    <h1 class="w3-xxlarge w3-text-black"><b> Edit Membership Details</b></h1>
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div>


<div class="pagetitle col-lg-12"  style="margin-top:10px ; margin-bottom:-50px; margin-left:0px ">
    <nav>
       <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/clerk/dashboard.php">Dashboard</a></li>
         <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/clerk/customer_management.php">Customer Management</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/clerk/membership/view.php">View Membership Details</a></li>
          <li class="breadcrumb-item active">Edit Membership Records</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->
  

        <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px">
            
                        <?php $db->Store_Record(); ?>
            
                        
                            
                            <form method="POST">
                               
                                <input style="margin-bottom:30px" type="hidden" name="id" placeholder=" Membership ID" class="form-control mb-2" required value="<?php echo $data['id']; ?>">
                                
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Membership Name" class="col-sm-4 col-form-label">Membership Name</label>
                                <div class="col-sm-8">
                                <input style="margin-bottom:30px" type="text" name="name" placeholder="Membership Name" class="form-control mb-2" required value="<?php echo $data['name']; ?>" >
                                </div>
                                </div>
                                
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Membership Description" class="col-sm-4 col-form-label">Membership Description</label>
                                <div class="col-sm-8">
                                <input style="margin-bottom:30px" type="text" name="description" placeholder="Membership Description" class="form-control mb-2" required value="<?php echo $data['description']; ?>" >
                                </div>
                                </div>
                                
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Membership Fee" class="col-sm-4 col-form-label">Membership Fee</label>
                                <div class="col-sm-8">
                                <input style="margin-bottom:30px" type="number" name="fee" placeholder="Membership Fee" class="form-control mb-2" required value="<?php echo $data['fee']; ?>" >
                                </div>
                                </div>
                                
                                
                                
                                
                        
                
         
                            
                  <div  style=" margin-left:400px ; margin-top:100px ; margin-bottom:100px">
                                    <button class="btn btn-success btn-lg" name="btn_update"> Update </button>
                                </div>


                             </form>
                
        </div>
<!-- End page content -->

<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>