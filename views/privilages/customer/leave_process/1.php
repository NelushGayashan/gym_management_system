<!DOCTYPE html>
<html lang="en">

<?php 

	require_once('C:/xampp/htdocs/Fitness_For_Everyone/styles.html'); 
	    require_once('C:/xampp/htdocs/Fitness_For_Everyone/admin_only/leave_process/operations.php'); 

    $db = new operations_leave_process();
    
?>

<title>Leave Process Add Form</title>
<body>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-neon-green w3-collapse w3-top w3-medium w3-padding" style="z-index:3;width:200px;font-weight:bold;" id="mySidebar"><br>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
  <div class="w3-container">
    <h2 class="w3-padding-64" align = "center"><b>FITNESS FOR </br> EVERYONE </b></h2>
	
  </div>
  
  <div class="w3-bar-block ">
    <a href="#DASHBOARD" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white w3-hover-neon-green:hover">DASHBOARD</a> 
    <a href="#showcase" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white w3-hover-neon-green:hover">Showcase</a> 
    <a href="#services" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white w3-hover-neon-green:hover">Services</a> 
    <a href="#designers" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white w3-hover-neon-green:hover">Designers</a> 
    <a href="#packages" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white w3-hover-neon-green:hover">Packages</a> 
    <a href="#contact" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white w3-hover-neon-green:hover">Contact</a>
  </div>
</nav>

<!-- Top menu on small screens -->
<header class="w3-container w3-top w3-hide-large w3-red w3-xlarge w3-padding">
  <a href="javascript:void(0)" class="w3-button w3-red w3-margin-right" onclick="w3_open()">☰</a>
  <span>Company Name</span>
</header>



<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:340px;margin-right:40px">

  <!-- Header -->
  <div class="w3-container" style="margin-top:80px" id="showcase">
    <h1 class="w3-jumbo"><b>  </b></h1>
    <h1 class="w3-xxxlarge "><b>Leave Process Add Form</b></h1>
    <hr style="width:50px;border:5px solid green" class="w3-round">
  </div>
  
<div class="container">
        <div class="row">
            <div class="col-lg-6 m-auto">
                </div>
                        <?php $db->Store_Record(); ?>
                    <div class="card-body" align = "right">
                            <form method="POST">
								<input type="text" name="id" placeholder="Leave Process ID" class="form-control mb-2" required>
                                <input type="date" name="date" placeholder=" Date" class="form-control mb-2" required>
                                <input type="text" name="remark" placeholder="Remarks" class="form-control mb-2" required>
								<input type="text" name="leave_details_id" placeholder="Leave Details ID" class="form-control mb-2" required>
								
                    
						
                            <button class="btn btn-success" name="btn_save"> Save </button>
							<a class="btn btn-sucess" href="view.php?D_ID=<?php echo $data['id'] ?>" >View</a>
                        </form>
					</div>
                </div>
            </div>
        </div>
 </div>





  


 </div> </div> </div> </div>

<?php 

	require_once('C:/xampp/htdocs/Fitness_For_Everyone/footer.php'); 
    
?>

<script>
// Script to open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}

// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}
</script>

</body>
</html>
