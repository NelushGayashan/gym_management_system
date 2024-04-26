<?php 
    
    require_once('C:/xampp/htdocs/test/controllers/operations_attendance.php'); 
    $db = new  operations_attendance();
     $result=$db->viewi1_record();
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/instructor/header.php');
    
?>
<head>
  <title>View Attendance Details</title>  
</head>
<!-- Header -->
  <div class="w3-container  w3-text-black card recent-sales" style="margin-top:50px ; margin-bottom:20px " id="showcase" >
    <h1 class="w3-xxlarge "><b>View Attendance Details</b></h1>
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div> 
<div class="pagetitle">
      
      <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/instructor/dashboard.php">Dashboard</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/instructor/staff_management.php">Staff Management</a></li>
          <li class="breadcrumb-item active">View Attendance Details Records</li>
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
                                   
              
                                   
                                                          
            
                                   
                                   
                
                  
                                <td style="width: 10%" > Attendance ID </td>
                                <td style="width: 10%" > Staff ID </td>
                                <td style="width: 10%" > Member Name </td>
                                <td style="width: 10%" > Date </td>
                                <td style="width: 10%" > In Time</td>
				<td style="width: 10%" > Out Time </td>
                                <td style="width: 10%" > Hours </td>
                            </tr></thead>
                            <tr>
                                <?php while($data = mysqli_fetch_assoc($result)) {?>
                                    <td ><?php echo $data['id'] ?></td>
                                    <td ><?php echo $data['staff_id'] ?></td>
                                    <td ><?php echo $data['staff_member_name'] ?></td>
                                    <td ><?php echo $data['date'] ?></td>
                                    <td ><?php echo $data['intime'] ?></td>
                                    <td ><?php echo $data['outtime'] ?></td>
                                    <td align = "center"><?php echo $data['total_hours'] ?></td>
                                    
                                    

                                
        </tr>
                                    
        <?php  } ?>
        </table>
        </div>           
        </div>
            

    <h3 style=" margin-bottom:100px"></h3>

            




    
<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>

    
    

    

