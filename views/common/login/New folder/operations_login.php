<?php 

require_once('C:/xampp/htdocs/test/views/common/dbconfig.php'); 
    $db = new dbconfig();

    class operations_login extends dbconfig
	{
        public function Insert_Record()
        {
		//something was posted
            global $db;
            if(isset($_POST['submit']))
            {
                $user_name = $db->check($_POST['user_name']);
		$gender = $db->check($_POST['gender']);

		if(!empty($user_name) && !empty($password) && !is_numeric($user_name))
		{

			//read from database
			$query = "select * from useraccount where user_name = '$user_name' limit 1";
			$result = mysqli_query($con, $query);

			if($result)
			{
				if($result && mysqli_num_rows($result) > 0)
				{

					$user_data = mysqli_fetch_assoc($result);
					
					if($user_data['password'] === $password)
					{
                                              if($user_data['role_id'] == 'R-00001')
                                              {
						$_SESSION['user_id'] = $user_data['user_id'];
						header("Location: http://localhost/test/views/privilages/admin/dashboard_admin.php");
						die;
                                              }
                                              
                                              elseif($user_data['role_id'] == 'R-00002')
                                              {
						$_SESSION['user_id'] = $user_data['user_id'];
						header("Location: http://localhost/test/views/privilages/admin/dashboard_clerk.php");
						die;
                                              }
                                              
                                              elseif($user_data['role_id'] == 'R-00003')
                                              {
						$_SESSION['user_id'] = $user_data['user_id'];
						header("Location: http://localhost/test/views/privilages/admin/dashboard_instructor.php");
						die;
                                              }
                                              
                                              elseif($user_data['role_id'] == 'R-00004')
                                              {
						$_SESSION['user_id'] = $user_data['user_id'];
						header("Location: http://localhost/test/views/privilages/admin/dashboard_customer.php");
						die;
                                              }
					}
				}
			}
			
			?><!DOCTYPE html><html><title>Login Here</title><body onload="alert('<?php echo 'Wrong Credentials! \nPlease Try Again.' ?>')"> <?php
		}else
		{
			?><!DOCTYPE html><html><title>Login Here</title><body onload="alert('<?php echo 'Wrong Credentials! \nPlease Try Again.' ?>')"> <?php
		}
	}
        }
        
                }
?>
