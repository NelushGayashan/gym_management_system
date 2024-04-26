<?php 
    
    require_once('C:/xampp/htdocs/test/controllers/operations_leave_process.php'); 
    $db = new  operations_leave_process();
    $result=$db->view3_record();
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
require_once('C:/xampp/htdocs/test/views/privilages/admin/header.php');
    
?>
<head>
  <title>Overall Leaves</title>  
</head>
<!-- Header -->
  <div class="w3-container  w3-text-black card recent-sales" style="margin-top:50px ; margin-bottom:20px " id="showcase" >
    <h1 class="w3-xxlarge "><b>Overall Leaves</b></h1>
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div> 
<div class="pagetitle">
      
      <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/admin/dashboard.php">Dashboard</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/admin/reports.php">Reports</a></li>
          
          <li class="breadcrumb-item active">Overall Leaves</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->


               <div class="card-body row col-lg m-auto card mt card-body table-responsive-lg w3-text-black " style="  margin-left:-50px ; margin-top:50px ; margin-bottom:0px ">
                        
                   
          
                
                      
                       <table id="Member_Registrations" class=" table table-hover display nowrap">
                           <thead class="thead-dark w3-large" align = "center" scope="col" style="background-color: #21B6A8; color:#FFF"> <tr>
                                   
                                
                                <td  style="width: 1%"> # </td>
                                <td style="width: 10%"> Staff ID </td>
                                <td style="width: 10%"> Staff Member Name </td>
                                
                                <td style="width: 10%"> Month </td>
                                <td style="width: 10%"> Leaves Count </td>
                              

							
                                
                               </tr></thead>
                           
                            <tr>
                                <?php 
                                 $i=0;   while($data = mysqli_fetch_assoc($result))
                                    {  $i++;
                                ?>
                                
                                    <td style="background-color: #fff; color:#097969"><?php echo $i ?></td>
                                    <td style="background-color: #fff; color:#097969"><?php echo $data['staff_id'] ?></td>
                                    <td style="background-color: #fff; color:#097969"><?php echo $data['staff_member_name'] ?></td>
                                    
                                    <td style="background-color: #fff; color:#097969"><?php echo $data['month'] ?></td>
                                    <td style="background-color: #fff; color:#097969"><?php echo $data['count'] ?></td>
				  
									
                                   </tr>
                            <?php  } ?>
                        </table></div>
            
            
         

<div class="containe-fluid" >
	<div class="row mt-3  ">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                     <div class="w3-container" style="margin-top:10px ; margin-bottom:10px" id="showcase">
    <h1 class="w3-xlarge w3-text-black"><b>Leave Summary</b></h1>  
</div> 
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card">
                                 <div class="card-body bg-secondary-light">
                                    <div class="card-body text-black">
                                        <div class="w3-container" style="margin-top:0px ; margin-bottom:0px" id="showcase">
    <h1 class="w3-large w3-text-black"><b>Today Leaves</b></h1></div> 
                                        
    
    
    
    <?php 
    
    require_once('C:/xampp/htdocs/test/controllers/operations_leave_process.php'); 
    $db = new  operations_leave_process();
     $result=$db->view1_record();
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/admin/header.php');
    
?>
    
    
    
    
                                        <div class="scroll"  style="width:100%">
                
                      
                       <table id="Member_Registrations1" class=" table table-hover display nowrap">
                           <thead class="thead-dark w3-large" align = "center" scope="col" style="background-color: #21B6A8; color:#FFF"> <tr>
                                     
                                <td style="width: 10%"> # </td>   
                                <td style="width: 15%"> Staff ID </td>
				<td style="width: 15%"> Staff Member Name </td>
                                

                               
                              
                               </tr></thead>
                            <tr align = "center">
                                <?php 
                                $i = 0;
                                
                           			
                                    while($data = mysqli_fetch_assoc($result))
                                    {$i++;
                                ?>
                                    <td style="background-color: #fff; color:#097969" align = "center"><?php echo $i ?></td>
                                    <td style="background-color: #fff; color:#097969" align = "center"><?php echo $data['staff_id'] ?></td>
                                    <td style="background-color: #fff; color:#097969" align = "center"><?php echo $data['staff_member_name'] ?></td>
                                    
                           
                                    
                                    
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
    <h1 class="w3-large w3-text-black"><b>Leaves Count As Per Day</b></h1></div> 
                                        
                                        
    
    
        <?php 
    
    require_once('C:/xampp/htdocs/test/controllers/operations_leave_process.php'); 
    $db = new  operations_leave_process();
     $result=$db->view2_record();
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/admin/header.php');
    
?>
                                        
                                        
                                        <div class="scroll"  style="width:100%">
                
                      
                      <table id="Member_Registrations2" class=" table table-hover display nowrap">
                           <thead class="thead-dark w3-large" align = "center" scope="col" style="background-color: #21B6A8; color:#FFF"> <tr>
                                   
                             
                                <td style="width: 10%"> # </td>   
                                <td style="width: 15%"> Date </td>
				<td style="width: 15%"> Number Of Leaves </td>
                                

                               
                              
                               </tr></thead>
                            <tr align = "center">
                                <?php 
                                $i = 0;
                                
                           			
                                    while($data = mysqli_fetch_assoc($result))
                                    {$i++;
                                ?>
                                    <td style="background-color: #fff; color:#097969" align = "center"><?php echo $i ?></td>
                                    <td style="background-color: #fff; color:#097969" align = "center"><?php echo $data['date'] ?></td>
                                    <td style="background-color: #fff; color:#097969" align = "center"><?php echo $data['no_of_rows'] ?></td>
                                    
                           
                                    
                                    
                                       </tr>
                                    
                            <?php  } ?>
                       </table></div>
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        	

                 
                        
   
   <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
                <div class="w3-container" style="margin-top:0px ; margin-bottom:0px" id="showcase">
    <h1 class="w3-large w3-text-black"><b>Leaves Chart</b></h1></div> 

     
                 <?php
     
                
                  $xdata=array();
                  $ydata=array();
                    require_once('C:/xampp/htdocs/test/controllers/operations_leave_process.php'); 
                    $db = new  operations_leave_process();
                    $result=$db->view2_record();
                    while($data = mysqli_fetch_assoc($result)){
                    
                    
                        
                        array_push($xdata,$data['date']);
                       
                    array_push($ydata,$data['no_of_rows']);
                
                }
                
                
                ?>
                
                
 
    
     <!-- Line Chart -->
              <canvas id="lineChart" style="max-height: 400px;"></canvas>
                    <script >
var randomScalingFactor = function() {
  return (Math.random() > 0.5 ? 1.0 : -1.0) * Math.round(Math.random() * 100);}
                document.addEventListener("DOMContentLoaded", () => {
                  new Chart(document.querySelector('#lineChart'), {
                    type: 'line',
                    data: {
                      labels: <?php echo json_encode($xdata); ?>,
                      datasets: [{
                        label: 'Number Of Leaves',
                        data: <?php echo json_encode($ydata); ?>,
                        fill: false,
                        borderColor: 'rgb(75, 192, 192)',
                        tension: 0.1
                      }]
                    },
                    options: {
                      scales: {
                        y: {
                            
                          beginAtZero: true
                          
                        }
                      }
                    }
                  });
                });
              </script>

              
              
              
              
            </div>
          </div>
        </div>
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                </div>
            </div>      			
        </div>
    </div>
</div></div>
          
     


    <?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>

  
<!-- End page content -->






    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>  
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.4.1/css/buttons.dataTables.min.css">
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.4.1/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.4.1/js/buttons.flash.min.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.4.1/js/buttons.html5.min.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.4.1/js/buttons.print.min.js"></script>


                  <script>
                   $(document).ready(function() {
                    $('#Member_Registrations').DataTable( {
                        dom: 'Bfrtip',
                        buttons: [
                                    {
                                        extend: 'copyHtml5',
                                        title: 'Overall Leaves'
                                    },
                                    {
                                        extend: 'csvHtml5',
                                        title: 'Overall Leaves'
                                    },
                                    {
                                        extend: 'excelHtml5',
                                        title: 'Overall Leaves'
                                    },
                                    {
                                        extend: 'pdfHtml5',
                                        title: 'Overall Leaves'
                                    },
                                    {
                                        extend: 'print',
                                        title: 'Overall Leaves'
                                    }
                                    ]
                        } );
                        } );
                   </script>
           
                   <script>
                   $(document).ready(function() {
                    $('#Member_Registrations1').DataTable( {
                        dom: 'Bfrtip',
                        buttons: [
                                    
                                    
                                    {
                                        extend: 'excelHtml5',
                                        title: 'Today Leaves'
                                    },
                                    {
                                        extend: 'pdfHtml5',
                                        title: 'Today Leaves'
                                    }
                                    ]
                        } );
                        } );
                   </script>
                   
                    <script>
                   $(document).ready(function() {
                    $('#Member_Registrations2').DataTable( {
                        dom: 'Bfrtip',
                        buttons: [
                                    
                                    
                                    {
                                        extend: 'excelHtml5',
                                        title: 'Leaves Count As Per Day'
                                    },
                                    {
                                        extend: 'pdfHtml5',
                                        title: 'Leaves Count As Per Day'
                                    }
                                    ]
                        } );
                        } );
                   </script>


    