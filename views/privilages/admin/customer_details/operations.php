<?php 

    require_once('C:/xampp/htdocs/Fitness_For_Everyone/dbconfig.php');
    $db = new dbconfig();
    
    class  operations_customer_details extends dbconfig
    {
        // Insert Record in the Database
        public function Store_Record()
        {
            global $db;
            if(isset($_POST['btn_save']))
            {
		$id = $db->check($_POST['id']);
                $name = $db->check($_POST['name']);
                $age = $db->check($_POST['age']);
		$height = $db->check($_POST['height']);
                $chest = $db->check($_POST['chest']);
                $weight = $db->check($_POST['weight']);
                $issues = $db->check($_POST['issues']);
                $arm_sizes = $db->check($_POST['arm_sizes']);
                $schedule_details_id = $db->check($_POST['schedule_details_id']);
                $customer_progress_id = $db->check($_POST['customer_progress_id']);
                

                if($this->insert_record($id,$name,$age,$height,$chest,$weight,$issues,$arm_sizes,$schedule_details_id,$customer_progress_id))
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
        function insert_record($id,$name,$age,$height,$chest,$weight,$issues,$arm_sizes,$schedule_details_id,$customer_progress_id)
        {
            global $db;
            $query = "insert into customer_details (id,name,age,height,chest,weight,issues,arm_sizes,schedule_details_id,customer_progress_id) values('$id','$name','$age','$height','$chest','$weight','$issues','$arm_sizes','$schedule_details_id','$customer_progress_id')";
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
            $query = "select * from customer_details";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }

        // Get Particular Record
        public function get_record($id)
        {
            global $db;
            $sql = "select * from customer_details where ID='$id'";
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
                $age = $db->check($_POST['age']);
		$height = $db->check($_POST['height']);
                $chest = $db->check($_POST['chest']);
                $weight = $db->check($_POST['weight']);
                $issues = $db->check($_POST['issues']);
                $arm_sizes = $db->check($_POST['arm_sizes']);
                $schedule_details_id = $db->check($_POST['schedule_details_id']);
                $customer_progress_id = $db->check($_POST['customer_progress_id']);

                if($this->update_record($id,$name,$age,$height,$chest,$weight,$issues,$arm_sizes,$schedule_details_id,$customer_progress_id ))
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
        public function update_record($id,$name,$age,$height,$chest,$weight,$issues,$arm_sizes,$schedule_details_id,$customer_progress_id)
        {
            global $db;
            $sql = "update customer_details set name='$name', age='$age',height = '$height', chest='$chest', weight='$weight' issues = '$issues' , arm_sizes = '$arm_sizes' , schedule_details_id = '$schedule_details_id' , customer_progress_id = '$customer_progress_id' where ID='$id'";
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
            $query = "delete from customer_details where ID='$id'";
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