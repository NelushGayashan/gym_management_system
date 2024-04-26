<?php 

      require_once('C:/xampp/htdocs/test/views/common/dbconfig.php'); 
    $db = new dbconfig();

    class  operations_equipments_in_use extends dbconfig
    {
        // Insert Record in the Database
        public function Store_Record()
        {
            global $db;
            if(isset($_POST['submit']))
            {
		$id = $db->check($_POST['id']);
                $name = $db->check($_POST['name']);
                $vendor_name = $db->check($_POST['vendor_name']);
		$equipment_purchases_id = $db->check($_POST['equipment_purchases_id']);
               
                $quantity = $db->check($_POST['quantity']);
                $status = $db->check($_POST['status']);

                if($this->insert_record($id,$name,$vendor_name,$equipment_purchases_id,$quantity,$status))
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
        function insert_record($id,$name,$vendor_name,$equipment_purchases_id,$quantity,$status)
        {
            global $db;
            $query = "insert into equipments_not_in_use (id,name,vendor_name,equipment_purchases_id,quantity,status) values('$id','$name','$vendor_name','$equipment_purchases_id','$quantity','$status')";
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
            $query = "select * from equipments_not_in_use";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }

        // Get Particular Record
        public function get_record($id)
        {
            global $db;
            $sql = "select * from equipments_not_in_use where ID='$id'";
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
                $vendor_name = $db->check($_POST['vendor_name']);
		$equipment_purchases_id = $db->check($_POST['equipment_purchases_id']);
               
                $quantity = $db->check($_POST['quantity']);
                $status = $db->check($_POST['status']);

                if($this->update_record($id,$name,$vendor_name,$equipment_purchases_id,$quantity,$status ))
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
        public function update_record($id,$name,$vendor_name,$equipment_purchases_id,$quantity,$status)
        {
            global $db;
            $sql = "update equipments_not_in_use set name='$name', vendor_name='$vendor_name',equipment_purchases_id = '$equipment_purchases_id', quantity='$quantity' , status='$status' where ID='$id'";
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
            $query = "delete from equipments_not_in_use where ID='$id'";
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