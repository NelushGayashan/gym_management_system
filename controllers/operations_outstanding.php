<?php 

      require_once('C:/xampp/htdocs/test/views/common/dbconfig.php'); 
    $db = new dbconfig();

    class  operations_outstanding extends dbconfig
    {
        // Insert Record in the Database
        public function Store_Record()
        {
            global $db;
           if(isset($_POST['submit']))
            {
                $id = $_POST['id'];
                $remark = $db->check($_POST['remark']);
                $useraccount_id = $db->check($_POST['useraccount_id']);
                $register_id = $db->check($_POST['register_id']);
				$membership_id = $db->check($_POST['membership_id']);
                $customer_name = $db->check($_POST['customer_name']);
                $customer_id = $db->check($_POST['customer_id']);

                if($this->insert_record($id,$remark,$useraccount_id,$register_id,$membership_id,$customer_name,$customer_id ))
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
        function insert_record($id,$remark,$useraccount_id,$register_id,$membership_id,$customer_name,$customer_id)
        {
            global $db;
            $query = "insert into outstanding (id,remark,useraccount_id,register_id,membership_id,customer_name,customer_id) values('$id','$remark','$useraccount_id','$register_id','$membership_id','$customer_name','$customer_id')";
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
            $query = "select * from outstanding ORDER BY id DESC";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }

        // Get Particular Record
        public function get_record($id)
        {
            global $db;
            $sql = "select * from outstanding where ID='$id'";
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
                $remark = $db->check($_POST['remark']);
                $useraccount_id = $db->check($_POST['useraccount_id']);
                $register_id = $db->check($_POST['register_id']);
		$membership_id = $db->check($_POST['membership_id']);
                $customer_name = $db->check($_POST['customer_name']);
                $customer_id = $db->check($_POST['customer_id']);

                if($this->update_record($id,$remark,$useraccount_id,$register_id,$membership_id,$customer_name,$customer_id ))
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
        public function update_record($id,$remark,$useraccount_id,$register_id,$membership_id,$customer_name,$customer_id)
        {
            global $db;
            $sql = "update outstanding set remark='$remark',useraccount_id='$useraccount_id', register_id='$register_id',membership_id = '$membership_id', customer_name='$customer_name', customer_id='$customer_id' where ID='$id'";
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
            $query = "delete from outstanding where ID='$id'";
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