<?php 

    require_once('C:/xampp/htdocs/Fitness_For_Everyone/dbconfig.php');
    $db = new dbconfig();

    class  operations_leave_details extends dbconfig
    {
        // Insert Record in the Database
        public function Store_Record()
        {
            global $db;
            if(isset($_POST['btn_save']))
            {
				$id = $db->check($_POST['id']);
                $staff_id = $db->check($_POST['staff_id']);
                $date = $db->check($_POST['date']);
				 $staff_member_name = $db->check($_POST['staff_member_name']);
				
				

                if($this->insert_record($id,$staff_id,$date,$staff_member_name))
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
        function insert_record($id,$staff_id,$date,$staff_member_name)
        {
            global $db;
            $query = "insert into leave_details (id,staff_id,date,staff_member_name) values('$id','$staff_id','$date','$staff_member_name')";
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
            $query = "select * from leave_details";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }

        // Get Particular Record
        public function get_record($id)
        {
            global $db;
            $sql = "select * from leave_details where ID='$id'";
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
                $staff_id = $db->check($_POST['staff_id']);
                $date = $db->check($_POST['date']);
				$staff_member_name = $db->check($_POST['staff_member_name']);
				

                if($this->update_record($id,$staff_id,$date,$staff_member_name))
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
        public function update_record($id,$staff_id,$date,$staff_member_name)
        {
            global $db;
            $sql = "update leave_details set staff_id='$staff_id', date='$date' , staff_member_name = '$staff_member_name' where ID='$id'";
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
            $query = "delete from leave_details where ID='$id'";
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