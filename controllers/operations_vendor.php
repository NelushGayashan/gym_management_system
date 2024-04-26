<?php 

    require_once('C:/xampp/htdocs/test/views/common/dbconfig.php'); 
    $db = new dbconfig();

    class  operations_vendor extends dbconfig
    {
        // Insert Record in the Database
        public function Store_Record()
        {
            global $db;
            if(isset($_POST['submit']))
            {
				$id = $db->check($_POST['id']);
                $name = $db->check($_POST['name']);
                $equipments = $db->check($_POST['equipments']);
				$remarks = $db->check($_POST['remarks']);
                
        

                if($this->insert_record($id,$name,$equipments,$remarks))
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
        function insert_record($id,$name,$equipments,$remarks)
        {
            global $db;
            $query = "insert into vendor (id,name,equipments,remarks) values('$id','$name','$equipments','$remarks')";
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
            $query = "select * from vendor ORDER BY id DESC";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }

        // Get Particular Record
        public function get_record($id)
        {
            global $db;
            $sql = "select * from vendor where ID='$id'";
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
                $equipments = $db->check($_POST['equipments']);
		$remarks = $db->check($_POST['remarks']);
                
        

                if($this->update_record($id,$name,$equipments,$remarks))
                {
                    $this->set_messsage('<div class="alert alert-success"> Your Record Has Been Updated Successfullly. </div>');
                    header('location: view.php');
                }
                else
                {   
                    $this->set_messsage('<div class="alert alert-danger"> Invalid Data. Try Again! </div>');
                }

               
            }
        }

        // Update Function 2
        public function update_record($id,$name,$equipments,$remarks)
        {
            global $db;
            $sql = "update vendor set name='$name', equipments='$equipments',remarks = '$remarks' where ID='$id'";
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
            $query = "delete from vendor where ID='$id'";
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