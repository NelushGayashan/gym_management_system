<?php 
    require_once('C:/xampp/htdocs/test/controllers/operations_salary.php'); 
    $db = new  operations_salary();
    $db->update();
    $id = $_GET['U_ID'];
    $result = $db->get_record($id);
    $data = mysqli_fetch_assoc($result);
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/admin/header.php');
?>

<head>
    <title>Edit Salary Details</title>
</head>
<!-- Header -->
  <div class="w3-container" style="margin-top:80px ; margin-bottom:80px" id="showcase">
    <h1 class="w3-xxlarge w3-text-black"><b>Edit Salary Details</b></h1>
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div>
  

        <div class=" row col-lg-6 m-auto card mt-5 card-body w3-text-black" style="margin-left:100px ; margin-top:0px ; margin-bottom:100px">
            
                        <?php $db->Store_Record(); ?>
            
                        
                            
                            <form method="POST">
                               
                               <input style="margin-bottom:30px" type="hidden" name="id" placeholder=" Salary ID" class="form-control mb-2" required value="<?php echo $data['id']; ?>">
                                
                                
                                <label style="margin-bottom:10px" class = "card-footer">Date</label>
                                <input style="margin-bottom:30px" type="date" name="date" placeholder=" Date" class="form-control mb-2" required value="<?php echo $data['date']; ?>">
                                
                                 <label style="margin-bottom:10px" class = "card-footer">Remarks</label>
                                <input style="margin-bottom:30px" type="text" name="remark" placeholder=" Remarks" class="form-control mb-2" required value="<?php echo $data['remark']; ?>">
				
                                 <label style="margin-bottom:10px" class = "card-footer">Deductions</label>
                                <input style="margin-bottom:30px" type="text" name="deduction" placeholder=" Deductions" class="form-control mb-2" required value="<?php echo $data['deduction']; ?>">
                                
                                 <label style="margin-bottom:10px" class = "card-footer">Incentives</label>
                                <input style="margin-bottom:30px" type="text" name="incentives" placeholder=" Incentives" class="form-control mb-2" required value="<?php echo $data['incentives']; ?>">
                                
                                 <label style="margin-bottom:10px" class = "card-footer">Salary Details ID</label>
                                <input style="margin-bottom:30px" type="text" name="salary_details_id" placeholder=" Salary Details ID" class="form-control mb-2" required value="<?php echo $data['salary_details_id']; ?>">
                      
                                
                                 <label style="margin-bottom:10px" class = "card-footer">Attendance ID</label>
                                <input style="margin-bottom:30px" type="text" name="attendance_id" placeholder=" Attendance ID" class="form-control mb-2" required value="<?php echo $data['attendance_id']; ?>">
                      
                                
                                
                                <div class="card-footer" style=" margin-left:200px ; margin-top:100px ; margin-bottom:100px">
                                    <button class="btn btn-success btn-lg" name="btn_update"> Update </button>
                                </div>

                             </form>
                
        </div>
<!-- End page content -->

<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>