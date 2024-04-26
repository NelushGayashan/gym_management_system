<?php 
    
    require_once('C:/xampp/htdocs/test/controllers/operations_gender.php'); 
    $db = new  operations_gender();
    $result=$db->view_record();
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/admin/header_admin.php');
    
?>
<head>
  <title>View Gender Details</title>  
</head>
<!-- Header -->
  <div class="w3-container" style="margin-top:80px ; margin-bottom:80px" id="showcase">
    <h1 class="w3-xxxlarge w3-text-black"><b>View Gender Details</b></h1>
    <hr style="width:50px;border:5px solid green" class="w3-round">
  </div>  




        <div class=" row col-lg m-auto card mt card-body table-responsive-lg w3-text-black" style="margin-left:-50px ; margin-top:50px; overflow-x: scroll ;"><!-- (A) SEARCH FORM -->
<form method="post" action="1-form.php" style="margin-bottom:40px ;margin-left:900px">
  
 <input type="text" name="search" placeholder="Search Here"  required > 
                 <input class="btn btn-small btn-primary" type="submit" value="Search"/>
</form>

<?php
                              $db->display_message(); 
                              $db->display_message();
                        ?> <div class="scroll" style="width:110%">
                            
                            
                           
                            
                       <table class=" table table-bordered table-hover ">
                           <thead class="thead-dark" align = "center"> <tr>
                                   
                                   
                                <td style="width: 10%" >Gender ID </td>
                                <td style="width: 10%" > Gender Name </td>
				<td style="width: 10%" colspan="3" >Operations</td>
                            
                            </tr></thead>
                            <tr>

<?php
// (B) PROCESS SEARCH WHEN FORM SUBMITTED
if (isset($_POST["search"])) {
  // (B1) SEARCH FOR USERS
  require "2-search.php";

  // (B2) DISPLAY RESULTS
  if (count($results) > 0) { foreach ($results as $data) {?>
                                    <td ><?php echo $data['id'] ?></td>
                                    <td ><?php echo $data['gender'] ?></td>

                                    
                                    
                                    
                                    <td align = "center"><a href="edit.php?U_ID=<?php echo $data['id'] ?>" type="button" class = " btn btn-warning btn-lg" style=" margin-right:5px  ">Edit</a>
                                    <a href="del.php?D_ID=<?php echo $data['id'] ?>" type="button" class = " btn btn-danger btn-lg">Delete</a></td>
                                    </tr>
                                    
<?php  }}} ?>
                       </table></div>
            
            
                    <h3 style=" margin-left:200px ; margin-top:100px ; margin-bottom:150px">Please click here to add a new record<a href="index.php"class="btn btn-success btn-lg" style=" margin-left:5px ; margin-top:0px ">Add</a></h3>
             
        </div>

  <?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>