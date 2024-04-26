<?php 
 require_once('C:/xampp/htdocs/test/controllers/operations_privilages.php');
    $db = new operations_privilages();
 $db->update();
    $id = $_GET['U_ID'];
    $result = $db->get_record($id);
    $data = mysqli_fetch_assoc($result);
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/admin/header.php');
?>

<head>
    <title>Edit Privilages Details</title>
</head>
<!-- Header -->
  <div class="w3-container" style="margin-top:80px ; margin-bottom:80px" id="showcase">
    <h1 class="w3-xxxlarge w3-text-black"><b>Edit Privilages Details</b></h1>
    <hr style="width:50px;border:5px solid green" class="w3-round">
  </div>
  

        <div class=" row col-lg-6 m-auto card mt-5 card-body w3-text-black" style="margin-left:100px ; margin-top:0px ; margin-bottom:100px">
            
                        <?php $db->Store_Record(); ?>
            
                        
                            
                            <form method="POST">
                                
                                
                                <input style="margin-bottom:30px" type="hidden" name="id" placeholder=" Privilage ID" class="form-control mb-2" required value="<?php echo $data['id']; ?>">
                                
                                <label style="margin-bottom:10px" class = "card-footer">Privilage Name</label>
                                <input style="margin-bottom:30px" type="text" name="name" placeholder=" Privilage Name" class="form-control mb-2" required value="<?php echo $data['name']; ?>">
                                
                                <label style="margin-bottom:10px" class = "card-footer">Create</label>
                                <input style="margin-bottom:30px" type="text" name="create" placeholder=" Cretate" class="form-control mb-2" required value="<?php echo $data['create']; ?>">
				
                                <label style="margin-bottom:10px" class = "card-footer">Update</label>
                                <input style="margin-bottom:30px" type="text" name="update" placeholder=" Update " class="form-control mb-2" required value="<?php echo $data['update']; ?>">
                                
                                <label style="margin-bottom:10px" class = "card-footer">View</label>
                                <input style="margin-bottom:30px" type="text" name="view" placeholder=" View " class="form-control mb-2" required value="<?php echo $data['view']; ?>">
                                
                                <label style="margin-bottom:10px" class = "card-footer">Delete</label>
                                <input style="margin-bottom:30px" type="text" name="delete" placeholder=" Delete " class="form-control mb-2" required value="<?php echo $data['delete']; ?>">
                                
                                <label style="margin-bottom:10px" class = "card-footer"> Module ID </label>
                                <input style="margin-bottom:30px" type="text" name="module_id" placeholder=" Module ID  " class="form-control mb-2" required value="<?php echo $data['module_id']; ?>">
                                
                                <label style="margin-bottom:10px" class = "card-footer">Role ID</label>
                                <input style="margin-bottom:30px" type="text" name="role_id" placeholder=" Role ID " class="form-control mb-2" required value="<?php echo $data['role_id']; ?>">
                                
                                
                                
                                
                                
                               <div class="card-footer" style=" margin-left:200px ; margin-top:100px ; margin-bottom:100px">
                                    <button class="btn btn-success btn-lg" name="btn_update"> Update </button>
                                </div>

                             </form>
                
        </div>
<!-- End page content -->

<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>