<?php 

    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/customer/header.php');
	
?>

<head>

    <title>Dashboard</title>
    
</head>

<!-- Header -->
  <div class="w3-container w3-text-dark-green card recent-sales" style="margin-top:20px ; margin-bottom:20px " id="showcase" >
    <h1 class="w3-xxxlarge "><b>Dashboard</b></h1>
    <hr style="width:50px;border:5px solid green" class="w3-round">
  </div>
  <div class="pagetitle">
      
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->

 
<div class="containe-fluid col-lg-12 card card-body w3-text-black" >
	
                   
<?php if(isset($_SESSION['id'])){?>
            <div class="alert alert-success alert-dismissible  show" role="alert">
                <strong>Welcome Back </strong> <?= $_SESSION['user_name']; ?>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <?php unset($_SESSION['status']);}?>
                    <hr>
             
                    
                                      
                    <div class="row col-lg-12">
                      
                            
                
<div class="w3-container" style="margin-top:0px ; margin-bottom:50px" id="showcase">
    <h1 class="w3-xlarge w3-text-black"><b><i class="bi bi-info-circle-fill"></i> Customer Basic Info</b></h1>  
</div> 
                        
<?php 
    
    require_once('C:/xampp/htdocs/test/controllers/operations_customer.php'); 
    $db = new  operations_customer();
    $result=$db->viewc1_record();
require_once('C:/xampp/htdocs/test/views/common/styles.php');
require_once('C:/xampp/htdocs/test/views/privilages/customer/header.php');
    
?>
                     <?php
                              $db->display_message(); 
                              $db->display_message();
                        ?>
                    
                    
                    
                                <?php 
                                    while($data = mysqli_fetch_assoc($result))
                                    {
                                ?>
                                
                                <div class="form-group row" style="margin-bottom:30px">
                                <label for="Email" class="col-sm-2 col-form-label">Customer ID</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="text" name="id" placeholder="Staff Member ID" class="form-control mb-2" readonly required value = "<?php echo $data['id'] ?>" >
                                </div>
                                <label for="User Account ID" class="col-sm-2 col-form-label">User Account ID</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="text" name="telephone" placeholder="Telephone Number" class="form-control mb-2" readonly required value = "<?php echo $data['useraccount_id']; ?>" >
                                </div>
                                </div>
                            
                            
                                <div class="form-group row" style="margin-bottom:30px">
                                <label for="Staff Member First Name" class="col-sm-3 col-form-label ">Customer First Name</label>
                                <div class="col-sm-3">
                                <input style="margin-bottom:30px" type="text" name="fname" placeholder="Staff Member First Name" class="form-control mb-2" readonly required value = "<?php echo $data['fname']; ?>" >
                                </div>
                                <label for="Staff Member Last Name" class="col-sm-3 col-form-label ">Customer Last Name</label>
                                <div class="col-sm-3">
                                <input style="margin-bottom:30px" type="text" name="lname" placeholder="Staff Member Last Name" class="form-control mb-2" readonly required value = "<?php echo $data['lname']; ?>" >
                                </div>
                                </div>
                            
                            
                            
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Address" class="col-sm-2 col-form-label ">Address</label>
                                <div class="col-sm-10">
                                <textarea style="margin-bottom:30px" type="text" name="address" placeholder="Address" class="form-control mb-2" readonly required value = "<?php echo $data['address']; ?>" ><?php echo $data['address']; ?></textarea>
                               </div>
                                </div>
                            
                                
                            
                            
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Telephone Number" class="col-sm-2 col-form-label">Telephone </label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="number" name="telephone" placeholder="Telephone Number" class="form-control mb-2" readonly readonly required value = "<?php echo $data['telephone']; ?>" >
                                </div>
                                <label for="Email" class="col-sm-2 col-form-label">Email</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="email" name="email" placeholder="Email" class="form-control mb-2" readonly required value = "<?php echo $data['email']; ?>" >
                                </div>
                                </div>
                            
                            
                            
                          
                            
                            
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Date Of Birth" class="col-sm-2 col-form-label">Date Of Birth</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="date" name="dob" placeholder="Date Of Birth" class="form-control mb-2" readonly required value = "<?php echo $data['dob']; ?>" >
                                </div>
                                <label for="Date Of Joined" class="col-sm-2 col-form-label">Date Of Joined</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="date" name="doj" placeholder="Date Of Joined" class="form-control mb-2" readonly required value = "<?php echo $data['dob']; ?>" >
                                </div>
                                </div>
                            
                            
                               
                                    
                           
                                    
                                
                                  

                                    
                                    
                                    
                                    
                            <?php  } ?>
                     
                    
                    
                    
                    
 
                
</div>

 </div>  

            




<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>
