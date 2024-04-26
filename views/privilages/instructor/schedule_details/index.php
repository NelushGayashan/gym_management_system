<?php 
    require_once('C:/xampp/htdocs/test/controllers/operations_schedule_details.php'); 
    $db = new  operations_schedule_details();
 
    require_once('C:/xampp/htdocs/test/views/common/styles.php');

?>

<head>

    <title>Add Schedule Details</title>
</head>
<!-- Header -->
  <div class="w3-container  w3-text-black card recent-sales row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-top:-1000px ; margin-bottom:10px " id="showcase" >
    
      <h1 class="w3-xxlarge "><b>Add Schedule Details</b></h1>
    
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div> 


<div class="pagetitle col-lg-12"  style="margin-top:10px ; margin-bottom:-50px; margin-left:0px ">
      
 <nav>
       <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/instructor/dashboard.php">Dashboard</a></li>
         <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/instructor/customer_management.php">Customer Management</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/instructor/schedule_details/view.php">View Schedule Details</a></li>
          <li class="breadcrumb-item active">Add Schedule Records</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->

  

        <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px">

                        <?php $db->Store_Record(); ?>
                        
                             <form method="POST" id="user_form">
				
        
                                
				
				<input style="margin-bottom:30px" type="hidden" name="id" placeholder=" Schedule Details ID" class="form-control mb-2" required >
                                
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ; margin-top:30px ">
                                <label for="Given Date" class="col-sm-2 col-form-label">Given Date</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="date" name="given_date" placeholder="Given Date" class="form-control mb-2" required>
                                </div>
                                <label for="Renew Date" class="col-sm-2 col-form-label">Renew Date </label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="date" name="renew_date" placeholder="Renew Date" class="form-control mb-2" required>
                                </div>
                                </div>
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px  ">
                                <label for="Exercises" class="col-sm-2 col-form-label">Exercises</label>
                                <div class="col-sm-10">
                                <input style="margin-bottom:30px" type="text" name="exercises" placeholder="Exercises" class="form-control mb-2" required>
                                </div>
                                </div>
                                
                                
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px  ">
                                <label for="Remarks" class="col-sm-2 col-form-label">Remarks</label>
                                <div class="col-sm-10">
                                <input style="margin-bottom:30px" type="text" name="remarks" placeholder="Remarks" class="form-control mb-2" required>
                                </div>
                                </div>
                                
                                
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px  ">
                                <label for="Customer Details ID" class="col-sm-3 col-form-label">Customer Details ID</label>
                                <div class="col-sm-8">
                                <div class="col-sm-8">
                                <select required class="custom-select mr-sm-2 " id="customer_details_id" name="customer_details_id" >
                                <option value="" selected>Please Select Customer Details ID...</option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT * FROM `customer_details` ORDER BY id DESC";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["id"];?>"><?php echo $category["id"]." ".$category["name"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                </div>
                                </div>
                                
                                
                      
                            
                            
                             
                        <div  style=" margin-left:400px ; margin-top:50px ; margin-bottom:50px ">
                            <button id="btn-add" class="btn btn-success btn-lg" name="submit" style=" margin-right:5px  "> Save </button>
                        </div>
                     
                                

                      
                        
                            </form>
                         
        </div>    
                    
                
        
    

<!-- End page content -->

