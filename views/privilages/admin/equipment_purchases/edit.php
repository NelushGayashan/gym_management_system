<?php
    require_once('C:/xampp/htdocs/test/controllers/operations_equipment_purchases.php'); 
    $db = new  operations_equipment_purchases();
    $db->update();
    $id = $_GET['U_ID'];
    $result = $db->get_record($id);
    $data = mysqli_fetch_assoc($result);
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/admin/header.php');
?>

<head>
    <title>Edit Equipment Purchases Details</title>
</head>
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
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/equipment_purchases/view.php">View Equipment Purchases Details</a></li>
          <li class="breadcrumb-item active">Edit Equipment Purchases Records</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->
  

        <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px">
            
                        <?php $db->Store_Record(); ?>
            
                        
                            
                            <form method="POST">
                        
                            
                            <form method="POST">
                                
                            <input style="margin-bottom:30px" type="hidden" name="id" placeholder=" Equipment Purchase ID" class="form-control mb-2" required value="<?php echo $data['id']; ?>">
                            
                            
                            
                            
                            
                            
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Name Of The Equipment" class="col-sm-2 col-form-label">Name Of The Equipment</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="text" name="name" placeholder="Name Of The Equipment" class="form-control mb-2" required value="<?php echo $data['name']; ?>" >
                                </div>
                                <label for="Status Of The Equipment" class="col-sm-2 col-form-label">Status Of The Equipment</label>
                                <div class="col-sm-4">
                                <div class="col-sm-10">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="status" id="Active" value="Active" required value="<?php echo $data['status']; ?>">
                                        <label class="form-check-label" for="Active">
                                             Active
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="status" id="Deactive" value="Deactive" required value="<?php echo $data['status']; ?>">
                                        <label class="form-check-label" for="Deactive">
                                            De-active
                                        </label>
                                    </div>
                                </div>
                                </div>
                                </div>
                            
                            
                                <input style="margin-bottom:30px" type="hidden" name="remark" placeholder=" Equipment Purchase ID" class="form-control mb-2" required value="<?php echo $data['remark']; ?>">
                            
                            
                            
                            
                            
                                <div class="form-group row" style="margin-bottom:30px">
                                <label for="Quantity" class="col-sm-2 col-form-label">Quantity</label>
                                <div class="col-sm-2">
                                <input style="margin-bottom:30px" type="number" name="quantity" placeholder="Quantity" class="form-control mb-2" required value="<?php echo $data['quantity']; ?>" >
                                </div>
                                <label for="Cost Of The Equipment" class="col-sm-2 col-form-label">Cost Of The Equipment</label>
                                <div class="col-sm-2">
                                <select  class="custom-select mr-sm-2 " id="cost" name="cost" >
                                <option required value="<?php echo $data['cost']; ?>"  selected><?php echo $data['cost']; ?></option>
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
                                <label for="Purchased Date" class="col-sm-2 col-form-label">Purchased Date</label>
                                <div class="col-sm-2">
                                <select  class="custom-select mr-sm-2 " id="purchased_date" name="purchased_date" >
                                <option required value="<?php echo $data['purchased_date']; ?>"  selected><?php echo $data['purchased_date']; ?></option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `payment` where status = 'equipment' ORDER BY id DESC";
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
                                <label for="Vendor ID" class="col-sm-2 col-form-label">Vendor ID</label>
                                <div class="col-sm-4">
                                <select  class="custom-select mr-sm-2 " id="vendor_id" name="vendor_id" >
                               <option required value="<?php echo $data['vendor_id']; ?>"  selected><?php echo $data['vendor_id']; ?></option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `vendor` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["id"];?>"><?php echo $category["id"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                <label for="Vendor Name" class="col-sm-2 col-form-label">Vendor Name</label>
                                <div class="col-sm-4">
                                <select  class="custom-select mr-sm-2 " id="vendor_name" name="vendor_name" >
                               <option required value="<?php echo $data['vendor_name']; ?>"  selected><?php echo $data['vendor_name']; ?></option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `vendor` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["name"];?>"><?php echo $category["id"]."-".$category["name"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                </div>
                            
                            
                            
                            
                                
                            
                            
                                
                            
                            
                                <div class="form-group row" style="margin-bottom:30px">
                                 <label for="Payment ID" class="col-sm-2 col-form-label">Payment ID</label>
                                <div class="col-sm-4">
                                <select  class="custom-select mr-sm-2 " id="payment_id" name="payment_id" >
                               <option required value="<?php echo $data['payment_id']; ?>"  selected><?php echo $data['payment_id']; ?></option>
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
                                <label for="Payment Type ID" class="col-sm-2 col-form-label">Payment Type ID</label>
                                <div class="col-sm-4">
                                <select  class="custom-select mr-sm-2 " id="payment_payment_type_id" name="payment_payment_type_id" >
                               <option required value="<?php echo $data['payment_payment_type_id']; ?>"  selected><?php echo $data['payment_payment_type_id']; ?></option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `payment` where status = 'equipment' ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["payment_type_id"];?>"><?php echo $category["id"]."-".$category["payment_type_id"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                               
                                </div>
                            
                            
                            
                                
                                
                            
                                
                            
                            
                       
                            
                       <div  style=" margin-left:400px ; margin-top:100px ; margin-bottom:100px">
                                    <button class="btn btn-success btn-lg" name="btn_update"> Update </button>
                                </div>

                             </form>
                
        </div>
<!-- End page content -->

<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>