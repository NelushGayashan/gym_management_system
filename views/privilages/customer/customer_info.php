
                    <hr>
                    <div class="row col-lg-12">
                      
                            
                
<div class="w3-container" style="margin-top:0px ; margin-bottom:50px" id="showcase">
    <h1 class="w3-xlarge w3-text-black"><b><i class="bi bi-info-circle-fill"></i> Instructor Basic Info</b></h1>  
</div> 
                
            <?php 
    
    require_once('C:/xampp/htdocs/test/controllers/operations_staff.php'); 
    $db = new  operations_staff();
    $result=$db->viewi1_record();?>

    <?php                $db->display_message(); 
                              $db->display_message();
                        ?>

            <?php 
                                    while($data = mysqli_fetch_assoc($result))
                                    {
                                ?>

                                
                                <div class="form-group row" style="margin-bottom:30px">
                                <label for="Email" class="col-sm-2 col-form-label">Staff Member ID</label>
                                <div class="col-sm-3">
                                <input style="margin-bottom:30px" type="text" name="id" placeholder="Staff Member ID" class="form-control mb-2" readonly required value = "<?php echo $data['id']; ?>" >
                                </div>
                                </div>
                            
                            
                                <div class="form-group row" style="margin-bottom:30px">
                                <label for="Staff Member First Name" class="col-sm-3 col-form-label ">Staff Member First Name</label>
                                <div class="col-sm-3">
                                <input style="margin-bottom:30px" type="text" name="fname" placeholder="Staff Member First Name" class="form-control mb-2" readonly required value = "<?php echo $data['fname']; ?>" >
                                </div>
                                <label for="Staff Member Last Name" class="col-sm-3 col-form-label ">Staff Member Last Name</label>
                                <div class="col-sm-3">
                                <input style="margin-bottom:30px" type="text" name="lname" placeholder="Staff Member Last Name" class="form-control mb-2" readonly required value = "<?php echo $data['lname']; ?>" >
                                </div>
                                </div>
                            
                            
                            
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Address" class="col-sm-2 col-form-label ">Address</label>
                                <div class="col-sm-4">
                                <textarea style="margin-bottom:30px" type="text" name="address" placeholder="Address" class="form-control mb-2" readonly required value = "<?php echo $data['address']; ?>" ><?php echo $data['address']; ?></textarea>
                               
                                </div>
                                <label for="Description" class="col-sm-2 col-form-label">Description</label>
                                <div class="col-sm-4">
                                    <textarea style="margin-bottom:30px" type="text" name="description" placeholder="Description" class="form-control mb-2" readonly required value = "<?php echo $data['description']; ?>"><?php echo $data['description']; ?></textarea>
                               
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
                            
                            
                                
                            
                                <div class="form-group row " style="margin-bottom:30px ">   
                                <label for="Gender ID" class="col-sm-2 col-form-label">Gender</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="text" name="telephone" placeholder="Telephone Number" class="form-control mb-2" readonly required value = "<?php echo $data['gender_id']; ?>" >
                                </div>
                                <label for="Designation ID" class="col-sm-2 col-form-label">Designation ID</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="text" name="telephone" placeholder="Telephone Number" class="form-control mb-2" readonly required value = "<?php echo $data['designation_id']; ?>" >
                                </div>
                                </div>
                                
                            
                            
                            
                            
                            
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="User Account Role ID" class="col-sm-2 col-form-label">Role ID</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="text" name="telephone" placeholder="Telephone Number" class="form-control mb-2" readonly required value = "<?php echo $data['useraccount_role_id']; ?>" >
                                </div>
                                <label for="User Account ID" class="col-sm-2 col-form-label">User ID</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="text" name="telephone" placeholder="Telephone Number" class="form-control mb-2" readonly required value = "<?php echo $data['useraccount_id']; ?>" >
                                </div>
                                </div>
        

 <?php  } ?>

</div> 



