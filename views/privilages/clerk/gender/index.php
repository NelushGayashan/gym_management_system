<?php 
    require_once('C:/xampp/htdocs/test/controllers/operations_gender.php');  
    $db = new operations_gender();
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/admin/header.php');
?>

<head>

    <title>Add Gender Details</title>
</head>
<!-- Header -->
  <div class="w3-container  w3-text-black card recent-sales row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-top:-1000px ; margin-bottom:10px " id="showcase" >
    
      <h1 class="w3-xxlarge "><b>Add Gender Details</b></h1>
    
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div> 


<div class="pagetitle col-lg-12"  style="margin-top:10px ; margin-bottom:-50px; margin-left:0px ">
      
 <nav>
       <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/admin/dashboard.php">Dashboard</a></li>
         <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/expenses_income_management.php">Expense And Income Management</a></li>
          
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/income/view.php">View Gender Details</a></li>
          <li class="breadcrumb-item active">Add Gender Records</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->

  

        <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px">

                        <?php $db->Store_Record(); ?>
                            <form method="POST" id="user_form">
				
                                
                                <input style="margin-bottom:30px" type="hidden" name="id" placeholder="Gender ID" class="form-control mb-2" required>
                                
                                <label class="card-footer" style="margin-bottom:10px"> Gender </label>
                                <input style="margin-bottom:30px" type="text" name="gender" placeholder="Gender Name" class="form-control mb-2" required>
                                
                        
                      
                  
                                              
                        <div  style=" margin-left:400px ; margin-top:50px ; margin-bottom:50px ">
                            <button class="btn btn-success btn-lg" id="btn-add"" name="submit" style=" margin-right:5px  "> Save </button>
                            
                        </div>
                            
                            
                     
                                

                      
                        
                            </form>
                         
        </div>    
                    
                
        
    

<!-- End page content -->
