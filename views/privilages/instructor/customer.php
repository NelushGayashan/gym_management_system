<?php 

    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/instructor/header.php');
?>

<head>

    <title>Customer Details</title>
</head>
<!-- Header -->
  <div class="w3-container  w3-text-dark-green card recent-sales" style="margin-top:50px ; margin-bottom:20px " id="showcase" >
    <h1 class="w3-xxxlarge "><b>Customer Details</b></h1>
    <hr style="width:50px;border:5px solid green" class="w3-round">
  </div>
  <div class="pagetitle">
      
      <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/instructor/dashboard.php">Dashboard</a></li>
          <li class="breadcrumb-item active">Customer Details</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->
  
<div class="section dashboard col-xlg  col-12 card " style="margin-left:0px ; margin-top:00px ; margin-bottom:100px ; margin-right:000px">
    
<style>


/* Style the tab */
.tab {
  overflow: hidden;

  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
 
  border-top: none;
}
</style>
</head>
<body>


<p>Click on the buttons inside the tabbed menu:</p>

<div class="tab">
  <button class="tablinks" onclick="openCity(event, 'London')">Customer Details</button>
  <button class="tablinks" onclick="openCity(event, 'Paris')">Physical Details</button>
  <button class="tablinks" onclick="openCity(event, 'Tokyo')">Schedule Details</button>
  <button class="tablinks" onclick="openCity(event, 'Colombo')">Progress Details</button>
  <button class="tablinks" onclick="openCity(event, 'Mumbai')">Membership Details</button>
</div>

<div id="London" class="tabcontent">
<?php require_once('C:/xampp/htdocs/test/views/privilages/instructor/customer/view.php'); ?>
</div>

<div id="Paris" class="tabcontent">
<?php require_once('C:/xampp/htdocs/test/views/privilages/instructor/customer_details/view.php'); ?>
</div>

<div id="Tokyo" class="tabcontent">
  <h3>Tokyo</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>

<div id="Colombo" class="tabcontent">
  <h3>Colombo</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>

<div id="Mumbai" class="tabcontent">
  <h3>Mumbai</h3>
  <p>Paris is the capital of France.</p> 
</div>


<script>
function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}
</script>
    
    
    
</div>

        
    

<!-- End page content -->

<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>