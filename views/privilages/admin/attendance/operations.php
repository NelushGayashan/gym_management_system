<?php 

    require_once('C:/xampp/htdocs/test/common/dbconfig.php');
    $db = new dbconfig();

    class  operations_attendance extends dbconfig
    {
        // Insert Record in the Database
        public function Store_Record()
        {
            global $db;
            if(isset($_POST['btn_save']))
            {
		$id = $db->check($_POST['id']);
                $date = $db->check($_POST['date']);
                $intime = $db->check($_POST['intime']);
		$outtime = $db->check($_POST['outtime']);
                $staff_id = $db->check($_POST['staff_id']);
                $staff_designation_id = $db->check($_POST['staff_designation_id']);

                if($this->insert_record($id,$date,$intime,$outtime,$staff_id,$staff_designation_id))
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
        function insert_record($id,$date,$intime,$outtime,$staff_id,$staff_designation_id)
        {
            global $db;
            $query = "insert into attendance (id,date,intime,outtime, staff_id,staff_designation_id) values('$id','$date','$intime','$outtime','$staff_id','$staff_designation_id')";
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
            $query = "select * from attendance";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }

        // Get Particular Record
        public function get_record($id)
        {
            global $db;
            $sql = "select * from attendance where ID='$id'";
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
                $date = $db->check($_POST['date']);
                $intime = $db->check($_POST['intime']);
				$outtime = $db->check($_POST['outtime']);
                $staff_id = $db->check($_POST['staff_id']);
                $staff_designation_id = $db->check($_POST['staff_designation_id']);

                if($this->update_record($id,$date,$intime,$outtime,$staff_id,$staff_designation_id ))
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
        public function update_record($id,$date,$intime,$outtime,$staff_id,$staff_designation_id)
        {
            global $db;
            $sql = "update attendance set date='$date', intime='$intime',outtime = '$outtime', staff_id='$staff_id', staff_designation_id='$staff_designation_id' where ID='$id'";
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
            $query = "delete from attendance where ID='$id'";
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