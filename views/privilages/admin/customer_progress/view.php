<?php 
    
    require_once('C:/xampp/htdocs/test/controllers/operations_customer_progress.php'); 
    $db = new  operations_customer_progress();
    $result=$db->view_record();
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/admin/header.php');
    
?>
<head>
  <title>View Customer Progress Details</title>  
</head>
<!-- Header -->
  <div class="w3-container  w3-text-black card recent-sales" style="margin-top:50px ; margin-bottom:20px " id="showcase" >
    <h1 class="w3-xxlarge "><b>View Customer Progress Details</b></h1>
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div> 
<div class="pagetitle">
      
      <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/admin/dashboard.php">Dashboard</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/customer_management.php">Customer Management</a></li>
          <li class="breadcrumb-item active">View Customer Progress Records</li>
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
                        <?php require_once('C:/xampp/htdocs/test/views/privilages/admin/customer_progress/index.php'); ?>
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
			url: "localhost/test/controllers/operations_customer_progress.php/Store_Record()",
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
                                 
                                   
                                <td style="width: 5%"> Customer Progress ID </td>
                                <td style="width: 30%"> Progress Details </td>
                                <td style="width: 5%"> Schedule Detail ID </td>
                                <td style="width: 5%"> Customer Detail ID </td>
							
                                <td style="width: 5%" colspan="2">Operations</td>
                               </tr></thead>
                            <tr>
                                <?php 
                                    while($data = mysqli_fetch_assoc($result))
                                    {
                                ?>
                                    <td><?php echo $data['id'] ?></td>
                                    <td><?php echo $data['progress_details'] ?></td>
                                    <td><?php echo $data['schedule_details_id'] ?></td>
                                    <td><?php echo $data['customer_details_id'] ?></td>
                                    
                                    
                                    
                                    
                                    <td align = "center"> 
           
           
           
           
           
       <!-- Trigger/Open The Modal -->
       <button id = "viewbtn" onclick="document.getElementById('view<?php echo $data['id'] ?>').style.display='block'" class="btn btn-info" style="  margin-left:0px ; margin-top:10px ; margin-bottom:10px "><span class="glyphicon glyphicon-list-alt"></span> View </button>
       <div id="view<?php echo $data['id'] ?>" class="modal" >
       <div class="modal-content ">
       <span onclick="document.getElementById('view<?php echo $data['id'] ?>').style.display='none'"  style="margin-left:870px ; margin-bottom:-40px">&times;</span>
       <span onclick="document.getElementById('view<?php echo $data['id'] ?>').style.display='none'" class="w3-button w3-display-topright">&times;</span>
       <script>
       window.addEventListener("click", function(event) {
       // Get REFUSE modal
       var modal = document.getElementById('view<?php echo $data['id'] ?>');
       // When the user clicks anywhere outside of the modal, close it
       if (event.target == modal) {
       modal.style.display = "none";
       }
       });
       </script>        
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
       <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/customer_management.php">Customer Management</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/customer_details/view.php">View Customer Progress Details</a></li>
       <li class="breadcrumb-item active">Detailed View</li>
       </ol>
       </nav>
       </div><!-- End Page Title -->
       <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px" align = "left">
       <div class="form-group row " style="margin-bottom:30px ; margin-top:30px">
       <label for="Expenses details" class="col-sm-3 col-form-label">Progress Details ID</label>
       <div class="col-sm-3">
       <input style="margin-bottom:30px" type="text" name="details" placeholder="Expenses details" class="form-control mb-2" required value="<?php echo $data['id']; ?>" readonly>
       </div>
       <label for="Expenses details" class="col-sm-3 col-form-label">Schedule Details ID</label>
       <div class="col-sm-3">
       <input style="margin-bottom:30px" type="text" name="details" placeholder="Expenses details" class="form-control mb-2" required value="<?php echo $data['schedule_details_id']; ?>" readonly>
       </div>
       </div>
      
       <div class="form-group row " style="margin-bottom:30px ">
       <label for="Expenses details" class="col-sm-3 col-form-label">Progress Details</label>
       <div class="col-sm-9">
           <textarea style="margin-bottom:30px" type="text" name="details" placeholder="Progress Details" class="form-control mb-2" required value="<?php echo $data['progress_details']; ?>" readonly><?php echo $data['progress_details']; ?></textarea>
       </div>
       </div>
       <div class="form-group row " style="margin-bottom:30px ">
       <label for="Expenses details" class="col-sm-3 col-form-label">Customer Details ID</label>
       <div class="col-sm-4">
       <input style="margin-bottom:30px" type="text" name="details" placeholder="Remarks" class="form-control mb-2" required value="<?php echo $data['customer_details_id']; ?>" readonly>
       </div>
       </div>
       
       </div>      
       <!-- End page content -->
       </div>
       </div>     
       <script>
        $(document).ready(function () {

            $('.viewbtn').on('click', function () {
                $('#view<?php echo $data['id'] ?>').modal('show');
                $.ajax({ //create an ajax request to display.php
                    type: "POST",
                    url: "localhost/test/controllers/operations_customer_progress.php/view_record()",
                    dataType: "html", //expect html to be returned                
                    success: function (response) {
                        $("#responsecontainer").html(response);
                        //alert(response);
                    }
                });
            });

        });
        </script>                     
                           
                           
       
       
       
       
       
       
       <a href="edit.php?U_ID=<?php echo $data['id'] ?>" type="button" class = " btn btn-warning " style=" margin-right:5px  "><span class="glyphicon glyphicon-pencil"></span> Edit</a>
     
     
        
        
        
        
        
        
        
        
        
        
        
        
        
     
     
       <button id="deletebtn" onclick="document.getElementById('delete<?php echo $data['id'] ?>').style.display='block'" class="btn btn-danger" style="  margin-left:0px ; margin-top:10px ; margin-bottom:10px "><span class="glyphicon glyphicon-trash" ></span> Delete</button>
       <div id="delete<?php echo $data['id'] ?>" class="modal" >
       <div class="modal-content ">
       <span onclick="document.getElementById('delete<?php echo $data['id'] ?>').style.display='none'"  style="margin-left:870px ; margin-bottom:-40px">&times;</span>
       <span onclick="document.getElementById('delete<?php echo $data['id'] ?>').style.display='none'" class="w3-button w3-display-topright">&times;</span>
       <script>
       window.addEventListener("click", function(event) {
       // Get REFUSE modal
       var modal = document.getElementById('delete<?php echo $data['id'] ?>');
       // When the user clicks anywhere outside of the modal, close it
       if (event.target == modal) {
       modal.style.display = "none";
       }
       });
       </script>   
        <div class="w3-container">
        <div class="icon-box" style="  margin-left:0px ; margin-top:50px ; margin-bottom:50px "><i class="fa fa-trash-o" style="font-size:216px;color:#FFCC00"></i></div>	
        <h4 class=" w3-xxlarge text-danger">Do you really want to delete record ID <?php echo $data['id'] ?>?</h4>
        <div class="text-secondary" style="margin-top:20px ; margin-bottom:30px"> This process cannot be undone</div>
        <button type="button" class="btn btn-primary btn-lg" onclick="document.getElementById('delete<?php echo $data['id'] ?>').style.display='none'">Cancel</button>
        <a href="del.php?D_ID=<?php echo $data['id'] ?>" type="button" class = " btn btn-danger  btn-lg"><span class="glyphicon glyphicon-trash" ></span> Delete</a>
        <h3 style=" margin-bottom:50px"></h3>
        </div>
        <script>
        $(document).ready(function () {

            $('.deletebtn').on('click', function () {

                $('#delete<?php echo $data['id'] ?>').modal('show');

                $tr = $(this).closest('tr');

                var data = $tr.children("td").map(function () {
                    return $(this).text();
                }).get();

                console.log(data);

                $('#D_ID').val(data[0]);

            });
        });
        </script>
        </div>
        </div>  
        </td>
        </tr>
                                    
        <?php  } ?>
        </table>
        </div>           
        </div>
    
    
    
    
    
    
    
    <h3 style=" margin-bottom:100px"></h3>

<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php');?> 

    
    
      
