<?php 

    require_once('C:/xampp/htdocs/test/views/common/dbconfig.php'); 
    $db = new dbconfig();

    class  operations_useraccount extends dbconfig
    {
        // Insert Record in the Database
        public function Store_Record()
        {
            global $db;
            if(isset($_POST['submit']))
            {
				$id = $db->check($_POST['id']);
                $user_name = $db->check($_POST['user_name']);
                $password = $db->check($_POST['password']);
				$role_id = $db->check($_POST['role_id']);
                $fname = $db->check($_POST['fname']);
                $lname = $db->check($_POST['lname']);

                if($this->insert_record($id,$user_name,$password,$role_id,$fname,$lname))
                {
                    $this->set_messsage('<div class="alert alert-success"> Your Record Has Been Saved Successfullly. </div>');
                    
                    echo "<script>window.location.href='view.php';</script>";
                }
                else
                {   
                    $this->set_messsage('<div class="alert alert-danger"> Invalid Data. Try Again! </div>');
                }

            }
        }

        // Insert Record in the Database Using Query    
        function insert_record($id,$user_name,$password,$role_id,$fname,$lname)
        {
            global $db;
            $query = "insert into useraccount (id,user_name,password,role_id, fname,lname) values('$id','$user_name','$password','$role_id','$fname','$lname')";
            $result = mysqli_query($db->connection,$query);

            if($result)
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        // View Database Record
        public function view_record()
        {
            global $db;
            $query = "select * from useraccount ORDER BY id DESC";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }

        // Get Particular Record
        public function get_record($id)
        {
            global $db;
            $sql = "select * from useraccount where ID='$id'";
            $data = mysqli_query($db->connection,$sql);
            return $data;

        }

        // Update Record
        public function update()
        {
            global $db;

            if(isset($_POST['btn_update']))
            {
                $id = $_POST['id'];
                $user_name = $db->check($_POST['user_name']);
                $password = $db->check($_POST['password']);
		$role_id = $db->check($_POST['role_id']);
                $fname = $db->check($_POST['fname']);
                $lname = $db->check($_POST['lname']);

                if($this->update_record($id,$user_name,$password,$role_id,$fname,$lname ))
                {
                    $this->set_messsage('<div class="alert alert-success"> Your Record Has Been Updated Successfullly. </div>');
                    header('location: view.php');
                }
                else
                {   
                    $this->set_messsage('<div class="alert alert-danger"> Invalid Data. Try Again! </div>');
                }


               
            }
            
            if(isset($_POST['btn_update1']))
            {
                $id = $_POST['id'];
                $user_name = $db->check($_POST['user_name']);
                $password = $db->check($_POST['password']);
		$role_id = $db->check($_POST['role_id']);
                $fname = $db->check($_POST['fname']);
                $lname = $db->check($_POST['lname']);

                if($this->update_record($id,$user_name,$password,$role_id,$fname,$lname ))
                {
                    ?>
                    <html><a href="http://localhost/test/views/privilages/admin/edit.php?U_ID=<?php echo $_SESSION['id'];  ?>"></a></html>
                    <!DOCTYPE html><html><title>Edit User Account Details</title><body onload="alert('<?php echo ' Changed Successfully '; ?>')"> </html>
                    
                       <?php
                }
                else
                {   
                    $this->set_messsage('<div class="alert alert-danger"> Something Wrong </div>');
                }

               
            }
        }

        // Update Function 2
        public function update_record($id,$user_name,$password,$role_id,$fname,$lname)
        {
            global $db;
            $sql = "update useraccount set user_name='$user_name', password='$password',role_id = '$role_id', fname='$fname', lname='$lname' where ID='$id'";
            $result = mysqli_query($db->connection,$sql);
            if($result)
            {
                return true;
            }
            else
            {
                return false;
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
                $msg = "";
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

        // Delete Record
        public function Delete_Record($id)
        {
            global $db;
            $query = "delete from useraccount where ID='$id'";
            $result = mysqli_query($db->connection,$query);
            if($result)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

      

    }




?>