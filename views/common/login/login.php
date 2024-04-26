<?php 
    require_once('C:/xampp/htdocs/test/controllers/operations_login.php');  
    $db = new operations_login();
    

?>
<!DOCTYPE html>
<html>
<head>
    
    <title>Login Here</title>
      <link href="localhost/test/views/common/assets/img/favicon.png" rel="icon">
  <link href="localhost/test/views/common/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
  
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

* {
  box-sizing: border-box;
}

.bg-image {
  /* The image used */
  background-image: url('http://localhost/test/views/common/Images/photographer.jpg');
  
  /* Add the blur effect */
  filter: blur(8px);
  -webkit-filter: blur(8px);
  
  /* Full height */
  height: 100%; 
  
  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

/* Position text in the middle of the page/image */
.bg-text {
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0, 0.4); /* Black w/opacity/see-through */
  color: white;
  font-weight: bold;
  border: 3px solid #f1f1f1;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2;
  width: 600px;
  padding: 20px;
  text-align: center;
}
</style>
</head>
<body>

<div class="bg-image"></div>

<div class="bg-text">
    
  <h1 style="font-size:50px ; margin-top:40px ; margin-bottom:60px">Login Here</h1>
  


            <?php $db->Check_Record(); ?>
            
           <form class= "animate"  action = " "  method="post">
			 <div class="container">
        
                            <label style="margin-top:40px ; margin-bottom:20px ; margin-right:500px " >Username</label>
                            
                            <input style="margin-bottom:40px " type="text" placeholder=" Enter User Name Here" name="user_name" value="<?php echo $user_name; ?>" required>
                            
                            
                            
                            <label style="margin-bottom:20px ; margin-right:500px " >Password</label>
                            
                            <input id="password" input style="margin-bottom:0px " type="password" placeholder="Enter Password Here" name="password" value="<?php echo $_POST['password']; ?>" required>
                            <input  style="margin-bottom:30px ; margin-top:10px " type="checkbox" onclick="myFunction()"> Show Password 
                                <script> 
                                    function myFunction() {
                                     var x = document.getElementById("password");
                                    if (x.type === "password") {
                                     x.type = "text";
                                    } else {
                                       x.type = "password"; }   } 
                                      
                                </script>
                             
                                
				<button name="submit" class="btn">Login</button>
			<label style=" margin-right:500px ">
        <input style=" margin-bottom:40px " type="checkbox" checked="checked" name="remember"> Remember me <span class="psw">Forgot <a href=href="#" onclick='return test_click();'>password?</a></span></label>
        <script type="text/javascript">
        function test_click(event){
        alert("Please contact us to reset the password!\n\
                \n\
                Telephone   077 123 123 4\n\
                Email           fitnessforeveryone@gmail.com");
        return false;
        }
        </script>

                         </div>
		</form>
	 
       
    
  
      
      
    
  </form>





</div>

</body>
</html>
