<?php 

    require_once('C:/xampp/htdocs/test/views/common/dbconfig.php'); 
    $db = new dbconfig();
    error_reporting(0);
    
    class  operations_login extends dbconfig
    {
        
        public function Check_Record()
        {
            global $db;
            
             if (isset($_POST['submit'])) {
                $user_name = $_POST['user_name'];
                $password = $_POST['password'];
                
                    $sql = "SELECT * FROM useraccount WHERE user_name='$user_name' AND password='$password'";
                    $result = mysqli_query($db->connection,$sql);
                    if ($result->num_rows > 0) {
                            $data = mysqli_fetch_assoc($result);
                            $_SESSION['id'] = $data['id'];
                            $_SESSION['user_name'] = $data['user_name'];
                            $_SESSION['password'] = $data['password'];
                            $_SESSION['fname'] = $data['fname'];
                            $_SESSION['lname'] = $data['lname'];
                            
                            
                            if($data['role_id'] == 'R-00001'){
                            
                                
                            header("Location: http://localhost/test/views/privilages/admin/dashboard.php");
                            
                   
                            }
                                              
                            elseif($data['role_id'] == 'R-00002')
                            {
                            
                            header("Location: http://localhost/test/views/privilages/clerk/dashboard.php");
                   
                            }
                                              
                            elseif($data['role_id'] == 'R-00003')
                            {
                            
                            header("Location: http://localhost/test/views/privilages/instructor/dashboard.php");
                   
                            }
                                              
                            else
                            {
                            
                            header("Location: http://localhost/test/views/privilages/customer/dashboard.php");
                    }
                    
            }
            else
            {   
                
            ?><!DOCTYPE html><html><title>Login Here</title><body onload="alert('<?php echo 'Wrong Credentials! \nPlease Try Again.'; ?>')"> <?php
            }
             
        }
        
        }
               
               
       
        // Set Session Message
        public function set_messsage($msg)
        {
            if(!empty($msg))
            {   
                
                $_SESSION['Message']=$msg;
            }
            else
            {
                $msg = "Message is empty";
                $_SESSION['Message']=$msg;
            }
        }

        // Display Session Message
        public function display_message()
        {
            if(isset($_SESSION['Message']))
            {
                echo $_SESSION['Message'];
                unset($_SESSION['Message']);
            }
            
        }
    
    }

