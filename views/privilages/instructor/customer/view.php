<?php 
    
    require_once('C:/xampp/htdocs/test/controllers/operations_customer.php'); 
    $db = new  operations_customer();
    $result=$db->view_record();
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
require_once('C:/xampp/htdocs/test/views/privilages/instructor/header.php');
    
?>
<head>
  <title>View Customer Details</title>  
</head>
<!-- Header -->
  <div class="w3-container  w3-text-black card recent-sales" style="margin-top:50px ; margin-bottom:20px " id="showcase" >
    <h1 class="w3-xxlarge "><b>View Customer Details</b></h1>
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div> 
<div class="pagetitle">
      
      <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/instructor/dashboard.php">Dashboard</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/instructor/customer_management.php">Customer Management</a></li>
          <li class="breadcrumb-item active">View Customer Records</li>
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
                          
             
                                    
                                <td style="width: 5%"> Customer ID </td>
                                <td style="width: 5%"> Customer's First Name </td>
                                <td style="width: 5%"> Customer's Last Name </td>
                                <td style="width: 15%"> Address </td>
                                <td style="width: 5%"> Telephone </td>
                                
                                <td style="width: 10%"> Email </td>
                                
                                
                                   
                                   
				<td style="width: 5%" colspan="3" >Operations</td>
                            
                            </tr></thead>
                            <tr>
                                <?php 
                                    while($data = mysqli_fetch_assoc($result))
                                    {
                                ?>
                                
                                    <td><?php echo $data['id'] ?></td>
                                    <td><?php echo $data['fname'] ?></td>
                                    <td><?php echo $data['lname'] ?></td>
                                    <td><?php echo $data['address'] ?></td>
                                    <td><?php echo $data['telephone'] ?></td>
                                    
                                    <td><?php echo $data['email'] ?></td>
                                    
                                    
                                  

                                    
                                    
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
       <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/instructor/dashboard.php">Dashboard</a></li>
       <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/instructor/customer_management.php">Customer Management</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/instructor/customer/view.php">View Customer Details</a></li>
       <li class="breadcrumb-item active">Detailed View</li>
       </ol>
       </nav>
       </div><!-- End Page Title -->
       <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px" align = "left">
       <div class="form-group row" style="margin-bottom:30px">
                                <label for="Email" class="col-sm-2 col-form-label">Customer ID</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="text" name="id" placeholder="Staff Member ID" class="form-control mb-2" readonly required value = "<?php echo $data['id'] ?>" >
                                </div>
                                <label for="User Account ID" class="col-sm-2 col-form-label">User ID</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="text" name="telephone" placeholder="Telephone Number" class="form-control mb-2" readonly required value = "<?php echo $data['useraccount_id']; ?>" >
                                </div>
                                </div>
                            
                            
                                <div class="form-group row" style="margin-bottom:30px">
                                <label for="Staff Member First Name" class="col-sm-3 col-form-label ">Customer First Name</label>
                                <div class="col-sm-3">
                                <input style="margin-bottom:30px" type="text" name="fname" placeholder="Staff Member First Name" class="form-control mb-2" readonly required value = "<?php echo $data['fname']; ?>" >
                                </div>
                                <label for="Staff Member Last Name" class="col-sm-3 col-form-label ">Customer Last Name</label>
                                <div class="col-sm-3">
                                <input style="margin-bottom:30px" type="text" name="lname" placeholder="Staff Member Last Name" class="form-control mb-2" readonly required value = "<?php echo $data['lname']; ?>" >
                                </div>
                                </div>
                            
                            
                            
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="Address" class="col-sm-2 col-form-label ">Address</label>
                                <div class="col-sm-10">
                                <textarea style="margin-bottom:30px" type="text" name="address" placeholder="Address" class="form-control mb-2" readonly required value = "<?php echo $data['address']; ?>" ><?php echo $data['address']; ?></textarea>
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
                    url: "localhost/test/controllers/operations_customer.php/view_record()",
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

<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php');?> 

    
    
      
