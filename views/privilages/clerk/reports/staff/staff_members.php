<?php 
    
    require_once('C:/xampp/htdocs/test/controllers/operations_staff.php'); 
    $db = new  operations_staff();
    $result=$db->view_record();
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
require_once('C:/xampp/htdocs/test/views/privilages/clerk/header.php');
    
?>
<head>
  <title>All Staff Members</title>  
</head>
<!-- Header -->
  <div class="w3-container  w3-text-black card recent-sales" style="margin-top:50px ; margin-bottom:20px " id="showcase" >
    <h1 class="w3-xxlarge "><b>All Staff Members</b></h1>
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div> 
<div class="pagetitle">
      
      <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/clerk/dashboard.php">Dashboard</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/clerk/reports.php">Reports</a></li>
          
          <li class="breadcrumb-item active">All Staff Members</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->


               <div class="card-body row col-lg m-auto card mt card-body table-responsive-lg w3-text-black " style="  margin-left:-50px ; margin-top:50px ; margin-bottom:0px ">
                        
                   
          
                
                      
                       <table id="Member_Registrations" class=" table table-hover display nowrap">
                           <thead class="thead-dark w3-large" align = "center" scope="col" style="background-color: #21B6A8; color:#FFF"> <tr>
                                   
                                
                                <td  style="width: 1%"> # </td>
                                <td style="width: 5%"> Staff Member's Name </td>
                                <td style="width: 20%"> Address </td>
                                <td style="width: 5%"> Telephone </td> 
                                <td style="width: 10%"> Email </td>
                                <td style="width: 5%"> Date Of Joined </td>

                                
                            
                            
                            </tr></thead>
                            <tr >
                                <?php 
                                 $i=0;   while($data = mysqli_fetch_assoc($result))
                                    {  $i++;
                                ?>
                                
                                    <td style="background-color: #fff; color:#097969"><?php echo $i ?></td>
                                    <td style="background-color: #fff; color:#097969"><?php echo $data['fname']." ".$data['lname'] ?></td>
                                    <td style="background-color: #fff; color:#097969"><?php echo $data['address'] ?></td>
                                    <td style="background-color: #fff; color:#097969"><?php echo $data['telephone'] ?></td> 
                                    <td style="background-color: #fff; color:#097969"><?php echo $data['email'] ?></td>
                                    <td style="background-color: #fff; color:#097969"><?php echo $data['doj'] ?></td>

									
			

                                    
                                    </tr>
                                    
                            <?php  } ?>
                        </table>
                   
                       <?php
     
                
                  $xdata=array();
                  $ydata=array();
                    require_once('C:/xampp/htdocs/test/controllers/operations_staff.php'); 
                    $db = new  operations_staff();
                    $result=$db->view2_record();
                    
                
                
                ?>

                       <div class="card-body">
                <div class="w3-container" style="margin-top:50px ; margin-bottom:10px" id="showcase">
                <h1 class="w3-large w3-text-black"><b>Staff Member Employment</b></h1></div> 
                   
                   
                   
                      <table id="Member_Registrations_Per_Month" class=" table table-hover display nowrap" style="width:50%" style="margin-left:200px ;margin-bottom:100px">
                           <thead class="thead-dark w3-large" align = "center" scope="col" style="background-color: #21B6A8; color:#FFF"> <tr>
                                   
                                <td  style="width: 1%"> # </td>
                                <td style="width: 5%"> Year-Month </td>
                                <td style="width: 5%"> Number Of Employments </td>
                                

                                
                            
                            
                            </tr></thead>
                            <tr >
                               <?php 
                                 $i=0;   while($data = mysqli_fetch_assoc($result))
                                    {  $i++;
                                ?>
                                
                                    <td style="background-color: #fff; color:#097969"><?php echo $i ?></td>
                                    <td style="background-color: #fff; color:#097969"><?php echo $data['MONTH'] ?></td>
                                    <td style="background-color: #fff; color:#097969"><?php echo $data['COUNT'] ?></td>
                                    

									
			

                                    
                                    </tr>
                                    
                            <?php  } ?>
                        </table>
                   
                   
                   
                   
                   
                   
                   
                   
                       <div class="card-body">
                <div class="w3-container" style="margin-top:50px ; margin-left:-20px ; margin-bottom:-20px" id="showcase">
                <h1 class="w3-medium w3-text-black"><b>Staff Member Employment Count</b></h1></div> </div> 

     
                 <?php
     
                
                  $xdata=array();
                  $ydata=array();
                    require_once('C:/xampp/htdocs/test/controllers/operations_staff.php'); 
                    $db = new  operations_staff();
                    $result=$db->view2_record();
                    while($data = mysqli_fetch_assoc($result)){
                    
                    
                        
                        array_push($xdata,$data['MONTH']);
                       
                    array_push($ydata,$data['COUNT']);
                
                }
                
                
                ?>


          <div id="chart"></div>

                       <script>
                       
                       var options = {
          series: [{
            name: "Staff Member Employment",
            data: <?php echo json_encode($ydata); ?>,
        }],
          chart: {
         height: 350,
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
            filename: "Staff Member Employment",
            columnDelimiter: ',',
            headerCategory: 'category',
            headerValue: 'value',
            dateFormatter(timestamp) {
              return new Date(timestamp).toDateString()
            }
          },
          svg: {
            filename: "Staff Member Employment",
          },
          png: {
            filename: "Staff Member Employment",
          }
        },
        autoSelected: 'zoom' 
      },
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
           tickAmount: undefined,
                        
                        min: undefined,
                        max: undefined,
                        range: undefined,
                        floating: false,
                        decimalsInFloat: undefined,
                        overwriteCategories: undefined,
                        position: 'bottom',
          
          labels: {
                                    show: true,
                                    rotate: -45,
                                    rotateAlways: false,
                                    hideOverlappingLabels: true,
                                    showDuplicates: false,
                                    trim: false,
                                    minHeight: undefined,
                                    maxHeight: 120,
                            style: {
                                    colors: [],
                                    fontSize: '12px',
                                    fontFamily: 'Helvetica, Arial, sans-serif',
                                    fontWeight: 400,
                                    cssClass: 'apexcharts-xaxis-label',
                                    },
                                    offsetX: 0,
                                    offsetY: 0,
                                    format: undefined,
                                    formatter: undefined,
                                    datetimeUTC: true,
                            datetimeFormatter: {
                                    year: 'yyyy',
                                    month: "MMM 'yy",
                                    day: 'dd MMM',
                                    hour: 'HH:mm',
                                    },
                                    },
                                            
                             axisBorder: {
                                    show: true,
                                    color: '#78909C',
                                    height: 1,
                                    width: '100%',
                                    offsetX: 0,
                                    offsetY: 0
                                    },
                            axisTicks: {
                                    show: true,
                                    borderType: 'solid',
                                    color: '#78909C',
                                    height: 6,
                                    offsetX: 0,
                                    offsetY: 0
                                    },
                            title: {
                                    text: "Year-Month",
                                    offsetX: 0,
                                    offsetY: 0,
                            style: {
                                    color: "black",
                                    fontSize: '16px',
                                    fontFamily: 'Helvetica, Arial, sans-serif',
                                    fontWeight: 600,
                                    cssClass: 'apexcharts-xaxis-title',
                                    },
                                    },
                             crosshairs: {
                                    show: true,
                                    width: 1,
                                    position: 'back',
                                    opacity: 0.9,        
                            stroke: {
                                    color: '#b6b6b6',
                                    width: 0,
                                    dashArray: 0,
                                    },
                            fill: {
                                    type: 'solid',
                                    color: '#B1B9C4',
                            gradient: {
                                    colorFrom: '#D8E3F0',
                                    colorTo: '#BED1E6',
                                    stops: [0, 100],
                                    opacityFrom: 0.4,
                                    opacityTo: 0.5,
                                    },
                                    },
                            dropShadow: {
                                    enabled: false,
                                    top: 0,
                                    left: 0,
                                    blur: 1,
                                    opacity: 0.4,
                                    },
                                    },
                            tooltip: {
                                    enabled: true,
                                    formatter: undefined,
                                    offsetY: 0,
                            style: {
                                    fontSize: 0,
                                    fontFamily: 0,
                                    },
                                    },
            yaxis: {
                            show: true,
                            showAlways: true,
                            showForNullSeries: true,
                            seriesName: undefined,
                            opposite: false,
                            reversed: false,
                            logarithmic: false,
                            logBase: 10,
                            tickAmount: undefined,
                            tickPlacement: 'between',
                            min: undefined,
                            max: undefined,
                            forceNiceScale: true,
                            floating: false,
                            decimalsInFloat: undefined,
                                labels: {
                                    show: true,
                                    align: 'right',
                                    rotateAlways: false,
                                    hideOverlappingLabels: true,
                                    showDuplicates: false,
                                    trim: false,
                                    minWidth: 0,
                                    maxWidth: 160,
          
                                style: {
                                    colors: [],
                                    fontSize: '12px',
                                    fontFamily: 'Helvetica, Arial, sans-serif',
                                    fontWeight: 400,
                                    cssClass: 'apexcharts-yaxis-label',
                                    },
                                    offsetX: 0,
                                    offsetY: 0,
                                    rotate: 0,
                                    formatter: undefined,
                                    },
                                axisBorder: {
                                    show: true,
                                    color: '#78909C',
                                    offsetX: 0,
                                    offsetY: 0
                                    },
                                axisTicks: {
                                    show: true,
                                    borderType: 'solid',
                                    color: '#78909C',
                                    width: 6,
                                    offsetX: 0,
                                    offsetY: 0
                                    },
                                title: {
                                    text: "Number Of Staff Employment",
                                    rotate: -90,
                                    offsetX: 0,
                                    offsetY: 0,
                                style: {
                                    color: "black",
                                    fontSize: '16px',
                                    fontFamily: 'Helvetica, Arial, sans-serif',
                                    fontWeight: 600,
                                    cssClass: 'apexcharts-yaxis-title',
                                    },
                                    },
                                crosshairs: {
                                    show: true,
                                    position: 'back',
                                stroke: {
                                    color: '#b6b6b6',
                                    width: 1,
                                    dashArray: 0,
                                    },
                                    },
                                tooltip: {
                                    enabled: true,
                                    offsetX: 0,
                                    },
      
                                    }
                                    
        }
        };

        var chart = new ApexCharts(document.querySelector("#chart"), options);
        chart.render();
                       
                       
                       
                       </script>
                   
                   

          

              
              
              
              
            </div>
                   
                   
                   
                   
                   
                   
				</div>
            
                   
        </div>

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
                                        title: 'Staff Member Employment'
                                    },
                                    {
                                        extend: 'csvHtml5',
                                        title: 'Staff Member Employment'
                                    },
                                    {
                                        extend: 'excelHtml5',
                                        title: 'Staff Member Employment'
                                    },
                                    {
                                        extend: 'pdfHtml5',
                                        title: 'Staff Member Employment'
                                    },
                                    {
                                        extend: 'print',
                                        title: 'Staff Member Employment'
                                    }
                                    ]
                        } );
                        } );
                   </script>
           
                   <script>
                   $(document).ready(function() {
                    $('#Member_Registrations_Per_Month').DataTable( {
                        dom: 'Bfrtip',
                        buttons: [
                                    {
                                        extend: 'copyHtml5',
                                        title: 'Member Registrations Per Month'
                                    },
                                    {
                                        extend: 'csvHtml5',
                                        title: 'Member Registrations Per Month'
                                    },
                                    {
                                        extend: 'excelHtml5',
                                        title: 'Member Registrations Per Month'
                                    },
                                    {
                                        extend: 'pdfHtml5',
                                        title: 'Member Registrations Per Month'
                                    },
                                    {
                                        extend: 'print',
                                        title: 'Member Registrations Per Month'
                                    }
                                    ]
                        } );
                        } );
                   </script>



