<?php 

    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/admin/header.php');
	
?>

<head>

    <title>Dashboard</title>
    
</head>

<!-- Header -->
  <div class="w3-container w3-text-dark-green card recent-sales" style="margin-top:50px ; margin-bottom:20px " id="showcase" >
    <h1 class="w3-xxxlarge "><b>Dashboard</b></h1>
    <hr style="width:50px;border:5px solid green" class="w3-round">
  </div>
  <div class="pagetitle">
      
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->

    <style>
   span.float-right.summary_icon {
    font-size: 3rem;
    position: absolute;
    right: 1rem;
    color: #ffffff96;
}
.imgs{
		margin: .5em;
		max-width: calc(100%);
		max-height: calc(100%);
	}
	.imgs img{
		max-width: calc(100%);
		max-height: calc(100%);
		cursor: pointer;
	}
	#imagesCarousel,#imagesCarousel .carousel-inner,#imagesCarousel .carousel-item{
		height: 60vh !important;background: black;
	}
	#imagesCarousel .carousel-item.active{
		display: flex !important;
	}
	#imagesCarousel .carousel-item-next{
		display: flex !important;
	}
	#imagesCarousel .carousel-item img{
		margin: auto;
	}
	#imagesCarousel img{
		width: auto!important;
		height: auto!important;
		max-height: calc(100%)!important;
		max-width: calc(100%)!important;
	}
</style>
<div class="w3-container" style="margin-top:10px ; margin-bottom:10px" id="showcase">
    <h1 class="w3-xlarge w3-text-black"><b>Overall Stats</b></h1>  
</div> 

<div class="containe-fluid" >
	<div class="row mt-3 ml-3 mr-3">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <?php 
  
    
    if(isset($_SESSION['id']))
    {
        ?>
            <div class="alert alert-success alert-dismissible  show" role="alert">
                <strong>Welcome Back </strong> <?= $_SESSION['user_name']; ?>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <?php 
        unset($_SESSION['status']);
    }

?>
                    <hr>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body bg-primary">
                                    <div class="card-body text-white">
                                        <span class="float-right summary_icon"><i class="fa fa-users"></i></span>
                                        <h4><b>
                                            <?php 
                                                require_once('C:/xampp/htdocs/test/controllers/operations_customer.php'); 
                                                $db = new  operations_customer();
                                                   $result=$db->view_record();
                                            echo mysqli_num_rows($result); ?>
                                        </b></h4>
                                        <p><b>Active Members</b></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body bg-info">
                                    <div class="card-body text-white">
                                        <span class="float-right summary_icon"><i class="fa fa-th-list"></i></span>
                                        <h4><b>
                                            <?php     require_once('C:/xampp/htdocs/test/controllers/operations_membership.php'); 
                                            $db = new  operations_membership();
                                            $result=$db->view_record(); 
                                            echo mysqli_num_rows($result);?>
                                        </b></h4>
                                        <p><b>Total Membership Plans</b></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body bg-warning">
                                    <div class="card-body text-white">
                                        <span class="float-right summary_icon"><i class="fa fa-list"></i></span>
                                        <h4><b>
                                            <?php require_once('C:/xampp/htdocs/test/controllers/operations_staff.php'); 
                                                $db = new  operations_staff();
                                                 $result=$db->view_record(); 
                                                 echo mysqli_num_rows($result);?>
                                        </b></h4>
                                        <p><b>Total Staff Members</b></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>	

                    
                </div>
            </div>      			
        </div>
    </div>
</div>
<script>
	$('#manage-records').submit(function(e){
        e.preventDefault()
        start_load()
        $.ajax({
            url:'ajax.php?action=save_track',
            data: new FormData($(this)[0]),
            cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            type: 'POST',
            success:function(resp){
                resp=JSON.parse(resp)
                if(resp.status==1){
                    alert_toast("Data successfully saved",'success')
                    setTimeout(function(){
                        location.reload()
                    },800)

                }
                
            }
        })
    })
    $('#tracking_id').on('keypress',function(e){
        if(e.which == 13){
            get_person()
        }
    })
    $('#check').on('click',function(e){
            get_person()
    })
    function get_person(){
            start_load()
        $.ajax({
                url:'ajax.php?action=get_pdetails',
                method:"POST",
                data:{tracking_id : $('#tracking_id').val()},
                success:function(resp){
                    if(resp){
                        resp = JSON.parse(resp)
                        if(resp.status == 1){
                            $('#name').html(resp.name)
                            $('#address').html(resp.address)
                            $('[name="person_id"]').val(resp.id)
                            $('#details').show()
                            end_load()

                        }else if(resp.status == 2){
                            alert_toast("Unknow tracking id.",'danger');
                            end_load();
                        }
                    }
                }
            })
    }
</script>

                  





<div class="w3-container" style="margin-top:10px ; margin-bottom:10px" id="showcase">
    <h1 class="w3-xlarge w3-text-black"><b>Income & Expenses</b></h1>  
</div> 



<section class="section dashboard">
    <div class="containe-fluid row mt-3 ml-3 mr-3 col-lg-12 card card-body" >
	

        <!-- Left side columns -->
        <div class="col-lg-12">
          <div class="row">

              
              
              <?php
                  $adata=array();
                    require_once('C:/xampp/htdocs/test/controllers/operations_membership_payment.php'); 
                    $db = new operations_membership_payment();
                    $result=$db->view2_record();
                    while($data = mysqli_fetch_assoc($result)){
                        array_push($adata,$data['SUM']);
                ?>
              
            <!-- Sales Card -->
            <div class="col-xxl-3 col-md-4">
              
                <div class="card info-card revenue-card">
                <div class="card-body">
                  <h5 class="card-title">Membership Payments <span>| This Month</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-currency-dollar"></i>
                    </div>
                    <div class="ps-3">
                      <h6 class="w3-large w3-text-green">Rs.<?php echo number_format($data['SUM'],2) ?></h6>
                      <span class="text-success small pt-1 fw-bold">8%</span> <span class="text-muted small pt-2 ps-1">increase</span>

                    </div>
                  </div>
                </div>

              </div>
                
              

                
               
            </div><!-- End Sales Card -->
             <?php } ?>

            
            
            <?php
                  $bdata=array();
                    require_once('C:/xampp/htdocs/test/controllers/operations_payment.php'); 
                    $db = new operations_payment();
                    $result=$db->view1_record();
                    while($data = mysqli_fetch_assoc($result)){
                        array_push($bdata,$data['SUM']);
                ?>
            <!-- Revenue Card -->
            <div class="col-xxl-3 col-md-4">
                
                 <div class="card info-card sales-card">
                <div class="card-body">
                  <h5 class="card-title">Equipment Expenses <span>| This Month</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-cart"></i>
                    </div>
                    <div class="ps-3">
                      <h6 class="w3-large w3-text-red">Rs.<?php echo number_format($data['SUM'],2) ?></h6>
                      <span class="text-success small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">decrease</span>

                    </div>
                  </div>
                </div>  
              </div>
                
              
            </div><!-- End Revenue Card -->
            <?php } ?>
            
            
            

            <!-- Customers Card -->
            <div class="col-xxl-3 col-md-4">

                 <?php
                  $cdata=array();
                    require_once('C:/xampp/htdocs/test/controllers/operations_payment.php'); 
                    $db = new operations_payment();
                    $result=$db->view2_record();
                    while($data = mysqli_fetch_assoc($result)){
                        array_push($cdata,$data['SUM']);
                ?>
              <div class="card info-card sales-card">
                <div class="card-body">
                  <h5 class="card-title">Other Expenses <span>| This Month</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-cart"></i>
                    </div>
                    <div class="ps-3">
                        <h6 class="w3-large w3-text-red">Rs.<?php echo number_format($data['SUM'],2) ?></h6>
                      <span class="text-success small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">decrease</span>

                    </div>
                  </div>
                </div>
                  
              </div>

               
            </div><!-- End Customers Card -->
            <?php } ?>
            
            
            
                 <?php
     
                
                  $ddata=array();
                  $edata=array();
                    require_once('C:/xampp/htdocs/test/controllers/operations_salary.php'); 
                    $db = new  operations_salary();
                    $result=$db->view3_record();
                    while($data = mysqli_fetch_assoc($result)){
                            array_push($ddata,$data['monthly_salary']);
                            array_push($edata,$data['month']); ?>
            <!-- Customers Card -->
            <div class="col-xxl-3 col-md-4">

              <div class="card info-card customers-card">
                <div class="card-body">
                  <h5 class="card-title">Salary Payments <span>| This Month</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-people"></i>
                    </div>
                    <div class="ps-3"> 
                      <h6 class="w3-large w3-text-red">Rs.<?php echo number_format($data['monthly_salary'],2) ?></h6>
                      <span class="text-success small pt-1 fw-bold">0%</span> <span class="text-muted small pt-2 ps-1">No Increase/decrease</span>

                    </div>
                  </div>
                  
                </div>
              </div>
               
            </div><!-- End Customers Card -->
            <?php } ?>
        
            
           
            
            
            
           <?php 
                  $memdata=array();
                  $saldata=array();
                  $equdata=array();
                  $othdata=array();
                  $mondata=array();
                    require_once('C:/xampp/htdocs/test/controllers/operations_income.php'); 
                    $db = new  operations_income();
                    $result=$db->view_record();
                    while($data = mysqli_fetch_assoc($result)){
                    array_push($memdata,$data['membership_payment']);
                    array_push($saldata,$data['salary_payment']);
                    array_push($equdata,$data['equipment_expenses']);
                    array_push($othdata,$data['other_expenses']);
                    array_push($mondata,$data['month']);
                     }
                    ?>
                   
            
            
            
            <!-- Reports -->
            <div class="col-12">
              <div class="card">

                <div class="card-body">
                  <h5 class="card-title">Income vs Expenses <span>/All Time</span></h5>

                  <!-- Line Chart -->
                  <div id="reportsChart"></div>

                  <script>
                    document.addEventListener("DOMContentLoaded", () => {
                      new ApexCharts(document.querySelector("#reportsChart"), {
                        series: [{
                          name: 'Membership Payments',
                          data: <?php echo json_encode($memdata); ?>,
                        }, {
                          name: 'Equipment Expenses',
                          data: <?php echo json_encode($othdata); ?>,
                        }, {
                            
                          name: 'Other Expenses',
                          data: <?php echo json_encode($equdata); ?>,
                        }, {
                          name: 'Salary Payments',
                          data: <?php echo json_encode($saldata); ?>,
                        }],
                        chart: {
                          height: 350,
                          type: 'area',
                          toolbar: {
                            show: false
                          },
                        },
                        markers: {
                          size: 4
                        },
                        colors: ['#2eca6a', '#4154f1','#41f1eb', '#ff771d'],
                        fill: {
                          type: "gradient",
                          gradient: {
                            shadeIntensity: 1,
                            opacityFrom: 0.3,
                            opacityTo: 0.4,
                            stops: [0, 90, 100]
                          }
                        },
                        dataLabels: {
                          enabled: false
                        },
                        stroke: {
                          curve: 'smooth',
                          width: 2
                        },
                        xaxis: {
                          categories: <?php echo json_encode($mondata); ?>,
                        },
                        tooltip: {
                          x: {
                            format: 'dd/MM/yy HH:mm'
                          },
                        }
                      }).render();
                    });
                  </script>
                  <!-- End Line Chart -->

                </div>

              </div>
            </div><!-- End Reports -->

            

      </div>
    </section>





















<div class="w3-container" style="margin-top:10px ; margin-bottom:10px" id="showcase">
    <h1 class="w3-xlarge w3-text-black"><b>Leave Summary</b></h1>  
</div> 

<div class="containe-fluid" >
	<div class="row mt-3 ml-3 mr-3">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    
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
                
                      
                       <table class=" table thead-dark table-hover datatable ">
                           <thead class="thead-dark w3-large" align = "center" scope="col" style="background-color: #B9D9EB; color:#000"> <tr>
                             
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
                
                      
                       <table class=" table thead-dark table-hover datatable ">
                           <thead class="thead-dark w3-large" align = "center" scope="col" style="background-color: #B9D9EB; color:#000"> <tr>
                             
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
                
                
 <div id="chart" ></div>

                       <script>
                       
                       var options = {
          series: [{
            name: "Number Of Leaves",
            beginAtZero: true,
            data: <?php echo json_encode($ydata); ?>
        }],
          
          toolbar: {
        show: true,
        offsetX: 0,
        offsetY: 0,
        tools: {
          download: true,
          selection: true,
          zoom: true,
          zoomin: true,
          zoomout: true,
          pan: true,
          reset: true | '<img src="/static/icons/reset.png" width="20">',
          customIcons: []
        },
        export: {
          csv: {
            filename: "Number Of Leaves",
            columnDelimiter: ',',
            headerCategory: 'category',
            headerValue: 'value',
            dateFormatter(timestamp) {
              return new Date(timestamp).toDateString()
            }
          },
          svg: {
            filename: "Number Of Leaves",
          },
          png: {
            filename: "Number Of Leaves",
          }
        },
        autoSelected: 'zoom' 
      },
          chart: {
              
                      height: 350,
          zoom: {
            enabled: true,
          }
        },
        dataLabels: {
          enabled: true
        },
        stroke: {
          curve: 'straight'
        },
        title: {
          
          align: 'left'
        },
        grid: {
          row: {
            colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
            opacity: 0.5
          },
        },
        xaxis: {
          categories: <?php echo json_encode($xdata); ?>,
        },
        yaxis: {
            forceNiceScale: true
        }
        };

        var chart = new ApexCharts(document.querySelector("#chart"), options);
        chart.render();
                       
                       
                       
                       </script>
                   
    
     

              
              
              
              
            </div>
          </div>
        </div>
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                </div>
            </div>      			
        </div>
    </div>
</div>






                
                
                
                
                
                
                
                
                
                
                </div>

   

            

            
            
            
            
            
                   
        







<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>