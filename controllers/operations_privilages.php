<?php 

   require_once('C:/xampp/htdocs/test/views/common/dbconfig.php'); 
    $db = new dbconfig();

    class  operations_privilages extends dbconfig
    {
        // Insert Record in the Database
        public function Store_Record()
        {
            global $db;
            if(isset($_POST['submit']))
            {
		$id = $db->check($_POST['id']);
                $name = $db->check($_POST['name']);
                $create = $db->check($_POST['create']);
		$update = $db->check($_POST['update']);
                $view = $db->check($_POST['view']);
                $delete = $db->check($_POST['delete']);
                $module_id = $db->check($_POST['module_id']);
                $role_id = $db->check($_POST['role_id']);
                
                

                if($this->insert_record($id,$name,$create,$update,$view,$delete,$module_id,$role_id))
                {
                    echo '<div class="alert alert-success"> Your Record Has Been Saved </div>';
                }
                else
                {
                    echo '<div class="alert alert-danger"> Failed. Please check and re-enter the IDs. </div>';
                }
            }
        }

        // Insert Record in the Database Using Query    
        function insert_record($id,$name,$create,$update,$view,$delete,$module_id,$role_id)
        {
            global $db;
            $query = "insert into privilages (id,name,create,update, view,delete,module_id,role_id) values('$id','$name','$create','$update','$view','$delete','$module_id','$role_id')";
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
            $query = "select * from privilages";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }

        // Get Particular Record
        public function get_record($id)
        {
            global $db;
            $sql = "select * from privilages where ID='$id'";
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
                $name = $db->check($_POST['name']);
                $create = $db->check($_POST['create']);
		$update = $db->check($_POST['update']);
                $view = $db->check($_POST['view']);
                $delete = $db->check($_POST['delete']);
                $module_id = $db->check($_POST['module_id']);
                $role_id = $db->check($_POST['role_id']);
               
                if($this->update_record($id,$name,$create,$update,$view,$delete,$module_id,$role_id ))
                {
                    $this->set_messsage('<div class="alert alert-success"> Your Record Has Been Updated </div>');
                    header("location:view.php");
                }
                else
                {   
                    $this->set_messsage('<div class="alert alert-success"> Something Wrong </div>');
                }

               
            }
        }

        // Update Function 2
        public function update_record($id,$name,$create,$update,$view,$delete,$module_id,$role_id)
        {
            global $db;
            $sql = "update privilages set name='$name', create='$create',update = '$update', view='$view', delete='$delete' module_id = '$module_id' , role_id = '$role_id' where ID='$id'";
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
            $query = "delete from privilages where ID='$id'";
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