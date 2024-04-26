
<!-- Header -->
  <div class="w3-container  w3-text-black card recent-sales row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-top:-1000px ; margin-bottom:10px " id="showcase" align = "left">
    
      <h1 class="w3-xxlarge " align = "left"><b>Detailed View</b></h1>
    
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div> 


<div class="pagetitle col-lg-12"  style="margin-top:10px ; margin-bottom:-50px; margin-left:0px ">
      
 <nav>
       <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/admin/dashboard.php">Dashboard</a></li>
         <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/expenses_income_management.php">Expense And Income Management</a></li>
          
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/income/view.php">View Gender Details</a></li>
          <li class="breadcrumb-item active">Detailed View</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->

  

        <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px" align = "left">

								<div class="form-group row " style="margin-bottom:30px ; margin-top:30px">
                                <label for="Expenses details" class="col-sm-2 col-form-label">Gender ID</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="text" name="details" placeholder="Expenses details" class="form-control mb-2" required value="<?php echo $data['id']; ?>" readonly>
                                </div>
								<label for="Expenses details" class="col-sm-2 col-form-label">Gender</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="text" name="details" placeholder="Expenses details" class="form-control mb-2" required value="<?php echo $data['gender']; ?>" readonly>
                                </div>
                                </div>
                         
        </div>    
                    
                
        
    

<!-- End page content -->
	  
