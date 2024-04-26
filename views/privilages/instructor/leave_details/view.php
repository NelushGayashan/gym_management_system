<?php 
    
    require_once('C:/xampp/htdocs/test/controllers/operations_leave_details.php'); 
    $db = new  operations_leave_details();
     $result=$db->viewi1_record();
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/instructor/header.php');
    
?>
<head>
    
  <title>View Leave Details</title>  
</head>
<!-- Header -->
  <div class="w3-container  w3-text-black card recent-sales" style="margin-top:50px ; margin-bottom:20px " id="showcase" >
    <h1 class="w3-xxlarge "><b>View Leave Details</b></h1>
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div> 
<div class="pagetitle">
      
      <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/instructor/dashboard.php">Dashboard</a></li>
          
          <li class="breadcrumb-item active">Leave Apply</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->


               <div class="card-body row col-lg m-auto card mt card-body table-responsive-lg w3-text-black " style="  margin-left:-50px ; margin-top:50px ; margin-bottom:0px ">
                        
                   
                   
                   <?php
                              $db->display_message(); 
                              $db->display_message();
                        ?>
            <div  class="scroll" style="width:100%">
                
                
                
                      <table id="datatableid" class=" table thead-dark table-hover datatable ">
                          
                           <thead class="thead-dark w3-large" align = "center" scope="col"> <tr>
                                   
              <!-- Trigger/Open The Modal -->
                           <button onclick="document.getElementById('add').style.display='block'" class="btn btn-lg btn-primary" style="  margin-left:0px ; margin-top:0px ; margin-bottom:10px "><b><strong>+</strong></b> Add New Record Here</button>

    <!-- The Modal -->
        <div id="add" class="modal">
            <!-- Modal content -->
                <div class="modal-content ">
                    <span onclick="document.getElementById('add').style.display='none'"  style="margin-left:880px ; margin-bottom:-40px">&times;</span>
                     <span onclick="document.getElementById('add').style.display='none'" class="w3-button w3-display-topright">&times;</span>
                        <?php require_once('C:/xampp/htdocs/test/views/privilages/instructor/leave_details/index.php'); ?>
                <script>
                window.addEventListener("click", function(event) {
                // Get REFUSE modal
                var modal = document.getElementById('add');
                 // When the user clicks anywhere outside of the modal, close it
                if (event.target == modal) {
                 modal.style.display = "none";
                    }
                    });
                </script>
                <script>
                  $(document).on('click','#btn-add',function(e) {
		var data = $("#user_form").serialize();
		$.ajax({
			data: data,
			type: "post",
			url: "localhost/test/controllers/operations_leave_details.php/Store_Record()",
			success: function(dataResult){
					var dataResult = JSON.parse(dataResult);
					if(dataResult.statusCode==200){
						$('#add').modal('hide');
						alert('Data added successfully !'); 
                        location.reload();						
					}
					else if(dataResult.statusCode==201){
					   alert(dataResult);
					}
			}
		});
	});  
                </script>

                </div>
        
        </div>     
                                      
                                
                                
                                
                                
                                <td style="width: 10%"> Leave Details ID </td>
                                <td style="width: 10%"> Staff ID </td>
                                <td style="width: 10%"> Date </td>
				<td style="width: 10%"> Staff Member Name </td>
                               
                         
                               </tr></thead>
                            <tr>
                                <?php 
                                    while($data = mysqli_fetch_assoc($result))
                                    { 
                                ?>
                                    <td><?php echo $data['id'] ?></td>
                                    <td><?php echo $data['staff_id'] ?></td>
                                    <td><?php echo $data['date'] ?></td>
                                    <td><?php echo $data['staff_member_name'] ?></td>
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    </tr>
                                    
                            <?php  } ?>
                        </table></div>
            
                   
                   

                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card">
                                 <div class="card-body bg-secondary-light">
                                    <div class="card-body text-black">
                                        <div class="w3-container" style="margin-top:0px ; margin-bottom:0px" id="showcase">
    <h1 class="w3-large w3-text-black"><b>Accepted Leaves</b></h1></div> 
                                        
    
    
    
    <?php 
    
    require_once('C:/xampp/htdocs/test/controllers/operations_leave_process.php'); 
    $db = new  operations_leave_process();
     $result=$db->viewi1_record();
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
   
    
?>
    
    
    
    
                                        <div class="scroll"  style="width:100%">
                
                      
                       <table class=" table thead-dark table-hover datatable ">
                           <thead class="thead-dark w3-large" align = "center" scope="col" style="background-color: #B9D9EB; color:#000"> <tr>
                             
                                  
                                
                                <td style="width: 10%"> Date </td> 
				<td style="width: 15%"> Remark </td>
                                

                               
                              
                               </tr></thead>
                            <tr align = "center">
                                <?php 
                                $i = 0;
                                
                           			
                                    while($data = mysqli_fetch_assoc($result))
                                    {$i++;
                                ?>
                                    
                                    
                                    <td style="background-color: #fff; color:#097969" align = "center"><?php echo $data['date'] ?></td>
                                    <td style="background-color: #fff; color:#097969" align = "center"><?php echo $data['remark'] ?></td>
                                    
                           
                                    
                                    
                                       </tr>
                                    
                            <?php  } ?>
                       </table></div>
                                        
                                        
                                        
                                        
                                        
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card">
                                 <div class="card-body bg-secondary-light">
                                    <div class="card-body text-black">
                                       <div class="w3-container" style="margin-top:0px ; margin-bottom:0px" id="showcase">
    <h1 class="w3-large w3-text-black"><b>Declined Leaves</b></h1></div> 
                                        
                                        
    
    
        <?php 
    
    require_once('C:/xampp/htdocs/test/controllers/operations_leave_process.php'); 
    $db = new  operations_leave_process();
     $result=$db->viewi2_record();
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');

    
?>
                                        
                                        
                                        <div class="scroll"  style="width:100%">
                
                      
                       <table class=" table thead-dark table-hover datatable ">
                           <thead class="thead-dark w3-large" align = "center" scope="col" style="background-color: #B9D9EB; color:#000"> <tr>
                             
                                  
                                <td style="width: 15%"> Date </td>
				<td style="width: 15%"> Number Of Leaves </td>
                                

                               
                              
                               </tr></thead>
                            <tr align = "center">
                                <?php 
                                $i = 0;
                                
                           			
                                    while($data = mysqli_fetch_assoc($result))
                                    {$i++;
                                ?>
                                    
                                    <td style="background-color: #fff; color:#097969" align = "center"><?php echo $data['date'] ?></td>
                                    <td style="background-color: #fff; color:#097969" align = "center"><?php echo $data['remark'] ?></td>
                                    
                           
                                    
                                    
                                       </tr>
                                    
                            <?php  } ?>
                       </table></div>
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        	

                 
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
            
          </div>          
        </div>


    <h3 style=" margin-bottom:100px"></h3>


    
<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>

    
    
    

    
    
<!-- End page content -->

