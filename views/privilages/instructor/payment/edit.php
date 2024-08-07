<?php
    require_once('C:/xampp/htdocs/test/controllers/operations_payment.php'); 
    $db = new  operations_payment();

    $db->update();
    $id = $_GET['U_ID'];
    $result = $db->get_record($id);
    $data = mysqli_fetch_assoc($result);
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/admin/header.php');
?>

<head>
    <title>Edit Payment Details</title>
</head>
<!-- Header -->
  <div class="w3-container  col-lg-12 w3-text-black card recent-sales row  m-auto card mt-5 card-body w3-text-black" style="margin-top:-1000px ; margin-bottom:10px " id="showcase" >
   
    <h1 class="w3-xxlarge w3-text-black"><b> Edit Payment Details</b></h1>
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div>


<div class="pagetitle col-lg-12"  style="margin-top:10px ; margin-bottom:-50px; margin-left:0px ">
    <nav>
       <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/admin/dashboard.php">Dashboard</a></li>
         <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/expenses_income_management.php">Expense And Income Management</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/membership/view.php">View Payment Details</a></li>
          <li class="breadcrumb-item active">Edit Payment Records</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->
  

        <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px">
            
                        <?php $db->Store_Record(); ?>
            
                        
                            
                            <form method="POST">
    
    
                            <input style="margin-bottom:30px" type="hidden" name="id" placeholder=" Payment ID" class="form-control mb-2" required value="<?php echo $data['id']; ?>">
                            
                            
                            
                            
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Membership Name" class="col-sm-3 col-form-label">Payment Amount</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="number" name="amount" placeholder="Payment Amount" class="form-control mb-2" required value="<?php echo $data['amount']; ?>" >
                                </div>
                                <label for="Membership Name" class="col-sm-1 col-form-label">Date</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="date" name="date" placeholder="Date" class="form-control mb-2" required value="<?php echo $data['date']; ?>" >
                                </div>
                                </div>
                            
                            
                            
                              
                                
                            
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Membership Name" class="col-sm-2 col-form-label">Payment Type </label>
                                <div class="col-sm-4">
                                <select required class="custom-select mr-sm-2 " id="payment_type_id" name="payment_type_id" >
                                <option required value="<?php echo $data['payment_type_id']; ?>"><?php echo $data['payment_type_id']; ?></option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `payment_type` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["id"];?>"><?php echo $category["id"]."-".$category["payment_type_name"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                <label for="Status" class="col-sm-1 col-form-label">Status</label>
                                <div class="col-sm-4">
                                <div class="col-sm-6">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="status" id="Equipment" value="Equipment" required value="<?php echo $data['status']; ?>">
                                        <label class="form-check-label" for="Accepted">
                                             Equipment
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="status" id="Expense" value="Expense" required value="<?php echo $data['status']; ?>">
                                        <label class="form-check-label" for="Declined">
                                            Expense
                                        </label>
                                    </div>
                                </div>
                                </div>
                                </div>
                            
                            
                            
                            
                          
                            
                            
                            
                            
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Membership Name" class="col-sm-2 col-form-label">Remarks</label>
                                <div class="col-sm-10">
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