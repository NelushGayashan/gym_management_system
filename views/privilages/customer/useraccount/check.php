<?php  
//check.php  
$connect = mysqli_connect("localhost", "root", "", "fitness_for_everyone"); 
if(isset($_POST["user_name"]))
{
 $username = mysqli_real_escape_string($connect, $_POST["user_name"]);
 $query = "SELECT * FROM useraccount WHERE user_name = '".$username."'";
 $result = mysqli_query($connect, $query);
 echo mysqli_num_rows($result);
}
?>