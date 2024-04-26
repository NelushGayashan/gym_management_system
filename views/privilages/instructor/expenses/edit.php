<?php 

    require_once('C:/xampp/htdocs/test/controllers/operations_expenses.php'); 
    $db = new  operations_expenses();
    $db->update();
    $id = $_GET['U_ID'];
    $result = $db->get_record($id);
    $data = mysqli_fetch_assoc($result);
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/admin/header.php');
?>

<head>
    <title>Edit Expenses Details</title>
</head>
<!-- Header -->
  <div class="w3-container  col-lg-12 w3-text-black card recent-sales row  m-auto card mt-5 card-body w3-text-black" style="margin-top:-1000px ; margin-bottom:10px " id="showcase" >
   
    <h1 class="w3-xxlarge w3-text-black"><b> Edit Expenses Details</b></h1>
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div>


<div class="pagetitle col-lg-12"  style="margin-top:10px ; margin-bottom:-50px; margin-left:0px ">
    <nav>
       <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/admin/dashboard.php">Dashboard</a></li>
         <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/expenses_income_management.php">Expense And Income Management</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/expenses/view.php">View Payment Details</a></li>
          <li class="breadcrumb-item active">Edit Expenses Records</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->
  

        <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px">
            
                        <?php $db->Store_Record(); ?>
            
                        
                            
                            <form method="POST">
    
    
                            <input style="margin-bottom:30px" type="hidden" name="id" placeholder=" Payment ID" class="form-control mb-2" required value="<?php echo $data['id']; ?>">
                            
                            
                            
                                <div class="form-group row " style="margin-bottom:30px ; margin-top:30px">
                                <label for="amount" class="col-sm-3 col-form-label">Payment Amount</label>
                                <div class="col-sm-4">
                                <select required class="custom-select mr-sm-2 " id="amount" name="amount" >
                                <option required value="<?php echo $data['amount']; ?>"><?php echo $data['amount']; ?></option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `payment` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["amount"];?>"><?php echo $category["id"]."-".$category["amount"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                
                                <label for="date" class="col-sm-1 col-form-label">Date</label>
                                <div class="col-sm-4">
                                <select required class="custom-select mr-sm-2 " id="date" name="date" >
                                <option required value="<?php echo $data['date']; ?>"><?php echo $data['date']; ?></option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `payment` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["amount"];?>"><?php echo $category["id"]."-".$category["date"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                
                                </div>
                            
                               
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Expenses details" class="col-sm-3 col-form-label">Expenses details</label>
                                <div class="col-sm-8">
                                <input style="margin-bottom:30px" type="text" name="details" placeholder="Expenses details" class="form-control mb-2" required value="<?php echo $data['details']; ?>" >
                                </div>
                                </div>
                            
                            
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="payment_id" class="col-sm-2 col-form-label">Payment ID </label>
                                <div class="col-sm-4">
                                <select required class="custom-select mr-sm-2 " id="payment_id" name="payment_id" >
                                <option required value="<?php echo $data['payment_id']; ?>"><?php echo $data['payment_id']; ?></option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `payment` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["id"];?>"><?php echo $category["id"]."-".$category["date"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                <label for="payment_payment_type_id" class="col-sm-2 col-form-label">Payment Type </label>
                                <div class="col-sm-4">
                                <select required class="custom-select mr-sm-2 " id="payment_payment_type_id" name="payment_payment_type_id" >
                                <option required value="<?php echo $data['payment_payment_type_id']; ?>"><?php echo $data['payment_payment_type_id']; ?></option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `payment` ORDER BY id DESC";
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