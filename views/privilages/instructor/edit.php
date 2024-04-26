<?php 
    require_once('C:/xampp/htdocs/test/controllers/operations_useraccount.php'); 
    $db = new  operations_useraccount();
    $db->update();
    $id = $_GET['U_ID'];
    $result = $db->get_record($id);
    $data = mysqli_fetch_assoc($result);
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/instructor/header.php');
?>

<head>
    <title>Edit User Account Details</title>
</head>
<!-- Header -->
  <div class="w3-container  col-lg-12 w3-text-black card recent-sales row  m-auto card mt-5 card-body w3-text-black" style="margin-top:-1000px ; margin-bottom:10px " id="showcase" >
   
    <h1 class="w3-xxxlarge w3-text-black"><b> Edit User Account Details</b></h1>
    <hr style="width:50px;border:5px solid green" class="w3-round">
  </div>


<div class="pagetitle col-lg-12"  style="margin-top:10px ; margin-bottom:-50px; margin-left:0px ">
      
      <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/instructor/dashboard.php">Dashboard</a></li>
          
          <li class="breadcrumb-item active">Edit User Account Details</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->
  

        <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px">
            
                        <?php $db->Store_Record(); ?>
            
                        
                            
                            <form method="POST">
                               
                               
                                <input style="margin-bottom:30px" type="hidden" name="id" placeholder=" User Account ID" class="form-control mb-2" required value="<?php echo $data['id']; ?>">
                                
                                
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                    
                                <label for="First Name" class="col-sm-2 col-form-label">First Name</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="text" name="fname" placeholder="First Name" class="form-control mb-2" required value="<?php echo $data['fname']; ?>" >
                                </div>
                                
                                <label for="Last Name" class="col-sm-2 col-form-label">Last Name</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="text" name="lname" placeholder="Last Name" class="form-control mb-2" required value="<?php echo $data['lname']; ?>" >
                                </div>
                                
                                </div>
                                
                                
                                
                                
                                
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                    
                                <label for="User Name" class="col-sm-2 col-form-label">User Name</label>
                                <div class="col-sm-4">
                                <input id="username" style="margin-bottom:30px" type="text" name="user_name" placeholder="User Name" class="form-control mb-2" required value="<?php echo $data['user_name']; ?>" >
                                <span id="availability"></span>
                                <script>  
                                $(document).ready(function(){  
                                $('#username').blur(function(){

                                var username = $(this).val();

                                $.ajax({
                                url:'check.php',
                                method:"POST",
                                data:{user_name:username},
                                success:function(data)
                                {
                                if(data != '0')
                                   {
                                    $('#availability').html('<span class="alert alert-danger">Username is not available</span>');
                                    $('#submit').attr("disabled", true);
                                    }
                                    else
                                    {
                                    $('#availability').html('<span class="alert alert-success">Username is Available</span>');
                                    $('#submit').attr("disabled", false);
                                    }
                                    }
                                    })

                                    });
                                    });  
                                </script>
                                </div>
                                
                                <label for="Password" class="col-sm-2 col-form-label">Password</label>
                                <div class="col-sm-4">
                                <input id="password" type="password" style="margin-bottom:30px"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" minlength="8" name="password" placeholder="Password" class="form-control mb-2" required value="<?php echo $data['password']; ?>" >
                                <!-- An element to toggle between password visibility -->
                                <input  type="checkbox" onclick="myFunction()"> Show Password 
                                <script> 
                                    function myFunction() {
                                     var x = document.getElementById("password");
                                    if (x.type === "password") {
                                     x.type = "text";
                                    } else {
                                       x.type = "password"; }   } 
                                      
                                </script>
                                </div>
                                </div>
                                
                                
                                
                                
                                
                                <div  style=" margin-left:400px ; margin-top:100px ; margin-bottom:100px">
                                    <button class="btn btn-success btn-lg" name="btn_update"> Update </button>
                                </div>

                             </form>
                
        </div>
<!-- End page content -->

<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>