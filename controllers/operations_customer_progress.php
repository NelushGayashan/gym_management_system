<?php 

     require_once('C:/xampp/htdocs/test/views/common/dbconfig.php'); 
    $db = new dbconfig();

    class  operations_customer_progress extends dbconfig
    {
        // Insert Record in the Database
        public function Store_Record()
        {
            global $db;
            if(isset($_POST['submit']))
            {
				$id = $db->check($_POST['id']);
                $progress_details = $db->check($_POST['progress_details']);
                $schedule_details_id = $db->check($_POST['schedule_details_id']);
		$customer_details_id = $db->check($_POST['customer_details_id']);		

                if($this->insert_record($id,$progress_details,$schedule_details_id,$customer_details_id))
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
        function insert_record($id,$progress_details,$schedule_details_id,$customer_details_id)
        {
            global $db;
            $query = "insert into customer_progress (id,progress_details,schedule_details_id,customer_details_id) values('$id','$progress_details','$schedule_details_id', '$customer_details_id')";
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
        public function viewc1_record()
        {
            global $db;
            $query = "select * from customer_progress cp, schedule_details s, customer c, useraccount u, customer_details cd
                        where cp.schedule_details_id = s.id and s.customer_details_id = cd.id and u.id = c.useraccount_id and  c.id = cd.customer_id 
                        and u.id = '".$_SESSION['id']."' ORDER BY c.id DESC";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }

        public function view_record()
        {
            global $db;
            $query = "select * from customer_progress ORDER BY id DESC";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        // Get Particular Record
        public function get_record($id)
        {
            global $db;
            $sql = "select * from customer_progress where ID='$id'";
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
                $progress_details = $db->check($_POST['progress_details']);
                $schedule_details_id = $db->check($_POST['schedule_details_id']);
		$customer_details_id = $db->check($_POST['customer_details_id']);		

                if($this->update_record($id,$progress_details,$schedule_details_id,$customer_details_id))
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
        public function update_record($id,$progress_details,$schedule_details_id,$customer_details_id)
        {
            global $db;
            $sql = "update customer_progress set progress_details='$progress_details', schedule_details_id='$schedule_details_id', customer_details_id = '$customer_details_id' where ID='$id'";
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
            $query = "delete from customer_progress where ID='$id'";
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