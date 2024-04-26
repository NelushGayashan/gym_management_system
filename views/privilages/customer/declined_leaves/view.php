<?php 
    
    require_once('C:/xampp/htdocs/test/controllers/operations_leave_process.php'); 
    $db = new  operations_leave_process();
    $result=$db->viewdeclineded_record();
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/admin/header.php');
    
?>
<head>
  <title>View Declined Leaves Details</title>  
</head>
<!-- Header -->
  <div class="w3-container  w3-text-black card recent-sales" style="margin-top:50px ; margin-bottom:20px " id="showcase" >
    <h1 class="w3-xxlarge "><b>View Declined Leave Details</b></h1>
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div>  

<div class="pagetitle">
      
      <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/admin/dashboard.php">Dashboard</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/staff_management.php">Staff Management</a></li>
          <li class="breadcrumb-item active">Declined Leave Records</li>
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
                                   
                                   
                              <td style="width: 10%"> Leave Process ID </td>
                                <td style="width: 10%"> Staff ID </td>
                                <td style="width: 10%"> Staff Member Name </td>
                                <td style="width: 10%"> Date </td>
                                <td style="width: 10%"> Status </td>
                                <td style="width: 30%"> Remarks </td>
				<td style="width: 10%"> Leave Details ID </td>
                                <td style="width: 15%" colspan="2">Operations</td>
							
                            
                               </tr></thead>
                           
                            <tr>
                                <?php 
                                    while($data = mysqli_fetch_assoc($result))
                                    {
                                ?>
                                    <td><?php echo $data['id'] ?></td>
                                    <td><?php echo $data['staff_id'] ?></td>
                                    <td><?php echo $data['staff_member_name'] ?></td>
                                    <td><?php echo $data['date'] ?></td>
                                    <td><?php echo $data['status'] ?></td>
                                    <td><?php echo $data['remark'] ?></td>
				    <td><?php echo $data['leave_details_id'] ?></td>
                                    
                                    
                                    
                                  
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
       <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/dashboard.php">Staff Management</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/declined_leaves/view.php">View Declined Leave Details</a></li>
       <li class="breadcrumb-item active">Detailed View</li>
       </ol>
       </nav>
       </div><!-- End Page Title -->
       <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px" align = "left">
       <div class="form-group row " style="margin-bottom:30px ; margin-top:30px">
       <label for="Expenses details" class="col-sm-3 col-form-label">Leave Process ID</label>
       <div class="col-sm-4">
       <input style="margin-bottom:30px" type="text" name="details" placeholder="Expenses details" class="form-control mb-2" required value="<?php echo $data['id']; ?>" readonly>
       </div>
       <label for="Expenses details" class="col-sm-1 col-form-label">Date</label>
       <div class="col-sm-4">
       <input style="margin-bottom:30px" type="date" name="details" placeholder="Expenses details" class="form-control mb-2" required value="<?php echo $data['date']; ?>" readonly>
       </div>
       </div>
       <div class="form-group row " style="margin-bottom:30px ">
       <label for="Expenses details" class="col-sm-2 col-form-label">Staff ID</label>
       <div class="col-sm-3">
       <input style="margin-bottom:30px" type="text" name="details" placeholder="Expenses details" class="form-control mb-2" required value="<?php echo $data['staff_id']; ?>" readonly>
       </div>
       <label for="Expenses details" class="col-sm-3 col-form-label">Staff Member Name</label>
       <div class="col-sm-4">
       <input style="margin-bottom:30px" type="text" name="details" placeholder="Expenses details" class="form-control mb-2" required value="<?php echo $data['staff_member_name']; ?>" readonly>
       </div>
       </div>
       <div class="form-group row " style="margin-bottom:30px ">
       <label for="Expenses details" class="col-sm-2 col-form-label">Status</label>
       <div class="col-sm-3">
       <input style="margin-bottom:30px" type="text" name="details" placeholder="status" class="form-control mb-2" required value="<?php echo $data['status']; ?>" readonly>
       </div>
       <label for="Expenses details" class="col-sm-3 col-form-label">Leave Details ID</label>
       <div class="col-sm-4">
       <input style="margin-bottom:30px" type="text" name="details" placeholder="Expenses details" class="form-control mb-2" required value="<?php echo $data['leave_details_id']; ?>" readonly>
       </div>
       </div>  
       <div class="form-group row " style="margin-bottom:30px ">
       <label for="Expenses details" class="col-sm-2 col-form-label">Remarks</label>
       <div class="col-sm-10">
       <input style="margin-bottom:30px" type="text" name="details" placeholder="status" class="form-control mb-2" required value="<?php echo $data['remark']; ?>" readonly>
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
                    url: "localhost/test/controllers/operations_leave_process.php/viewdeclineded_record()",
                    dataType: "html", //expect html to be returned                
                    success: function (response) {
                        $("#responsecontainer").html(response);
                        //alert(response);
                    }
                });
            });

        });
        </script>                     

        
        
        </td>
        </tr>
                                    
        <?php  } ?>
        </table>
        </div>           
        </div>
            

    <h3 style=" margin-bottom:100px"></h3>

            




    
<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>
