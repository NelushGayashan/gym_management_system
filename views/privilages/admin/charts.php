<div class="col-lg-12">          <div class="card">            <div class="card-body">                                <?php                                       $dataPoints=array();                    require_once('C:/xampp/htdocs/test/controllers/operations_leave_process.php');                     $db = new  operations_leave_process();                    $result=$db->view2_record();                    while($data = mysqli_fetch_assoc($result)){                                        $dataPoints[] = array("y" => $data['no_of_rows'], "label" => $data['date'] );                                }echo json_encode($dataPoints, JSON_NUMERIC_CHECK);                ?>                                 <?php                                       $xdata=array();                  $ydata=array();                    require_once('C:/xampp/htdocs/test/controllers/operations_leave_process.php');                     $db = new  operations_leave_process();                    $result=$db->view2_record();                    while($data = mysqli_fetch_assoc($result)){                                                                                        array_push($xdata,$data['date']);                                           array_push($ydata,$data['no_of_rows']);                                }                echo json_encode($xdata);echo json_encode($ydata);                                ?>                                                       <script>    window.onload = function() {         var chart = new CanvasJS.Chart("chartContainer", {    	animationEnabled: true,    	theme: "light2",    	title:{    		text: "Leaves Per Day"    	},    	axisY: {    		title: "Leaves Per Day"    	},        axisX: {    		title: "Working Days"    	},    	data: [{    		type: "column",    		yValueFormatString: "leaves - #,##0.## ",    		dataPoints: <?php echo json_encode($dataPoints, JSON_NUMERIC_CHECK); ?>    	}]    });    chart.render();         }    </script>       <div id="chartContainer" style="height: 370px; width: 100%;"></div>    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>         <!-- Line Chart -->              <div id="lineChart" style="min-height: 400px;" class="echart"></div>              <script>                document.addEventListener("DOMContentLoaded", () => {                  echarts.init(document.querySelector("#lineChart")).setOption({                    xAxis: {                      type: 'category',                      data: <?php echo json_encode($xdata); ?>                    },                    yAxis: {                      type: 'value'                    },                    series: [{                      data: <?php echo json_encode($ydata); ?>,                      type: 'line',                      smooth: true                    }]                  });                });              </script>              <!-- End Line Chart -->                                          </div>          </div>        </div>