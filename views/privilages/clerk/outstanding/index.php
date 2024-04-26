<?php
    require_once('C:/xampp/htdocs/test/controllers/operations_outstanding.php'); 
    $db = new  operations_outstanding();
require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/clerk/header.php');
?>

<head>

    <title>Add Outstanding Details</title>
</head>
<!-- Header -->
  <div class="w3-container  w3-text-black card recent-sales row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-top:-1000px ; margin-bottom:10px " id="showcase" >
    
      <h1 class="w3-xxlarge "><b>Add Outstanding Details</b></h1>
    
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div> 


<div class="pagetitle col-lg-12"  style="margin-top:10px ; margin-bottom:-50px; margin-left:0px ">
      
 <nav>
       <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/clerk/dashboard.php">Dashboard</a></li>
         <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/clerk/expenses_income_management.php">Expense And Income Management</a></li>
          
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/clerk/outstanding/view.php">View Outstanding Details</a></li>
          <li class="breadcrumb-item active">Add Outstanding Records</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->

  

        <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px">

                        <?php $db->Store_Record(); ?>
                        
                             <form method="POST" id="user_form">
                                
                                
                            <input style="margin-bottom:30px" type="hidden" name="id" placeholder=" Outstanding ID" class="form-control mb-2" required >
                                
                                
                            
                            
                            
                            
                                <div class="form-group row" style="margin-bottom:30px; margin-top:30px">
                                <label for="Customer Name" class="col-sm-3 col-form-label">Customer Name</label>
                                <div class="col-sm-8">
                                <select required class="custom-select mr-sm-2 " id="customer_name" name="customer_name" >
                                <option value="" selected>Please Select Customer Name...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `customer` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["fname"]." ".$category["lname"];?>"><?php echo $category["fname"]." ".$category["lname"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                </div>
                            
                            
                            
                                <div class="form-group row" style="margin-bottom:30px">
                                <label for="Customer ID" class="col-sm-2 col-form-label">Customer ID</label>
                                <div class="col-sm-4">
                                <select required class="custom-select mr-sm-2 " id="customer_id" name="customer_id" >
                                <option value="" selected>Please Select Customer ID...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `customer` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["id"];?>"><?php echo $category["id"]."-".$category["fname"]." ".$category["lname"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                <label for="User Account ID" class="col-sm-2 col-form-label">User ID</label>
                                <div class="col-sm-4">
                                <select required class="custom-select mr-sm-2 " id="useraccount_id" name="useraccount_id" >
                                <option value="" selected>Please Select User ID...</option>
                                    <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `customer` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["useraccount_id"];?>"><?php echo $category["id"]."-".$category["useraccount_id"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                
                                </div>
                                
                            
                            
                            
                            
                            
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Register ID" class="col-sm-2 col-form-label">Register ID</label>
                                <div class="col-sm-4">
                                <select required class="custom-select mr-sm-2 " id="register_id" name="register_id" >
                                <option value="" selected>Please Select Register ID...</option>
                                    <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `register` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["id"];?>"><?php echo $category["customer_id"]."-".$category["id"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                
                                
                                
                                <label for="Membership ID" class="col-sm-2 col-form-label">Membership ID</label>
                                <div class="col-sm-4">
                                <select required class="custom-select mr-sm-2 " id="membership_id" name="membership_id" >
                                <option value="" selected>Please Select Membership ID...</option>
                                    <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `register` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["membership_id"];?>"><?php echo $category["customer_id"]."-".$category["membership_id"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                
                                </div>
                            
                            
                                <div class="form-group row " style="margin-bottom:30px;">
                                <label for="Membership Name" class="col-sm-2 col-form-label">Remarks </label>
                                <div class="col-sm-10">
                                    <textarea style="margin-bottom:30px" type="text" name="remark" placeholder="Remarks" class="form-control mb-2" required ></textarea>
                                </div>
                                </div>
                                
                            
                            
                            
                            
                            
                            
                          
                                
                                                   
                        <div  style=" margin-left:400px ; margin-top:50px ; margin-bottom:50px ">
                            <button id="btn-add" class="btn btn-success btn-lg" name="submit" style=" margin-right:5px  "> Save </button>
                        </div>
                            
                            
                     
                                

                      
                        
                            </form>
                         
        </div>    
                    
                
        
    
